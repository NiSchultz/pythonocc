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
%module GeomInt

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


%include GeomInt_dependencies.i


%include GeomInt_headers.i




%nodefaultctor Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation;
class Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation();
		%feature("autodoc", "1");
		Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation(const Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation &aHandle);
		%feature("autodoc", "1");
		Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation(const GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation *anItem);
		%feature("autodoc", "1");
		Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation {
	GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation* GetObject() {
	return (GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation*)$self->Access();
	}
};
%extend Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation {
	~Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation() {
	printf("Call custom destructor for instance of Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation\n");
	}
};

%nodefaultctor GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve Value() const;
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		Standard_Real AverageError() const;

};

%nodefaultctor GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox : public math_BFGS {
	public:
		%feature("autodoc", "1");
		GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector &StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F) const;
		%feature("autodoc", "1");
		virtual		~GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox();

};

%nodefaultctor GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations=1);
		%feature("autodoc", "1");
		GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, math_Vector & Parameters, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations, const Standard_Real lambda1, const Standard_Real lambda2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiBSpCurve Value() const;
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		Standard_Real AverageError() const;

};

%nodefaultctor GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox;
class GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "1");
		GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox(const Handle_Adaptor3d_HSurface &PS, const IntSurf_Quadric &IS);
		%feature("autodoc", "1");
		GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox(const IntSurf_Quadric &IS);
		%feature("autodoc", "1");
		void Set(const Handle_Adaptor3d_HSurface &PS);
		%feature("autodoc", "1");
		void SetImplicitSurface(const IntSurf_Quadric &IS);
		%feature("autodoc", "1");
		void Set(const Standard_Real Tol);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NbEquations() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, math_Vector & F);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Derivatives(const math_Vector &X, math_Matrix & D);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, math_Vector & F, math_Matrix & D);
		%feature("autodoc", "1");
		Standard_Real Root() const;
		%feature("autodoc", "1");
		Standard_Real Tolerance() const;
		%feature("autodoc", "1");
		const gp_Pnt & Point() const;
		%feature("autodoc", "1");
		Standard_Boolean IsTangent();
		%feature("autodoc", "1");
		const gp_Vec & Direction3d();
		%feature("autodoc", "1");
		const gp_Dir2d & Direction2d();
		%feature("autodoc", "1");
		const Handle_Adaptor3d_HSurface & PSurface() const;
		%feature("autodoc", "1");
		const IntSurf_Quadric & ISurface() const;
		%feature("autodoc", "1");
		virtual		~GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox();

};

%nodefaultctor GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("autodoc", "1");
		GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const math_Vector &Parameters, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Gradient(const math_Vector &X, math_Vector & G);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, Standard_Real &OutValue, math_Vector & G);
		%feature("autodoc", "1");
		const math_Vector & NewParameters() const;
		%feature("autodoc", "1");
		AppParCurves_MultiBSpCurve CurveValue();
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex);
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		const math_Matrix & FunctionMatrix() const;
		%feature("autodoc", "1");
		const math_Matrix & DerivativeFunctionMatrix() const;
		%feature("autodoc", "1");
		const math_IntegerVector & Index() const;
		%feature("autodoc", "1");
		AppParCurves_Constraint FirstConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer FirstPoint) const;
		%feature("autodoc", "1");
		AppParCurves_Constraint LastConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer LastPoint) const;
		%feature("autodoc", "1");
		void SetFirstLambda(const Standard_Real l1);
		%feature("autodoc", "1");
		void SetLastLambda(const Standard_Real l2);
		%feature("autodoc", "1");
		virtual		~GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox();

};

