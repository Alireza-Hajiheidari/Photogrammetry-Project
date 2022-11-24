function varargout = Refining(varargin)
% REFINING MATLAB code for Refining.fig
%      REFINING, by itself, creates a new REFINING or raises the existing
%      singleton*.
%
%      H = REFINING returns the handle to a new REFINING or the handle to
%      the existing singleton*.
%
%      REFINING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REFINING.M with the given input arguments.
%
%      REFINING('Property','Value',...) creates a new REFINING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Refining_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Refining_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Refining

% Last Modified by GUIDE v2.5 19-Jan-2018 16:13:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Refining_OpeningFcn, ...
                   'gui_OutputFcn',  @Refining_OutputFcn, ...
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


% --- Executes just before Refining is made visible.
function Refining_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Refining (see VARARGIN)

% Choose default command line output for Refining
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Refining wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Refining_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in p2.
function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x0 y0 ml mr x1l y1l x1r y1r mpl1 mpr1
%left
x1l=ml(:,1)-x0;
y1l=ml(:,2)-y0;
%right
x1r=mr(:,1)-x0;
y1r=mr(:,2)-y0;

mpl1=[x1l y1l];
mpr1=[x1r y1r];
set(handles.p2,'enable','on');
set(handles.p1,'enable','inactive');
% --- Executes on button press in p4.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x1l x2l y1l y2l t_r x1r y1r x2r y2r mpl2 mpr2
%left
dr=t_r(:,2)/1000;
r=t_r(:,1);
for i=1:size(t_r,1)
    kk(i,:)=[r(i) r(i)^3 r(i)^5];
end
k2=(kk'*kk)^-1*kk'*dr;
r2=(x1l.^2+y1l.^2).^0.5;

x2l=x1l.*(1-(k2(1)+k2(2)*r2.^2+k2(3)*r2.^4));
y2l=y1l.*(1-(k2(1)+k2(2)*r2.^2+k2(3)*r2.^4));
%right
dr=t_r(:,2)/1000;
r=t_r(:,1);
for i=1:size(t_r,1)
    kk(i,:)=[r(i) r(i)^3 r(i)^5];
end
k2=(kk'*kk)^-1*kk'*dr;
r2=(x1r.^2+y1r.^2).^0.5;

x2r=x1r.*(1-(k2(1)+k2(2)*r2.^2+k2(3)*r2.^4));
y2r=y1r.*(1-(k2(1)+k2(2)*r2.^2+k2(3)*r2.^4));

mpl2=[x2l y2l];
mpr2=[x2r y2r];
set(handles.p3,'enable','on');
set(handles.p2,'enable','inactive');
% --- Executes on button press in p5.
function p3_Callback(hObject, eventdata, handles)
% hObject    handle to p5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x2l y2l x3l y3l f H x2r y2r x3r y3r hm mpl3 mpr3
h=hm/1000;
HH=H/1000;
%left
k3=0.00241*((HH/(HH^2-6*HH+250))-(h^2/(HH*(h^2-6*h+250))));
r3=(x2l.^2+y2l.^2).^0.5;

dx3=k3*x2l.*(((r3.^2)./(f^2))+1);
dy3=k3*y2l.*(((r3.^2)./(f^2))+1);

x3l=x2l-dx3;
y3l=y2l-dy3;
%right
k3=0.00241*((HH/(HH^2-6*HH+250))-(h^2/(HH*(h^2-6*h+250))));
r3=(x2r.^2+y2r.^2).^0.5;

dx3=k3*x2r.*(((r3.^2)./(f^2))+1);
dy3=k3*y2r.*(((r3.^2)./(f^2))+1);

x3r=x2r-dx3;
y3r=y2r-dy3;

mpl3=[x3l y3l];
mpr3=[x3r y3r];
set(handles.p4,'enable','on');
set(handles.p3,'enable','inactive');
% --- Executes on button press in p1.
function p4_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x3l y3l H f R mpl x3r y3r mpr
%left
r4=(x3l.^2+y3l.^2).^0.5;
dr4=((H/1000)*(r4.^3))/(2*R*(f^2));
r44=r4+dr4;

x4l=(r44./r4).*x3l;
y4l=(r44./r4).*y3l;
set(handles.p6,'enable','on');
set(handles.p4,'enable','inactive');
mpl=[x4l y4l];
%right
r4=(x3r.^2+y3r.^2).^0.5;
dr4=((H/1000)*(r4.^3))/(2*R*(f^2));
r44=r4+dr4;

x4r=(r44./r4).*x3r;
y4r=(r44./r4).*y3r;
mpr=[x4r y4r];

% --- Executes on button press in p6.
function p6_Callback(hObject, eventdata, handles)
% hObject    handle to p6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mpl1 mpr1 mpl2 mpr2 mpl3 mpr3 mpl mpr
handles = guidata(hObject);

n5=mpl1;
n51=mpr1;
n52=mpl2;
n53=mpr2;
n54=mpl3;
n55=mpr3;
n56=mpl;
n57=mpr;

 

fhandles = guidata(final);


fhandles.n5 = n5;
fhandles.n51 = n51;
fhandles.n52 = n52;
fhandles.n53 = n53;
fhandles.n54 = n54;
fhandles.n55 = n55;
fhandles.n56 = n56;
fhandles.n57 = n57;

set(fhandles.eo,'enable','on')
set(fhandles.er,'enable','on')
set(fhandles.p3,'enable','on')
set(fhandles.c3,'visible','on')
guidata(final,fhandles)
set(fhandles.re,'enable','off')
close(Refining)
