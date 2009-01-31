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
%module Geom2dAPI

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


%include Geom2dAPI_dependencies.i


%include Geom2dAPI_headers.i




%nodefaultctor Geom2dAPI_InterCurveCurve;
class Geom2dAPI_InterCurveCurve {
	public:
		%feature("autodoc", "1");
		~Geom2dAPI_InterCurveCurve();
		%feature("autodoc", "1");
		Geom2dAPI_InterCurveCurve();
		%feature("autodoc", "1");
		Geom2dAPI_InterCurveCurve(const Handle_Geom2d_Curve &C1, const Handle_Geom2d_Curve &C2, const Standard_Real Tol=9.99999999999999954748111825886258685613938723691e-7);
		%feature("autodoc", "1");
		Geom2dAPI_InterCurveCurve(const Handle_Geom2d_Curve &C1, const Standard_Real Tol=9.99999999999999954748111825886258685613938723691e-7);
		%feature("autodoc", "1");
		void Init(const Handle_Geom2d_Curve &C1, const Handle_Geom2d_Curve &C2, const Standard_Real Tol=9.99999999999999954748111825886258685613938723691e-7);
		%feature("autodoc", "1");
		void Init(const Handle_Geom2d_Curve &C1, const Standard_Real Tol=9.99999999999999954748111825886258685613938723691e-7);
		%feature("autodoc", "1");
		Standard_Integer NbPoints() const;
		%feature("autodoc", "1");
		gp_Pnt2d Point(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Integer NbSegments() const;
		%feature("autodoc", "1");
		void Segment(const Standard_Integer Index, Handle_Geom2d_Curve & Curve1, Handle_Geom2d_Curve & Curve2) const;
		%feature("autodoc", "1");
		void Segment(const Standard_Integer Index, Handle_Geom2d_Curve & Curve1) const;
		%feature("autodoc", "1");
		const Geom2dInt_GInter & Intersector() const;

};

%nodefaultctor Geom2dAPI_PointsToBSpline;
class Geom2dAPI_PointsToBSpline {
	public:
		%feature("autodoc", "1");
		~Geom2dAPI_PointsToBSpline();
		%feature("autodoc", "1");
		Geom2dAPI_PointsToBSpline();
		%feature("autodoc", "1");
		Geom2dAPI_PointsToBSpline(const TColgp_Array1OfPnt2d &Points, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol2D=9.99999999999999954748111825886258685613938723691e-7);
		%feature("autodoc", "1");
		Geom2dAPI_PointsToBSpline(const TColStd_Array1OfReal &YValues, const Standard_Real X0, const Standard_Real DX, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol2D=9.99999999999999954748111825886258685613938723691e-7);
		%feature("autodoc", "1");
		void Init(const TColgp_Array1OfPnt2d &Points, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol2D=9.99999999999999954748111825886258685613938723691e-7);
		%feature("autodoc", "1");
		void Init(const TColStd_Array1OfReal &YValues, const Standard_Real X0, const Standard_Real DX, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol2D=9.99999999999999954748111825886258685613938723691e-7);
		%feature("autodoc", "1");
		const Handle_Geom2d_BSplineCurve & Curve() const;

};

%nodefaultctor Geom2dAPI_Interpolate;
class Geom2dAPI_Interpolate {
	public:
		%feature("autodoc", "1");
		~Geom2dAPI_Interpolate();
		%feature("autodoc", "1");
		Geom2dAPI_Interpolate(const Handle_TColgp_HArray1OfPnt2d &Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		Geom2dAPI_Interpolate(const Handle_TColgp_HArray1OfPnt2d &Points, const Handle_TColStd_HArray1OfReal &Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		void Load(const gp_Vec2d &InitialTangent, const gp_Vec2d &FinalTangent);
		%feature("autodoc", "1");
		void Load(const TColgp_Array1OfVec2d &Tangents, const Handle_TColStd_HArray1OfBoolean &TangentFlags);
		%feature("autodoc", "1");
		void Perform();
		%feature("autodoc", "1");
		const Handle_Geom2d_BSplineCurve & Curve() const;
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;

};

%nodefaultctor Geom2dAPI_ProjectPointOnCurve;
class Geom2dAPI_ProjectPointOnCurve {
	public:
		%feature("autodoc", "1");
		~Geom2dAPI_ProjectPointOnCurve();
		%feature("autodoc", "1");
		Geom2dAPI_ProjectPointOnCurve();
		%feature("autodoc", "1");
		Geom2dAPI_ProjectPointOnCurve(const gp_Pnt2d &P, const Handle_Geom2d_Curve &Curve);
		%feature("autodoc", "1");
		Geom2dAPI_ProjectPointOnCurve(const gp_Pnt2d &P, const Handle_Geom2d_Curve &Curve, const Quantity_Parameter Umin, const Quantity_Parameter Usup);
		%feature("autodoc", "1");
		void Init(const gp_Pnt2d &P, const Handle_Geom2d_Curve &Curve);
		%feature("autodoc", "1");
		void Init(const gp_Pnt2d &P, const Handle_Geom2d_Curve &Curve, const Quantity_Parameter Umin, const Quantity_Parameter Usup);
		%feature("autodoc", "1");
		Standard_Integer NbPoints() const;
		%feature("autodoc", "1");
		gp_Pnt2d Point(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Quantity_Parameter Parameter(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Parameter(const Standard_Integer Index, Quantity_Parameter & U) const;
		%feature("autodoc", "1");
		Quantity_Length Distance(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		gp_Pnt2d NearestPoint() const;
		%feature("autodoc", "1");
		Quantity_Parameter LowerDistanceParameter() const;
		%feature("autodoc", "1");
		Quantity_Length LowerDistance() const;
		%feature("autodoc", "1");
		const Extrema_ExtPC2d & Extrema() const;

};

%nodefaultctor Geom2dAPI_ExtremaCurveCurve;
class Geom2dAPI_ExtremaCurveCurve {
	public:
		%feature("autodoc", "1");
		~Geom2dAPI_ExtremaCurveCurve();
		%feature("autodoc", "1");
		Geom2dAPI_ExtremaCurveCurve(const Handle_Geom2d_Curve &C1, const Handle_Geom2d_Curve &C2, const Quantity_Parameter U1min, const Quantity_Parameter U1max, const Quantity_Parameter U2min, const Quantity_Parameter U2max);
		%feature("autodoc", "1");
		Standard_Integer NbExtrema() const;
		%feature("autodoc", "1");
		void Points(const Standard_Integer Index, gp_Pnt2d & P1, gp_Pnt2d & P2) const;
		%feature("autodoc", "1");
		void Parameters(const Standard_Integer Index, Quantity_Parameter & U1, Quantity_Parameter & U2) const;
		%feature("autodoc", "1");
		Quantity_Length Distance(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void NearestPoints(gp_Pnt2d & P1, gp_Pnt2d & P2) const;
		%feature("autodoc", "1");
		void LowerDistanceParameters(Quantity_Parameter & U1, Quantity_Parameter & U2) const;
		%feature("autodoc", "1");
		Quantity_Length LowerDistance() const;
		%feature("autodoc", "1");
		const Extrema_ExtCC2d & Extrema() const;

};