%nodefaultctor GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("autodoc", "1");
		GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const math_Vector &Parameters, const Standard_Integer Deg);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Gradient(const math_Vector &X, math_Vector & G);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, Standard_Real &OutValue, math_Vector & G);
		%feature("autodoc", "1");
		const math_Vector & NewParameters() const;
		%feature("autodoc", "1");
		const AppParCurves_MultiCurve & CurveValue();
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		AppParCurves_Constraint FirstConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer FirstPoint) const;
		%feature("autodoc", "1");
		AppParCurves_Constraint LastConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer LastPoint) const;
		%feature("autodoc", "1");
		virtual		~GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox();

};

%nodefaultctor GeomInt_SequenceOfParameterAndOrientation;
class GeomInt_SequenceOfParameterAndOrientation : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		GeomInt_SequenceOfParameterAndOrientation();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~GeomInt_SequenceOfParameterAndOrientation();
		%feature("autodoc", "1");
		const GeomInt_SequenceOfParameterAndOrientation & Assign(const GeomInt_SequenceOfParameterAndOrientation &Other);
		%feature("autodoc", "1");
		void Append(const GeomInt_ParameterAndOrientation &T);
		%feature("autodoc", "1");
		void Append(GeomInt_SequenceOfParameterAndOrientation & S);
		%feature("autodoc", "1");
		void Prepend(const GeomInt_ParameterAndOrientation &T);
		%feature("autodoc", "1");
		void Prepend(GeomInt_SequenceOfParameterAndOrientation & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const GeomInt_ParameterAndOrientation &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, GeomInt_SequenceOfParameterAndOrientation & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const GeomInt_ParameterAndOrientation &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, GeomInt_SequenceOfParameterAndOrientation & S);
		%feature("autodoc", "1");
		const GeomInt_ParameterAndOrientation & First() const;
		%feature("autodoc", "1");
		const GeomInt_ParameterAndOrientation & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, GeomInt_SequenceOfParameterAndOrientation & S);
		%feature("autodoc", "1");
		const GeomInt_ParameterAndOrientation & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const GeomInt_ParameterAndOrientation & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const GeomInt_ParameterAndOrientation &I);
		%feature("autodoc", "1");
		GeomInt_ParameterAndOrientation & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		GeomInt_ParameterAndOrientation & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox;
class GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const math_Vector &V1c, const math_Vector &V2c, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve BezierValue();
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & BSplineValue();
		%feature("autodoc", "1");
		const math_Matrix & FunctionMatrix() const;
		%feature("autodoc", "1");
		const math_Matrix & DerivativeFunctionMatrix() const;
		%feature("autodoc", "1");
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		const math_Matrix & Distance();
		%feature("autodoc", "1");
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		Standard_Real FirstLambda() const;
		%feature("autodoc", "1");
		Standard_Real LastLambda() const;
		%feature("autodoc", "1");
		const math_Matrix & Points() const;
		%feature("autodoc", "1");
		const math_Matrix & Poles() const;
		%feature("autodoc", "1");
		const math_IntegerVector & KIndex() const;

};

