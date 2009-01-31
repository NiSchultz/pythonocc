/*
##Copyright 2008-2009 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCascade library.
##
##This software is governed by the CeCILL license under French law and
##abiding by the rules of distribution of free software.  You can  use, 
##modify and/ or redistribute the software under the terms of the CeCILL
##license as circulated by CEA, CNRS and INRIA at the following URL
##"http://www.cecill.info". 
##
##As a counterpart to the access to the source code and  rights to copy,
##modify and redistribute granted by the license, users are provided only
##with a limited warranty  and the software's author,  the holder of the
##economic rights,  and the successive licensors  have only  limited
##liability. 
##
##In this respect, the user's attention is drawn to the risks associated
##with loading,  using,  modifying and/or developing or reproducing the
##software by the user in light of its specific status of free software,
##that may mean  that it is complicated to manipulate,  and  that  also
##therefore means  that it is reserved for developers  and  experienced
##professionals having in-depth computer knowledge. Users are therefore
##encouraged to load and test the software's suitability as regards their
##requirements in conditions enabling the security of their systems and/or 
##data to be ensured and,  more generally, to use and operate it in the 
##same conditions as regards security. 
##
##The fact that you are presently reading this means that you have had
##knowledge of the CeCILL license and that you accept its terms.
*/
%module GccAna

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}


%include GccAna_dependencies.i


%include GccAna_headers.i




%nodefaultctor Handle_GccAna_NoSolution;
class Handle_GccAna_NoSolution : public Handle_Standard_Failure {
	public:
		%feature("autodoc", "1");
		~Handle_GccAna_NoSolution();
		%feature("autodoc", "1");
		Handle_GccAna_NoSolution();
		%feature("autodoc", "1");
		Handle_GccAna_NoSolution(const Handle_GccAna_NoSolution &aHandle);
		%feature("autodoc", "1");
		Handle_GccAna_NoSolution(const GccAna_NoSolution *anItem);
		%feature("autodoc", "1");
		Handle_GccAna_NoSolution const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GccAna_NoSolution {
	GccAna_NoSolution* GetObject() {
	return (GccAna_NoSolution*)$self->Access();
	}
};

%nodefaultctor GccAna_Lin2dTanObl;
class GccAna_Lin2dTanObl {
	public:
		%feature("autodoc", "1");
		~GccAna_Lin2dTanObl();
		%feature("autodoc", "1");
		GccAna_Lin2dTanObl(const gp_Pnt2d &ThePoint, const gp_Lin2d &TheLine, const Standard_Real TheAngle);
		%feature("autodoc", "1");
		GccAna_Lin2dTanObl(const GccEnt_QualifiedCirc &Qualified1, const gp_Lin2d &TheLine, const Standard_Real TheAngle);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		gp_Lin2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1) const;
		%feature("autodoc", "1");
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		void Intersection2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;

};

