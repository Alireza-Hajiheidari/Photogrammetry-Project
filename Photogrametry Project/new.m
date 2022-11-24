function varargout = new(varargin)
% NEW MATLAB code for new.fig
%      NEW, by itself, creates a new NEW or raises the existing
%      singleton*.
%
%      H = NEW returns the handle to a new NEW or the handle to
%      the existing singleton*.
%
%      NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW.M with the given input arguments.
%
%      NEW('Property','Value',...) creates a new NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new

% Last Modified by GUIDE v2.5 31-Dec-2017 01:44:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_OpeningFcn, ...
                   'gui_OutputFcn',  @new_OutputFcn, ...
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


% --- Executes just before new is made visible.
function new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new (see VARARGIN)

% Choose default command line output for new
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = new_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global c
c=0;
% --- Executes on button press in p1.
function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_l c
[n1,p1]=uigetfile({'*.tif'},'akse samte chap ra ba formate TIFF entekhab konid');
fid1=strcat(p1,n1);
im_l=imread(fid1);
im_l=rgb2gray(im_l);
subplot(1,2,1);
imshow(im_l)
c=c+1;
if c==3
   set(handles.p3,'enable','on') 
end


% --- Executes on button press in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_r c
[n1,p1]=uigetfile({'*.tif'},'akse samte rast ra ba formate TIFF entekhab konid');
fid1=strcat(p1,n1);
im_r=imread(fid1);
im_r=rgb2gray(im_r);
subplot(1,2,2);
imshow(im_r)
c=c+1;
if c==3
   set(handles.p3,'enable','on') 
end



function e1_Callback(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e1 as text
%        str2double(get(hObject,'String')) returns contents of e1 as a double
global c
c=c+1;
if c==3
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
global im_l im_r 
handles = guidata(hObject);


n11 = (get(handles.e1,'string'));
n1 =im_l;
n12=im_r;
fhandles = guidata(final);

fhandles.n1 = n1;
fhandles.n11 = n11;
fhandles.n12 = n12;
set(fhandles.s2,'string',n11);
set(fhandles.s1,'visible','on');
set(fhandles.s2,'visible','on');
set(fhandles.pra,'enable','on');
set(fhandles.panel,'visible','on');
guidata(final,fhandles)

close(new)