%nodefaultctor GeomInt_TheMultiLineOfWLApprox;
class GeomInt_TheMultiLineOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_TheMultiLineOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_TheMultiLineOfWLApprox(const Handle_IntPatch_TheWLineOfIntersection &line, const Standard_Address PtrSvSurfaces, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Real xo, const Standard_Real ax, const Standard_Real yo, const Standard_Real ay, const Standard_Real zo, const Standard_Real az, const Standard_Real u1o, const Standard_Real a1u, const Standard_Real v1o, const Standard_Real a1v, const Standard_Real u2o, const Standard_Real a2u, const Standard_Real v2o, const Standard_Real a2v, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin=0, const Standard_Integer IndMax=0);
		%feature("autodoc", "1");
		GeomInt_TheMultiLineOfWLApprox(const Handle_IntPatch_TheWLineOfIntersection &line, const Standard_Integer NbP3d, const Standard_Integer NbP2d, const Standard_Real xo, const Standard_Real ax, const Standard_Real yo, const Standard_Real ay, const Standard_Real zo, const Standard_Real az, const Standard_Real u1o, const Standard_Real a1u, const Standard_Real v1o, const Standard_Real a1v, const Standard_Real u2o, const Standard_Real a2u, const Standard_Real v2o, const Standard_Real a2v, const Standard_Boolean P2DOnFirst, const Standard_Integer IndMin=0, const Standard_Integer IndMax=0);
		%feature("autodoc", "1");
		Standard_Integer FirstPoint() const;
		%feature("autodoc", "1");
		Standard_Integer LastPoint() const;
		%feature("autodoc", "1");
		Standard_Integer NbP2d() const;
		%feature("autodoc", "1");
		Standard_Integer NbP3d() const;
		%feature("autodoc", "1");
		Approx_Status WhatStatus() const;
		%feature("autodoc", "1");
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt) const;
		%feature("autodoc", "1");
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt2d & tabPt2d) const;
		%feature("autodoc", "1");
		void Value(const Standard_Integer MPointIndex, TColgp_Array1OfPnt & tabPt, TColgp_Array1OfPnt2d & tabPt2d) const;
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV) const;
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec2d & tabV2d) const;
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const Standard_Integer MPointIndex, TColgp_Array1OfVec & tabV, TColgp_Array1OfVec2d & tabV2d) const;
		%feature("autodoc", "1");
		GeomInt_TheMultiLineOfWLApprox MakeMLBetween(const Standard_Integer Low, const Standard_Integer High, const Standard_Integer NbPointsToInsert) const;

};

%nodefaultctor GeomInt_ThePrmPrmSvSurfacesOfWLApprox;
class GeomInt_ThePrmPrmSvSurfacesOfWLApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("autodoc", "1");
		GeomInt_ThePrmPrmSvSurfacesOfWLApprox(const Handle_Adaptor3d_HSurface &Surf1, const Handle_Adaptor3d_HSurface &Surf2);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);
		%feature("autodoc", "1");
		virtual		void Pnt(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Pnt & P);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Tangency(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & Tg);
		%feature("autodoc", "1");
		virtual		Standard_Boolean TangencyOnSurf1(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);
		%feature("autodoc", "1");
		virtual		Standard_Boolean TangencyOnSurf2(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);
		%feature("autodoc", "1");
		virtual		~GeomInt_ThePrmPrmSvSurfacesOfWLApprox();

};

%nodefaultctor GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox : public math_BFGS {
	public:
		%feature("autodoc", "1");
		GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector &StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F) const;
		%feature("autodoc", "1");
		virtual		~GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox();

};

%nodefaultctor GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("autodoc", "1");
		GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const math_Vector &Parameters, const Standard_Integer Deg);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Gradient(const math_Vector &X, math_Vector & G);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, Standard_Real &OutValue, math_Vector & G);
		%feature("autodoc", "1");
		const math_Vector & NewParameters() const;
		%feature("autodoc", "1");
		const AppParCurves_MultiCurve & CurveValue();
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer IPoint, const Standard_Integer CurveIndex) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		AppParCurves_Constraint FirstConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer FirstPoint) const;
		%feature("autodoc", "1");
		AppParCurves_Constraint LastConstraint(const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, const Standard_Integer LastPoint) const;
		%feature("autodoc", "1");
		virtual		~GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox();

};

