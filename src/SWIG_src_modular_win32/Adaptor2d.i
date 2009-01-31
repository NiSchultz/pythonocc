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
%module Adaptor2d

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


%include Adaptor2d_dependencies.i


%include Adaptor2d_headers.i

typedef Adaptor2d_Curve2d * Adaptor2d_Curve2dPtr;



%nodefaultctor Handle_Adaptor2d_HCurve2d;
class Handle_Adaptor2d_HCurve2d : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_Adaptor2d_HCurve2d();
		%feature("autodoc", "1");
		Handle_Adaptor2d_HCurve2d();
		%feature("autodoc", "1");
		Handle_Adaptor2d_HCurve2d(const Handle_Adaptor2d_HCurve2d &aHandle);
		%feature("autodoc", "1");
		Handle_Adaptor2d_HCurve2d(const Adaptor2d_HCurve2d *anItem);
		%feature("autodoc", "1");
		Handle_Adaptor2d_HCurve2d const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor2d_HCurve2d {
	Adaptor2d_HCurve2d* GetObject() {
	return (Adaptor2d_HCurve2d*)$self->Access();
	}
};

%nodefaultctor Handle_Adaptor2d_HLine2d;
class Handle_Adaptor2d_HLine2d : public Handle_Adaptor2d_HCurve2d {
	public:
		%feature("autodoc", "1");
		~Handle_Adaptor2d_HLine2d();
		%feature("autodoc", "1");
		Handle_Adaptor2d_HLine2d();
		%feature("autodoc", "1");
		Handle_Adaptor2d_HLine2d(const Handle_Adaptor2d_HLine2d &aHandle);
		%feature("autodoc", "1");
		Handle_Adaptor2d_HLine2d(const Adaptor2d_HLine2d *anItem);
		%feature("autodoc", "1");
		Handle_Adaptor2d_HLine2d const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor2d_HLine2d {
	Adaptor2d_HLine2d* GetObject() {
	return (Adaptor2d_HLine2d*)$self->Access();
	}
};

%nodefaultctor Adaptor2d_Curve2d;
class Adaptor2d_Curve2d {
	public:
		%feature("autodoc", "1");
		Adaptor2d_Curve2d();
		%feature("autodoc", "1");
		virtual		void Delete();
		%feature("autodoc", "1");
		virtual		~Adaptor2d_Curve2d();
		%feature("autodoc", "1");
		virtual		Standard_Real FirstParameter() const;
		%feature("autodoc", "1");
		virtual		Standard_Real LastParameter() const;
		%feature("autodoc", "1");
		virtual		GeomAbs_Shape Continuity() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NbIntervals(const GeomAbs_Shape S) const;
		%feature("autodoc", "1");
		virtual		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S) const;
		%feature("autodoc", "1");
		virtual		Handle_Adaptor2d_HCurve2d Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsClosed() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsPeriodic() const;
		%feature("autodoc", "1");
		virtual		Standard_Real Period() const;
		%feature("autodoc", "1");
		virtual		gp_Pnt2d Value(const Standard_Real U) const;
		%feature("autodoc", "1");
		virtual		void D0(const Standard_Real U, gp_Pnt2d & P) const;
		%feature("autodoc", "1");
		virtual		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V) const;
		%feature("autodoc", "1");
		virtual		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2) const;
		%feature("autodoc", "1");
		virtual		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3) const;
		%feature("autodoc", "1");
		virtual		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N) const;
		%feature("autodoc", "1");
		virtual		Standard_Real Resolution(const Standard_Real R3d) const;
		%feature("autodoc", "1");
		virtual		GeomAbs_CurveType GetType() const;
		%feature("autodoc", "1");
		virtual		gp_Lin2d Line() const;
		%feature("autodoc", "1");
		virtual		gp_Circ2d Circle() const;
		%feature("autodoc", "1");
		virtual		gp_Elips2d Ellipse() const;
		%feature("autodoc", "1");
		virtual		gp_Hypr2d Hyperbola() const;
		%feature("autodoc", "1");
		virtual		gp_Parab2d Parabola() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer Degree() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsRational() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NbPoles() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NbKnots() const;
		%feature("autodoc", "1");
		virtual		Handle_Geom2d_BezierCurve Bezier() const;
		%feature("autodoc", "1");
		virtual		Handle_Geom2d_BSplineCurve BSpline() const;

};

