##Copyright 2009 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU General Public License for more details.
##
##You should have received a copy of the GNU General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

from OCC.SGEOM import GEOM_Solver,GEOM_Parameter
from OCC.TDF import TDF_LabelSequence
from OCC.TCollection import TCollection_AsciiString
from sympy import Symbol

def symb(parameter_tuple):
    """ Returns the sympy symbol to define the relations
    """
    return parameter_tuple[0].GetSymbol()

def value(parameter_tuple):
    """ Returns the value of the parameter
    """
    return parameter_tuple[1]

class MyTuple(tuple):
    """ This class allows to do the following:
    t = (GEOM_Parameter,12)
    t + 3 -> 15
    t - 2 -> 10
    t * 4 -> 48
    etc.
    """
    def __add__(self,value):
        return self[1] + value
    
    def __sub__(self,value):
        return self[1] - value
    
    def __mul__(self,value):
        return self[1] * value
    
    def __div__(self,value):
        return self[1] / value

    def get_value(self):
        """ Returns the value of this tuple
        """
        return self[1]
    
class Relation(object):
    """ Defines a relation between two or more parameters
    """
    def __init__(self,parameter_class,string_parameter_name,relation):
        # The relation is actually a sympy equation
        self._relation = relation
        self.p1 = parameter_class
        self.p2 = string_parameter_name
        self.p1.register_relation(self)
        self.already_performed = False
        self._subs = {}
                
    def BuildSubs(self):
        """ First have to set all the parameters keys/values so that sympy can compute
        the relation
        """
        d = {}
        parameter_names = self.p1.GetAllParameters().keys()
        for parameter_name in parameter_names:
            param_tuple = self.p1.__getattribute__(parameter_name)           
            d[symb(param_tuple)] = value(param_tuple)
        self._subs = d
        
    def Perform(self):
        self.BuildSubs() #necessary to update with all current values
        new_parameter_value = float(self._relation.evalf(subs=self._subs))
        # Compare with the old value to avoid setting the parameter
        # and have infinte recurrent calls 
        old_value = self.p1.__getattribute__(self.p2)[1]
        if not abs(new_parameter_value-old_value)<0.0001:
            self.p1.__setattr__(self.p2,new_parameter_value)
        
class Parameter(GEOM_Parameter):
    def __init__(self, name):
        # Check if the param name is a string
        assert(isinstance(name,str))
        # Init parameter
        self._name = name
        GEOM_Parameter.__init__(self,TCollection_AsciiString(name))
        print "Parameter %s created"%name
        # Create a sympy Symbol so that it's possible to include it in a relation
        self._symbol = Symbol(name)
    
    def GetSymbol(self):
        return self._symbol
        
    def GetValue(self):
        """ Returns the value of the parameter
        """
        # First retrieve the parameter value from the 'parameters' container
        v = parameters.__getattribute__(self._name)
        # Then return this float value
        return v
    
#    def __add__(self,value):
#        if self.IsDouble() and (isinstance(value,int) or isinstance(value,float)):
#            return self.GetDouble() + value
#        elif self.IsString() and (isinstance(value,str)):
#            return self.GetString() + value
#        else:
#            # trying to make "X"+3 for instance
#            k = parameters.__getattribute__(self._name)
#            print k
#            sys.exit()
#                                
        
class Rule(object):
    def __init__(self, parameter_class, string_parameter_name, function):#,parameter_object,p):
        """ Adds a rule over the parameter
        """
        self.attach_parameter(parameter_class,string_parameter_name)
        self.register_condition(function)
        
    def attach_parameter(self,parameter_class,string_parameter_name):
        """ For instance, attach_parameter(parameters,"X")
        """
        self.p1 = parameter_class
        self.p2 = string_parameter_name
        self.p1.register_rule(self)
        
    def register_condition(self,call):
        assert callable(call)
        self._function = call

    def Check(self):
        value = self.p1.__getattribute__(self.p2)[1]
        assert self._function(value),'Rule broken over parameter %s'%self.p2

class Parameters(object):
    """ This class defines a set of parameters that are handled by both
    pythonOCC and SalomeGEOM
    """
    def __init__(self, context ):
        object.__setattr__(self, 'context', context)
        object.__setattr__(self, 'engine', context.engine)
        object.__setattr__(self, 'docId', context.docId)
        object.__setattr__(self, 'solvers', [])
        object.__setattr__(self, 'callbacks', [])
        object.__setattr__(self, '_parameters', {})
        # register solvers available in the given context
        for solver in context.solvers:
            self.register_solver(solver)
        
    def register_solver(self, solver):
        assert isinstance( solver, GEOM_Solver), '%s is not a GEOM_Solver instance' % ( solver.__class__ )
        self.solvers.append(solver)
    
    def register_callback(self, call):
        """ Defines a callback for the parameter
        """
        if callable(call):
            self.callbacks.append(call)
        else:
            raise TypeError('%s is not a callable object' % ( call.__class__ ) )
        print "Callback added"
    
    def register_relation(self,relation):
        """ Adds a relation to this set of parameters
        """
        if isinstance(relation,Relation):
            self.register_callback(relation.Perform)
        else:
            raise TypeError('%s is not a Relation object' % ( call.__class__ ) )
        
    def register_rule(self,rule):
        """
        Adds a rule to this parameter. Each time the parameter is updated,
        then the rule is checked"""
        if isinstance(rule,Rule):
            self.register_callback(rule.Check)
        else:
            raise TypeError('%s is not a Rule object' % ( call.__class__ ) )

    def GetAllParameters(self):
        """ Returns the dict of all defined parameters
        """
        return self._parameters
    
    def __setattr__(self, name, value):
        """if an attribute is a numerical value ( integer or float )
        than its considered to be a parameter
        hence, the interpreter constant is updated
        and all solvers that have been added are updated
        """
        # Type checking of the value passed
        if not (isinstance(value, int) or isinstance(value, float)):
            raise TypeError('A parameter ( that is an attribute of the class Parameters ) is either a float or integer')

        # Set the attribute value    
        object.__setattr__(self, name, value)
        docId = object.__getattribute__(self, 'docId')
        
        self.context.doc.NewCommand()
        self.context.engine.SetInterpreterConstant(docId,TCollection_AsciiString(name),value)

        # update registered solvers
        for solver in self.solvers:
            seq = TDF_LabelSequence() 
            #print 'calling solver:', solver.__class__
            solver.Update(docId, seq)

        # call registered callbacks    
        for callback in self.callbacks:
            #print 'calling callback:', callback
            callback()

        self.context.doc.CommitCommand()
        # Create the parameter
        if not self._parameters.has_key(name):
            self._parameters[name] = Parameter(name)
       
    def __getattribute__(self, name):
        attr = object.__getattribute__(self, name)
        if isinstance(attr, int) or isinstance(attr, float):
            print 'parameter: %s value: %s' % (name, attr)                     
            return MyTuple((self._parameters[name],attr))
        else:
            return attr