%nodefaultctor GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
class GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "1");
		GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const Handle_Adaptor3d_HSurface &S1, const Handle_Adaptor3d_HSurface &S2);
		%feature("autodoc", "1");
		virtual		Standard_Integer NbVariables() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NbEquations() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const math_Vector &X, math_Vector & F);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Derivatives(const math_Vector &X, math_Matrix & D);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const math_Vector &X, math_Vector & F, math_Matrix & D);
		%feature("autodoc", "1");
		void ComputeParameters(const IntImp_ConstIsoparametric ChoixIso, const TColStd_Array1OfReal &Param, math_Vector & UVap, math_Vector & BornInf, math_Vector & BornSup, math_Vector & Tolerance);
		%feature("autodoc", "1");
		Standard_Real Root() const;
		%feature("autodoc", "1");
		gp_Pnt Point() const;
		%feature("autodoc", "1");
		Standard_Boolean IsTangent(const math_Vector &UVap, TColStd_Array1OfReal & Param, IntImp_ConstIsoparametric & BestChoix);
		%feature("autodoc", "1");
		gp_Dir Direction() const;
		%feature("autodoc", "1");
		gp_Dir2d DirectionOnS1() const;
		%feature("autodoc", "1");
		gp_Dir2d DirectionOnS2() const;
		%feature("autodoc", "1");
		const Handle_Adaptor3d_HSurface & AuxillarSurface1() const;
		%feature("autodoc", "1");
		const Handle_Adaptor3d_HSurface & AuxillarSurface2() const;
		%feature("autodoc", "1");
		virtual		~GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox();

};

%nodefaultctor GeomInt_TheComputeLineBezierOfWLApprox;
class GeomInt_TheComputeLineBezierOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_TheComputeLineBezierOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_TheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &Line, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		GeomInt_TheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &Line, const math_Vector &Parameters, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		GeomInt_TheComputeLineBezierOfWLApprox(const math_Vector &Parameters, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		GeomInt_TheComputeLineBezierOfWLApprox(const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		void Init(const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		void Perform(const GeomInt_TheMultiLineOfWLApprox &Line);
		%feature("autodoc", "1");
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);
		%feature("autodoc", "1");
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);
		%feature("autodoc", "1");
		void SetConstraints(const AppParCurves_Constraint firstC, const AppParCurves_Constraint lastC);
		%feature("autodoc", "1");
		Standard_Boolean IsAllApproximated() const;
		%feature("autodoc", "1");
		Standard_Boolean IsToleranceReached() const;
		%feature("autodoc", "1");
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		Standard_Integer NbMultiCurves() const;
		%feature("autodoc", "1");
		const AppParCurves_MultiCurve & Value(const Standard_Integer Index=1) const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve & ChangeValue(const Standard_Integer Index=1);
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & SplineValue();
		%feature("autodoc", "1");
		void Parametrization(Approx_ParametrizationType & partype) const;
		%feature("autodoc", "1");
		const TColStd_Array1OfReal & Parameters(const Standard_Integer Index=1) const;

};

%nodefaultctor GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const math_Vector &V1c, const math_Vector &V2c, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve BezierValue();
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & BSplineValue();
		%feature("autodoc", "1");
		const math_Matrix & FunctionMatrix() const;
		%feature("autodoc", "1");
		const math_Matrix & DerivativeFunctionMatrix() const;
		%feature("autodoc", "1");
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		const math_Matrix & Distance();
		%feature("autodoc", "1");
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		Standard_Real FirstLambda() const;
		%feature("autodoc", "1");
		Standard_Real LastLambda() const;
		%feature("autodoc", "1");
		const math_Matrix & Points() const;
		%feature("autodoc", "1");
		const math_Matrix & Poles() const;
		%feature("autodoc", "1");
		const math_IntegerVector & KIndex() const;

};