%nodefaultctor GccAna_Lin2dBisec;
class GccAna_Lin2dBisec {
	public:
		%feature("autodoc", "1");
		~GccAna_Lin2dBisec();
		%feature("autodoc", "1");
		GccAna_Lin2dBisec(const gp_Lin2d &Lin1, const gp_Lin2d &Lin2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		gp_Lin2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Intersection1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		void Intersection2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;

};

%nodefaultctor GccAna_Pnt2dBisec;
class GccAna_Pnt2dBisec {
	public:
		%feature("autodoc", "1");
		~GccAna_Pnt2dBisec();
		%feature("autodoc", "1");
		GccAna_Pnt2dBisec(const gp_Pnt2d &Point1, const gp_Pnt2d &Point2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Boolean HasSolution() const;
		%feature("autodoc", "1");
		gp_Lin2d ThisSolution() const;

};

%nodefaultctor GccAna_Circ2dTanOnRad;
class GccAna_Circ2dTanOnRad {
	public:
		%feature("autodoc", "1");
		~GccAna_Circ2dTanOnRad();
		%feature("autodoc", "1");
		GccAna_Circ2dTanOnRad(const GccEnt_QualifiedCirc &Qualified1, const gp_Lin2d &OnLine, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2dTanOnRad(const GccEnt_QualifiedLin &Qualified1, const gp_Lin2d &OnLine, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2dTanOnRad(const gp_Pnt2d &Point1, const gp_Lin2d &OnLine, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2dTanOnRad(const GccEnt_QualifiedCirc &Qualified1, const gp_Circ2d &OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2dTanOnRad(const GccEnt_QualifiedLin &Qualified1, const gp_Circ2d &OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2dTanOnRad(const gp_Pnt2d &Point1, const gp_Circ2d &OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		gp_Circ2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1) const;
		%feature("autodoc", "1");
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		void CenterOn3(const Standard_Integer Index, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		Standard_Boolean IsTheSame1(const Standard_Integer Index) const;

};

%nodefaultctor GccAna_Circ2dTanCen;
class GccAna_Circ2dTanCen {
	public:
		%feature("autodoc", "1");
		~GccAna_Circ2dTanCen();
		%feature("autodoc", "1");
		GccAna_Circ2dTanCen(const GccEnt_QualifiedCirc &Qualified1, const gp_Pnt2d &Pcenter, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2dTanCen(const gp_Lin2d &Linetan, const gp_Pnt2d &Pcenter);
		%feature("autodoc", "1");
		GccAna_Circ2dTanCen(const gp_Pnt2d &Point1, const gp_Pnt2d &Pcenter);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		gp_Circ2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1) const;
		%feature("autodoc", "1");
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		Standard_Boolean IsTheSame1(const Standard_Integer Index) const;

};

%nodefaultctor GccAna_Lin2dTanPer;
class GccAna_Lin2dTanPer {
	public:
		%feature("autodoc", "1");
		~GccAna_Lin2dTanPer();
		%feature("autodoc", "1");
		GccAna_Lin2dTanPer(const gp_Pnt2d &ThePnt, const gp_Lin2d &TheLin);
		%feature("autodoc", "1");
		GccAna_Lin2dTanPer(const gp_Pnt2d &ThePnt, const gp_Circ2d &TheCircle);
		%feature("autodoc", "1");
		GccAna_Lin2dTanPer(const GccEnt_QualifiedCirc &Qualified1, const gp_Lin2d &TheLin);
		%feature("autodoc", "1");
		GccAna_Lin2dTanPer(const GccEnt_QualifiedCirc &Qualified1, const gp_Circ2d &TheCircle);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1) const;
		%feature("autodoc", "1");
		gp_Lin2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & Pnt) const;
		%feature("autodoc", "1");
		void Intersection2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;

};

%nodefaultctor GccAna_LinPnt2dBisec;
class GccAna_LinPnt2dBisec {
	public:
		%feature("autodoc", "1");
		~GccAna_LinPnt2dBisec();
		%feature("autodoc", "1");
		GccAna_LinPnt2dBisec(const gp_Lin2d &Line1, const gp_Pnt2d &Point2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Handle_GccInt_Bisec ThisSolution() const;

};

%nodefaultctor GccAna_NoSolution;
class GccAna_NoSolution : public Standard_Failure {
	public:
		%feature("autodoc", "1");
		GccAna_NoSolution();
		%feature("autodoc", "1");
		GccAna_NoSolution(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_GccAna_NoSolution NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~GccAna_NoSolution();

};
%extend GccAna_NoSolution {
	Handle_GccAna_NoSolution GetHandle() {
	return *(Handle_GccAna_NoSolution*) &$self;
	}
};

%nodefaultctor GccAna_Circ2d2TanRad;
class GccAna_Circ2d2TanRad {
	public:
		%feature("autodoc", "1");
		~GccAna_Circ2d2TanRad();
		%feature("autodoc", "1");
		GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedCirc &Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedLin &Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc &Qualified1, const gp_Pnt2d &Point2, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanRad(const GccEnt_QualifiedLin &Qualified1, const gp_Pnt2d &Point2, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanRad(const GccEnt_QualifiedLin &Qualified1, const GccEnt_QualifiedLin &Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanRad(const gp_Pnt2d &Point1, const gp_Pnt2d &Point2, const Standard_Real Radius, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		gp_Circ2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2) const;
		%feature("autodoc", "1");
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		Standard_Boolean IsTheSame1(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Boolean IsTheSame2(const Standard_Integer Index) const;

};

%nodefaultctor GccAna_Circ2d3Tan;
class GccAna_Circ2d3Tan {
	public:
		%feature("autodoc", "1");
		~GccAna_Circ2d3Tan();
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedCirc &Qualified2, const GccEnt_QualifiedCirc &Qualified3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedCirc &Qualified2, const GccEnt_QualifiedLin &Qualified3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedLin &Qualified2, const GccEnt_QualifiedLin &Qualified3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const GccEnt_QualifiedLin &Qualified1, const GccEnt_QualifiedLin &Qualified2, const GccEnt_QualifiedLin &Qualified3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedCirc &Qualified2, const gp_Pnt2d &Point3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedLin &Qualified2, const gp_Pnt2d &Point3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const GccEnt_QualifiedLin &Qualified1, const GccEnt_QualifiedLin &Qualified2, const gp_Pnt2d &Point3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc &Qualified1, const gp_Pnt2d &Point2, const gp_Pnt2d &Point3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const GccEnt_QualifiedLin &Qualified1, const gp_Pnt2d &Point2, const gp_Pnt2d &Point3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d3Tan(const gp_Pnt2d &Point1, const gp_Pnt2d &Point2, const gp_Pnt2d &Point3, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		gp_Circ2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2, GccEnt_Position & Qualif3) const;
		%feature("autodoc", "1");
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		void Tangency3(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		Standard_Boolean IsTheSame1(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Boolean IsTheSame2(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Boolean IsTheSame3(const Standard_Integer Index) const;

};

%nodefaultctor GccAna_CircLin2dBisec;
class GccAna_CircLin2dBisec {
	public:
		%feature("autodoc", "1");
		~GccAna_CircLin2dBisec();
		%feature("autodoc", "1");
		GccAna_CircLin2dBisec(const gp_Circ2d &Circle, const gp_Lin2d &Line);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		Handle_GccInt_Bisec ThisSolution(const Standard_Integer Index) const;

};

%nodefaultctor GccAna_Lin2dTanPar;
class GccAna_Lin2dTanPar {
	public:
		%feature("autodoc", "1");
		~GccAna_Lin2dTanPar();
		%feature("autodoc", "1");
		GccAna_Lin2dTanPar(const gp_Pnt2d &ThePoint, const gp_Lin2d &Lin1);
		%feature("autodoc", "1");
		GccAna_Lin2dTanPar(const GccEnt_QualifiedCirc &Qualified1, const gp_Lin2d &Lin1);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		gp_Lin2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1) const;
		%feature("autodoc", "1");
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & Pnt) const;

};

%nodefaultctor GccAna_CircPnt2dBisec;
class GccAna_CircPnt2dBisec {
	public:
		%feature("autodoc", "1");
		~GccAna_CircPnt2dBisec();
		%feature("autodoc", "1");
		GccAna_CircPnt2dBisec(const gp_Circ2d &Circle1, const gp_Pnt2d &Point2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		Handle_GccInt_Bisec ThisSolution(const Standard_Integer Index) const;

};

%nodefaultctor GccAna_Circ2dBisec;
class GccAna_Circ2dBisec {
	public:
		%feature("autodoc", "1");
		~GccAna_Circ2dBisec();
		%feature("autodoc", "1");
		GccAna_Circ2dBisec(const gp_Circ2d &Circ1, const gp_Circ2d &Circ2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		Handle_GccInt_Bisec ThisSolution(const Standard_Integer Index) const;

};

%nodefaultctor GccAna_Circ2d2TanOn;
class GccAna_Circ2d2TanOn {
	public:
		%feature("autodoc", "1");
		~GccAna_Circ2d2TanOn();
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedCirc &Qualified2, const gp_Lin2d &OnLine, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedLin &Qualified2, const gp_Lin2d &OnLine, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin &Qualified1, const GccEnt_QualifiedLin &Qualified2, const gp_Lin2d &OnLine, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc &Qualified1, const gp_Pnt2d &Point2, const gp_Lin2d &OnLine, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin &Qualified1, const gp_Pnt2d &Point2, const gp_Lin2d &OnLine, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const gp_Pnt2d &Point1, const gp_Pnt2d &Point2, const gp_Lin2d &OnLine, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedCirc &Qualified2, const gp_Circ2d &OnCirc, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedLin &Qualified2, const gp_Circ2d &OnCirc, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc &Qualified1, const gp_Pnt2d &Point2, const gp_Circ2d &OnCirc, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin &Qualified1, const GccEnt_QualifiedLin &Qualified2, const gp_Circ2d &OnCirc, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin &Qualified1, const gp_Pnt2d &Point2, const gp_Circ2d &OnCirc, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Circ2d2TanOn(const gp_Pnt2d &Point1, const gp_Pnt2d &Point2, const gp_Circ2d &OnCirc, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		gp_Circ2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2) const;
		%feature("autodoc", "1");
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		void CenterOn3(const Standard_Integer Index, Standard_Real &OutValue, gp_Pnt2d & PntArg) const;
		%feature("autodoc", "1");
		Standard_Boolean IsTheSame1(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Boolean IsTheSame2(const Standard_Integer Index) const;

};

%nodefaultctor GccAna_Lin2d2Tan;
class GccAna_Lin2d2Tan {
	public:
		%feature("autodoc", "1");
		~GccAna_Lin2d2Tan();
		%feature("autodoc", "1");
		GccAna_Lin2d2Tan(const gp_Pnt2d &ThePoint1, const gp_Pnt2d &ThePoint2, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Lin2d2Tan(const GccEnt_QualifiedCirc &Qualified1, const gp_Pnt2d &ThePoint, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GccAna_Lin2d2Tan(const GccEnt_QualifiedCirc &Qualified1, const GccEnt_QualifiedCirc &Qualified2, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolutions() const;
		%feature("autodoc", "1");
		gp_Lin2d ThisSolution(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2) const;
		%feature("autodoc", "1");
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;
		%feature("autodoc", "1");
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol) const;

};