/*

Copyright 2008-2009 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.

pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/
%module PCDMShape

%include PCDMShape_renames.i
%include ../CommonIncludes.i
%include ../StandardDefines.i
%include ../ExceptionCatcher.i
%include ../FunctionTransformers.i
%include ../Operators.i

%include PCDMShape_dependencies.i


%include PCDMShape_headers.i




%nodefaultctor Handle_PCDMShape_Document;
class Handle_PCDMShape_Document : public Handle_PCDM_Document {
	public:
		%feature("autodoc", "1");
		Handle_PCDMShape_Document();
		%feature("autodoc", "1");
		Handle_PCDMShape_Document(const Handle_PCDMShape_Document &aHandle);
		%feature("autodoc", "1");
		Handle_PCDMShape_Document(const PCDMShape_Document *anItem);
		%feature("autodoc", "1");
		Handle_PCDMShape_Document & operator=(const Handle_PCDMShape_Document &aHandle);
		%feature("autodoc", "1");
		Handle_PCDMShape_Document & operator=(const PCDMShape_Document *anItem);
		%feature("autodoc", "1");
		Handle_PCDMShape_Document const DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PCDMShape_Document {
	PCDMShape_Document* GetObject() {
	return (PCDMShape_Document*)$self->Access();
	}
};
%extend Handle_PCDMShape_Document {
	~Handle_PCDMShape_Document() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_PCDMShape_Document\n");}
	}
};


%nodefaultctor PCDMShape_Document;
class PCDMShape_Document : public PCDM_Document {
	public:
		%feature("autodoc", "1");
		PCDMShape_Document();
		%feature("autodoc", "1");
		PCDMShape_Document(const PTopoDS_Shape1 &T);
		%feature("autodoc", "1");
		PTopoDS_Shape1 const Shape() const;
		%feature("autodoc", "1");
		void Shape(const PTopoDS_Shape1 &T);
		%feature("autodoc", "1");
		PCDMShape_Document(const Storage_stCONSTclCOM &a);
		%feature("autodoc", "1");
		const PTopoDS_Shape1 & _CSFDB_GetPCDMShape_DocumentmyShape() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend PCDMShape_Document {
	Handle_PCDMShape_Document GetHandle() {
	return *(Handle_PCDMShape_Document*) &$self;
	}
};
%extend PCDMShape_Document {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend PCDMShape_Document {
	~PCDMShape_Document() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of PCDMShape_Document\n");}
	}
};