%nodefaultctor GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation;
class GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation(const GeomInt_ParameterAndOrientation &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		GeomInt_ParameterAndOrientation & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation {
	Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation GetHandle() {
	return *(Handle_GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation*) &$self;
	}
};
%extend GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation {
	~GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation() {
	printf("Call custom destructor for instance of GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation\n");
	}
};

%nodefaultctor GeomInt_LineTool;
class GeomInt_LineTool {
	public:
		%feature("autodoc", "1");
		~GeomInt_LineTool();
		%feature("autodoc", "1");
		GeomInt_LineTool();
		%feature("autodoc", "1");
		Standard_Integer NbVertex(const Handle_IntPatch_Line &L);
		%feature("autodoc", "1");
		const IntPatch_ThePointOfIntersection & Vertex(const Handle_IntPatch_Line &L, const Standard_Integer I);
		%feature("autodoc", "1");
		Standard_Real FirstParameter(const Handle_IntPatch_Line &L);
		%feature("autodoc", "1");
		Standard_Real LastParameter(const Handle_IntPatch_Line &L);

};

%nodefaultctor GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox;
class GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox : public math_BFGS {
	public:
		%feature("autodoc", "1");
		GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox(math_MultipleVarFunctionWithGradient & F, const math_Vector &StartingPoint, const Standard_Real Tolerance3d, const Standard_Real Tolerance2d, const Standard_Real Eps, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F) const;
		%feature("autodoc", "1");
		virtual		~GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox();

};

%nodefaultctor GeomInt_MyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_MyGradientbisOfTheComputeLineOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_MyGradientbisOfTheComputeLineOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_MyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const Handle_AppParCurves_HArray1OfConstraintCouple &TheConstraints, math_Vector & Parameters, const Standard_Integer Deg, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIterations=200);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve Value() const;
		%feature("autodoc", "1");
		Standard_Real Error(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_Real MaxError3d() const;
		%feature("autodoc", "1");
		Standard_Real MaxError2d() const;
		%feature("autodoc", "1");
		Standard_Real AverageError() const;

};

