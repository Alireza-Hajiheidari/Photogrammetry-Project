function varargout = prameters(varargin)
% PRAMETERS MATLAB code for prameters.fig
%      PRAMETERS, by itself, creates a new PRAMETERS or raises the existing
%      singleton*.
%
%      H = PRAMETERS returns the handle to a new PRAMETERS or the handle to
%      the existing singleton*.
%
%      PRAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAMETERS.M with the given input arguments.
%
%      PRAMETERS('Property','Value',...) creates a new PRAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before prameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to prameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help prameters

% Last Modified by GUIDE v2.5 31-Dec-2017 01:17:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prameters_OpeningFcn, ...
                   'gui_OutputFcn',  @prameters_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before prameters is made visible.
function prameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to prameters (see VARARGIN)

% Choose default command line output for prameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes prameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = prameters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global c
c=0;

function e1_Callback(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e1 as text
%        str2double(get(hObject,'String')) returns contents of e1 as a double
global c
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end

% --- Executes during object creation, after setting all properties.
function e1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in p3.
function p3_Callback(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t_g t_f t_r
handles = guidata(hObject);

T0 = (get(handles.e1,'string'));
T1 = str2num(get(handles.e2,'string'));
T2 = str2num(get(handles.e3,'string'));
T3 = str2num(get(handles.e4,'string'));
T4 = str2num(get(handles.e5,'string'));
T5 = str2num(get(handles.e6,'string'));
T6 = str2num(get(handles.e7,'string'));
n2 = [T1 T2 T3 T4 T5 T6];
n21=t_f;
n22=t_r;
n23=t_g;
fhandles = guidata(final);

fhandles.n2 = n2;
fhandles.n21 = n21;
fhandles.n22 = n22;
fhandles.n23 = n23;

set(fhandles.pro,'enable','on');
set(fhandles.p1,'enable','on');
set(fhandles.c1,'visible','on');
set(fhandles.s6,'visible','on');
set(fhandles.s7,'visible','on');
set(fhandles.s7,'string',T0);
guidata(final,fhandles)

close(prameters)

% --- Executes on button press in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c t_r
[n,p]=uigetfile('*.txt','File radial ra vared konid');
fid=strcat(p,n);
t_r=dlmread(fid);
set(handles.t2,'data',t_r')
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end

% --- Executes on button press in p1.
function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c t_f
[n,p]=uigetfile('*.txt','File FMs ra vared konid');
fid=strcat(p,n);
t_f=dlmread(fid);
t_f=t_f(:,2:3);
set(handles.t1,'data',t_f)
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end


function e2_Callback(hObject, eventdata, handles)
% hObject    handle to e2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e2 as text
%        str2double(get(hObject,'String')) returns contents of e2 as a double
global c
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end

% --- Executes during object creation, after setting all properties.
function e2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e3_Callback(hObject, eventdata, handles)
% hObject    handle to e3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e3 as text
%        str2double(get(hObject,'String')) returns contents of e3 as a double
global c
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end

% --- Executes during object creation, after setting all properties.
function e3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e4_Callback(hObject, eventdata, handles)
% hObject    handle to e4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e4 as text
%        str2double(get(hObject,'String')) returns contents of e4 as a double
global c
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end

% --- Executes during object creation, after setting all properties.
function e4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e5_Callback(hObject, eventdata, handles)
% hObject    handle to e5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e5 as text
%        str2double(get(hObject,'String')) returns contents of e5 as a double
global c
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end

% --- Executes during object creation, after setting all properties.
function e5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in p4.
function p4_Callback(hObject, eventdata, handles)
% hObject    handle to p4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c t_g
[n,p]=uigetfile('*.txt','File GCPs ra vared konid');
fid=strcat(p,n);
t_g=dlmread(fid);
set(handles.t3,'data',t_g)
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end



function e6_Callback(hObject, eventdata, handles)
% hObject    handle to e7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e7 as text
%        str2double(get(hObject,'String')) returns contents of e7 as a double
global c
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end

% --- Executes during object creation, after setting all properties.
function e6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e7_Callback(hObject, eventdata, handles)
% hObject    handle to e7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e7 as text
%        str2double(get(hObject,'String')) returns contents of e7 as a double
global c
c=c+1;
if c==10
   set(handles.p3,'enable','on') 
end

% --- Executes during object creation, after setting all properties.
function e7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
