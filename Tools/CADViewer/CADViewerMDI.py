#!/usr/bin/env python

##Copyright 2008-2009 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCasacde library.
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

import sys, os
import wx
from OCC.Display.wxDisplay import wxViewer3d
from OCC import VERSION
import time

class ViewerFrame(wx.MDIChildFrame):
     def __init__(self, parent):
        wx.MDIChildFrame.__init__(self, parent, -1, "", style=wx.DEFAULT_FRAME_STYLE,size = (640,480))
        self.canva = wxViewer3d(self)
            
     def LoadFile(self,filename):
        extension = os.path.basename(filename).split(".").pop().lower()
        start_time = time.time()
        if extension =="step" or extension == "stp":
            from OCC import STEPControl
            stepReader = STEPControl.STEPControl_Reader()
            stepReader.ReadFile(str(filename))
            numTranslated = stepReader.TransferRoots()
            shape = stepReader.OneShape()
        elif extension == "stl":
            from OCC import TopoDS, StlAPI
            shape = TopoDS.TopoDS_Shape()
            stl_reader = StlAPI.StlAPI_Reader()
            stl_reader.Read(shape,str(filename))
        elif extension =="iges" or extension =="igs":
            from OCC import IGESControl
            i  = IGESControl.IGESControl_Controller()
            i.Init()
            iges_reader = IGESControl.IGESControl_Reader()
            iges_reader.ReadFile(str(filename))
            iges_reader.TransferRoots()
            shape = iges_reader.OneShape()
        elif extension == "brep":
            from OCC import TopoDS, BRep, BRepTools
            shape = TopoDS.TopoDS_Shape()
            builder = BRep.BRep_Builder()
            BRepTools.BRepTools().Read(shape,str(filename),builder)
        else:
            return True
        self.canva._3dDisplay.DisplayShape(shape)
        end_time = time.time()
        self.SetTitle("CAD Viewer - pythonOCC %s:%s"%(VERSION,filename))
        duration = end_time-start_time
        print "%s STEP file loaded and displayed in %f seconds."%(filename,duration)
        
class AppFrame(wx.MDIParentFrame):
    def __init__(self, parent):
        wx.MDIParentFrame.__init__(self, parent, -1, "CAD Viewer %s - pythonOCC 0.99"%VERSION, style=wx.DEFAULT_FRAME_STYLE,size = (800,600))
        # Creating Menu
        menuBar = wx.MenuBar()
        menu1 = wx.Menu()
        menu1.Append(101, "&Open", "Open a STEP file")
        menu1.Append(102, "&Exit", "Exit application")     
        self.Bind(wx.EVT_MENU, self.OnOpen, id=101)
        self.Bind(wx.EVT_MENU, self.OnExit, id=102)
        menu2 = wx.Menu()
        menu2.Append(103, "&About", "")
        self.Bind(wx.EVT_MENU, self.OnAbout, id=103)
        menuBar.Append(menu1, "&File")
        menuBar.Append(menu2, "&Help")
        self.SetMenuBar(menuBar)
       
    def OnOpen(self,event):
        # Choose file dialog
        dlg = wx.FileDialog(
            self, message="Choose a STEP",
            defaultDir=os.getcwd(), 
            defaultFile="",
            wildcard="",#STEP file (*.step)|*.step|STL files (*.stl)|*.stl|IGES files (*.iges)|*.iges| All files (*.*)|*.*|" ,
            style=wx.OPEN | wx.MULTIPLE | wx.CHANGE_DIR
            )
        if dlg.ShowModal() == wx.ID_OK:
            paths = dlg.GetPaths()
            # create another child frame
            new_frame = ViewerFrame(self)
            new_frame.Show(True)
            new_frame.LoadFile(paths[0])
            
    def OnAbout(self, event):
        info = wx.AboutDialogInfo()    
        info.Name = "CAD Viewer"
        info.Version = VERSION
        info.Copyright = "(C) 2008-2009 Thomas Paviot"
        info.Description = """CAD Viewer is part of pythonOCC, an free set of Python bindings to OpenCascade library.
        This sample can open and display STEP, STL and IGES CAD files."""
        info.WebSite = ("http://www.pythonocc.org", "pythonOCC home page")
        info.Developers = [ "Thomas Paviot (thomas.paviot@free.fr)"]
        info.License = """This software is governed by the CeCILL license under French law and
        abiding by the rules of distribution of free software.  You can  use, modify and/ or
        redistribute the software under the terms of the CeCILL license as circulated by CEA, CNRS
        and INRIA at the following URL "http://www.cecill.info"."""
        wx.AboutBox(info)
        
    def OnExit(self,event):
        sys.exit(0)

if __name__=="__main__":
    app = wx.PySimpleApp()
    wx.InitAllImageHandlers()
    frame = AppFrame(None)
    if sys.platform=='win32':
        frame.Show(True)
    else:
        frame.Show(True)
        wx.SafeYield() #under Linux, frame must be shown before Display3D is initialized
        frame.canva.InitViewer3d()
    app.SetTopWindow(frame)
    app.MainLoop()            