%nodefaultctor GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox;
class GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const math_Vector &Parameters, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &SSP, const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults, const Standard_Integer FirstPoint, const Standard_Integer LastPoint, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer NbPol);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		void Perform(const math_Vector &Parameters, const math_Vector &V1t, const math_Vector &V2t, const math_Vector &V1c, const math_Vector &V2c, const Standard_Real l1, const Standard_Real l2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		AppParCurves_MultiCurve BezierValue();
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & BSplineValue();
		%feature("autodoc", "1");
		const math_Matrix & FunctionMatrix() const;
		%feature("autodoc", "1");
		const math_Matrix & DerivativeFunctionMatrix() const;
		%feature("autodoc", "1");
		void ErrorGradient(math_Vector & Grad, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		const math_Matrix & Distance();
		%feature("autodoc", "1");
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		Standard_Real FirstLambda() const;
		%feature("autodoc", "1");
		Standard_Real LastLambda() const;
		%feature("autodoc", "1");
		const math_Matrix & Points() const;
		%feature("autodoc", "1");
		const math_Matrix & Poles() const;
		%feature("autodoc", "1");
		const math_IntegerVector & KIndex() const;

};

%nodefaultctor GeomInt_TheComputeLineOfWLApprox;
class GeomInt_TheComputeLineOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_TheComputeLineOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_TheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &Line, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		GeomInt_TheComputeLineOfWLApprox(const GeomInt_TheMultiLineOfWLApprox &Line, const math_Vector &Parameters, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		GeomInt_TheComputeLineOfWLApprox(const math_Vector &Parameters, const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		GeomInt_TheComputeLineOfWLApprox(const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		void Interpol(const GeomInt_TheMultiLineOfWLApprox &Line);
		%feature("autodoc", "1");
		void Init(const Standard_Integer degreemin=4, const Standard_Integer degreemax=8, const Standard_Real Tolerance3d=1.0000000000000000208166817117216851329430937767e-3, const Standard_Real Tolerance2d=9.99999999999999954748111825886258685613938723691e-7, const Standard_Integer NbIterations=5, const Standard_Boolean cutting=1, const Approx_ParametrizationType parametrization=Approx_ChordLength, const Standard_Boolean Squares=0);
		%feature("autodoc", "1");
		void Perform(const GeomInt_TheMultiLineOfWLApprox &Line);
		%feature("autodoc", "1");
		void SetParameters(const math_Vector &ThePar);
		%feature("autodoc", "1");
		void SetKnots(const TColStd_Array1OfReal &Knots);
		%feature("autodoc", "1");
		void SetKnotsAndMultiplicities(const TColStd_Array1OfReal &Knots, const TColStd_Array1OfInteger &Mults);
		%feature("autodoc", "1");
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);
		%feature("autodoc", "1");
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);
		%feature("autodoc", "1");
		void SetContinuity(const Standard_Integer C);
		%feature("autodoc", "1");
		void SetConstraints(const AppParCurves_Constraint firstC, const AppParCurves_Constraint lastC);
		%feature("autodoc", "1");
		Standard_Boolean IsAllApproximated() const;
		%feature("autodoc", "1");
		Standard_Boolean IsToleranceReached() const;
		%feature("autodoc", "1");
		void Error(Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		const AppParCurves_MultiBSpCurve & Value() const;
		%feature("autodoc", "1");
		AppParCurves_MultiBSpCurve & ChangeValue();
		%feature("autodoc", "1");
		const TColStd_Array1OfReal & Parameters() const;

};

%nodefaultctor GeomInt_ParameterAndOrientation;
class GeomInt_ParameterAndOrientation {
	public:
		%feature("autodoc", "1");
		~GeomInt_ParameterAndOrientation();
		%feature("autodoc", "1");
		GeomInt_ParameterAndOrientation();
		%feature("autodoc", "1");
		GeomInt_ParameterAndOrientation(const Standard_Real P, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2);
		%feature("autodoc", "1");
		void SetOrientation1(const TopAbs_Orientation Or);
		%feature("autodoc", "1");
		void SetOrientation2(const TopAbs_Orientation Or);
		%feature("autodoc", "1");
		Standard_Real Parameter() const;
		%feature("autodoc", "1");
		TopAbs_Orientation Orientation1() const;
		%feature("autodoc", "1");
		TopAbs_Orientation Orientation2() const;

};

%nodefaultctor GeomInt_TheMultiLineToolOfWLApprox;
class GeomInt_TheMultiLineToolOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_TheMultiLineToolOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_TheMultiLineToolOfWLApprox();
		%feature("autodoc", "1");
		Standard_Integer FirstPoint(const GeomInt_TheMultiLineOfWLApprox &ML);
		%feature("autodoc", "1");
		Standard_Integer LastPoint(const GeomInt_TheMultiLineOfWLApprox &ML);
		%feature("autodoc", "1");
		Standard_Integer NbP2d(const GeomInt_TheMultiLineOfWLApprox &ML);
		%feature("autodoc", "1");
		Standard_Integer NbP3d(const GeomInt_TheMultiLineOfWLApprox &ML);
		%feature("autodoc", "1");
		void Value(const GeomInt_TheMultiLineOfWLApprox &ML, const Standard_Integer Index, TColgp_Array1OfPnt & TabPnt);
		%feature("autodoc", "1");
		void Value(const GeomInt_TheMultiLineOfWLApprox &ML, const Standard_Integer Index, TColgp_Array1OfPnt2d & TabPnt2d);
		%feature("autodoc", "1");
		void Value(const GeomInt_TheMultiLineOfWLApprox &ML, const Standard_Integer Index, TColgp_Array1OfPnt & TabPnt, TColgp_Array1OfPnt2d & TabPnt2d);
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const GeomInt_TheMultiLineOfWLApprox &ML, const Standard_Integer Index, TColgp_Array1OfVec & TabVec);
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const GeomInt_TheMultiLineOfWLApprox &ML, const Standard_Integer Index, TColgp_Array1OfVec2d & TabVec2d);
		%feature("autodoc", "1");
		Standard_Boolean Tangency(const GeomInt_TheMultiLineOfWLApprox &ML, const Standard_Integer Index, TColgp_Array1OfVec & TabVec, TColgp_Array1OfVec2d & TabVec2d);
		%feature("autodoc", "1");
		Standard_Boolean Curvature(const GeomInt_TheMultiLineOfWLApprox &arg0, const Standard_Integer arg1, TColgp_Array1OfVec & arg2);
		%feature("autodoc", "1");
		Standard_Boolean Curvature(const GeomInt_TheMultiLineOfWLApprox &arg0, const Standard_Integer arg1, TColgp_Array1OfVec2d & arg2);
		%feature("autodoc", "1");
		Standard_Boolean Curvature(const GeomInt_TheMultiLineOfWLApprox &arg0, const Standard_Integer arg1, TColgp_Array1OfVec & arg2, TColgp_Array1OfVec2d & arg3);
		%feature("autodoc", "1");
		GeomInt_TheMultiLineOfWLApprox MakeMLBetween(const GeomInt_TheMultiLineOfWLApprox &ML, const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer NbPMin);
		%feature("autodoc", "1");
		Approx_Status WhatStatus(const GeomInt_TheMultiLineOfWLApprox &ML, const Standard_Integer arg1, const Standard_Integer arg2);

};