%nodefaultctor Adaptor2d_Line2d;
class Adaptor2d_Line2d : public Adaptor2d_Curve2d {
	public:
		%feature("autodoc", "1");
		Adaptor2d_Line2d();
		%feature("autodoc", "1");
		Adaptor2d_Line2d(const gp_Pnt2d &P, const gp_Dir2d &D, const Standard_Real UFirst, const Standard_Real ULast);
		%feature("autodoc", "1");
		void Load(const gp_Lin2d &L);
		%feature("autodoc", "1");
		void Load(const gp_Lin2d &L, const Standard_Real UFirst, const Standard_Real ULast);
		%feature("autodoc", "1");
		virtual		gp_Pnt2d Value(const Standard_Real X) const;
		%feature("autodoc", "1");
		virtual		void D0(const Standard_Real X, gp_Pnt2d & P) const;
		%feature("autodoc", "1");
		virtual		void D1(const Standard_Real X, gp_Pnt2d & P, gp_Vec2d & V) const;
		%feature("autodoc", "1");
		virtual		void D2(const Standard_Real X, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2) const;
		%feature("autodoc", "1");
		virtual		void D3(const Standard_Real X, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3) const;
		%feature("autodoc", "1");
		virtual		~Adaptor2d_Line2d();

};

%nodefaultctor Adaptor2d_HCurve2d;
class Adaptor2d_HCurve2d : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		const Adaptor2d_Curve2d & Curve2d() const;
		%feature("autodoc", "1");
		Standard_Real FirstParameter() const;
		%feature("autodoc", "1");
		Standard_Real LastParameter() const;
		%feature("autodoc", "1");
		GeomAbs_Shape Continuity() const;
		%feature("autodoc", "1");
		Standard_Integer NbIntervals(const GeomAbs_Shape S) const;
		%feature("autodoc", "1");
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S) const;
		%feature("autodoc", "1");
		Handle_Adaptor2d_HCurve2d Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol) const;
		%feature("autodoc", "1");
		Standard_Boolean IsClosed() const;
		%feature("autodoc", "1");
		Standard_Boolean IsPeriodic() const;
		%feature("autodoc", "1");
		Standard_Real Period() const;
		%feature("autodoc", "1");
		gp_Pnt2d Value(const Standard_Real U) const;
		%feature("autodoc", "1");
		void D0(const Standard_Real U, gp_Pnt2d & P) const;
		%feature("autodoc", "1");
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V) const;
		%feature("autodoc", "1");
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2) const;
		%feature("autodoc", "1");
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3) const;
		%feature("autodoc", "1");
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N) const;
		%feature("autodoc", "1");
		Standard_Real Resolution(const Standard_Real R3d) const;
		%feature("autodoc", "1");
		GeomAbs_CurveType GetType() const;
		%feature("autodoc", "1");
		gp_Lin2d Line() const;
		%feature("autodoc", "1");
		gp_Circ2d Circle() const;
		%feature("autodoc", "1");
		gp_Elips2d Ellipse() const;
		%feature("autodoc", "1");
		gp_Hypr2d Hyperbola() const;
		%feature("autodoc", "1");
		gp_Parab2d Parabola() const;
		%feature("autodoc", "1");
		Standard_Integer Degree() const;
		%feature("autodoc", "1");
		Standard_Boolean IsRational() const;
		%feature("autodoc", "1");
		Standard_Integer NbPoles() const;
		%feature("autodoc", "1");
		Standard_Integer NbKnots() const;
		%feature("autodoc", "1");
		Handle_Geom2d_BezierCurve Bezier() const;
		%feature("autodoc", "1");
		virtual		Handle_Geom2d_BSplineCurve BSpline() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Adaptor2d_HCurve2d {
	Handle_Adaptor2d_HCurve2d GetHandle() {
	return *(Handle_Adaptor2d_HCurve2d*) &$self;
	}
};

%nodefaultctor Adaptor2d_HLine2d;
class Adaptor2d_HLine2d : public Adaptor2d_HCurve2d {
	public:
		%feature("autodoc", "1");
		Adaptor2d_HLine2d();
		%feature("autodoc", "1");
		Adaptor2d_HLine2d(const Adaptor2d_Line2d &C);
		%feature("autodoc", "1");
		void Set(const Adaptor2d_Line2d &C);
		%feature("autodoc", "1");
		virtual		const Adaptor2d_Curve2d & Curve2d() const;
		%feature("autodoc", "1");
		Adaptor2d_Line2d & ChangeCurve2d();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Adaptor2d_HLine2d();

};
%extend Adaptor2d_HLine2d {
	Handle_Adaptor2d_HLine2d GetHandle() {
	return *(Handle_Adaptor2d_HLine2d*) &$self;
	}
};