%nodefaultctor GeomInt_LineConstructor;
class GeomInt_LineConstructor {
	public:
		%feature("autodoc", "1");
		~GeomInt_LineConstructor();
		%feature("autodoc", "1");
		GeomInt_LineConstructor();
		%feature("autodoc", "1");
		void Load(const Handle_Adaptor3d_TopolTool &D1, const Handle_Adaptor3d_TopolTool &D2, const Handle_GeomAdaptor_HSurface &S1, const Handle_GeomAdaptor_HSurface &S2);
		%feature("autodoc", "1");
		void Perform(const Handle_IntPatch_Line &L);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbParts() const;
		%feature("autodoc", "1");
		void Part(const Standard_Integer I, Standard_Real &OutValue, Standard_Real &OutValue) const;

};

%nodefaultctor GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox;
class GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox {
	public:
		%feature("autodoc", "1");
		~GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox();
		%feature("autodoc", "1");
		GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const TColStd_Array1OfReal &Param, const Handle_Adaptor3d_HSurface &S1, const Handle_Adaptor3d_HSurface &S2, const Standard_Real TolTangency);
		%feature("autodoc", "1");
		GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox(const Handle_Adaptor3d_HSurface &S1, const Handle_Adaptor3d_HSurface &S2, const Standard_Real TolTangency);
		%feature("autodoc", "1");
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal &Param, math_FunctionSetRoot & Rsnld);
		%feature("autodoc", "1");
		IntImp_ConstIsoparametric Perform(const TColStd_Array1OfReal &Param, math_FunctionSetRoot & Rsnld, const IntImp_ConstIsoparametric ChoixIso);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		const IntSurf_PntOn2S & Point() const;
		%feature("autodoc", "1");
		Standard_Boolean IsTangent() const;
		%feature("autodoc", "1");
		const gp_Dir & Direction() const;
		%feature("autodoc", "1");
		const gp_Dir2d & DirectionOnS1() const;
		%feature("autodoc", "1");
		const gp_Dir2d & DirectionOnS2() const;
		%feature("autodoc", "1");
		GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox & Function();

};

%nodefaultctor GeomInt_TheImpPrmSvSurfacesOfWLApprox;
class GeomInt_TheImpPrmSvSurfacesOfWLApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("autodoc", "1");
		GeomInt_TheImpPrmSvSurfacesOfWLApprox(const Handle_Adaptor3d_HSurface &Surf1, const IntSurf_Quadric &Surf2);
		%feature("autodoc", "1");
		GeomInt_TheImpPrmSvSurfacesOfWLApprox(const IntSurf_Quadric &Surf1, const Handle_Adaptor3d_HSurface &Surf2);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);
		%feature("autodoc", "1");
		virtual		void Pnt(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Pnt & P);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Tangency(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & Tg);
		%feature("autodoc", "1");
		virtual		Standard_Boolean TangencyOnSurf1(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);
		%feature("autodoc", "1");
		virtual		Standard_Boolean TangencyOnSurf2(const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec2d & Tg);
		%feature("autodoc", "1");
		virtual		~GeomInt_TheImpPrmSvSurfacesOfWLApprox();

};