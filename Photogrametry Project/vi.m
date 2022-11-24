function varargout = vi(varargin)
% VI MATLAB code for vi.fig
%      VI, by itself, creates a new VI or raises the existing
%      singleton*.
%
%      H = VI returns the handle to a new VI or the handle to
%      the existing singleton*.
%
%      VI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VI.M with the given input arguments.
%
%      VI('Property','Value',...) creates a new VI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vi

% Last Modified by GUIDE v2.5 31-Dec-2017 19:38:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vi_OpeningFcn, ...
                   'gui_OutputFcn',  @vi_OutputFcn, ...
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


% --- Executes just before vi is made visible.
function vi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vi (see VARARGIN)

% Choose default command line output for vi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes vi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = vi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global im_l im_r c h1 h2
h1=subplot(1,2,1);
imshow(im_l)
h2=subplot(1,2,2);
imshow(im_r)
c=0;
% --- Executes on button press in p1.
function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c R_L C_L
[R_L, C_L] = ginput(1);
R_L = ceil(R_L);
C_L = ceil(C_L);
set(handles.p1,'enable','inactive')
set(handles.p3,'visible','on')
c=c+1;
if c==2
    set(handles.p4,'visible','on')
end
% --- Executes on button press in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c R_R C_R
[R_R, C_R] = ginput(1);
R_R = ceil(R_R);
C_R = ceil(C_R);
set(handles.p2,'enable','inactive')
set(handles.p3,'visible','on')
c=c+1;
if c==2
    set(handles.p4,'visible','on')
end
% --- Executes on button press in p3.
function p3_Callback(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (vi);

guidata(vi);

% --- Executes on button press in p4.
function p4_Callback(hObject, eventdata, handles)
% hObject    handle to p4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h1 h2 R_L C_L R_R C_R im_l im_r n b1 aaa aaa2 b2 tcl bcl ricl rocl gcl ocl lcl it tcr bcr ricr rocr gcr ocr lcr
set(handles.p1,'visible','off')
set(handles.p2,'visible','off')
set(handles.p3,'visible','off')
set(handles.p4,'visible','off')
set(handles.bg1,'visible','on')
delete (h1);
delete (h2);
            prompt={'Enter the size of window'};
name='Window size';
defaultanswer={'600'};
an=inputdlg(prompt,name,[1,50],defaultanswer);
n=str2num(cell2mat(an(1,1)));

T = zeros(n,n,3);
T(:,:,1) = im_l(C_L:C_L+n-1,R_L:R_L+n-1);
T(:,:,2) = im_r(C_R+10:C_R+10+n-1,R_R:R_R+n-1);
T(:,:,3) = im_r(C_R+10:C_R+10+n-1,R_R:R_R+n-1);
T = uint8(T);
imshow(T)

set(handles.slider1, 'min', 0)
set(handles.slider1, 'max', 100)
set(handles.slider1, 'value', 50)
set(handles.slider2, 'min', 0)
set(handles.slider2, 'max', 100)
set(handles.slider2, 'value', 50)
set(handles.slider1,'visible','on')
set(handles.slider2,'visible','on')

b1=50;b2=50;aaa=0;aaa2=0;
tcl=[];bcl=[];rocl=[];ricl=[];gcl=[];lcl=[];ocl=[];
tcr=[];bcr=[];rocr=[];ricr=[];gcr=[];lcr=[];ocr=[];
it=1;
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global R_L C_L R_R C_R im_l im_r n b1 aaa aaa2
a=get(handles.slider1,'value');
aa=round(a)-b1;
aaa=aaa+aa;
b1=round(a);
T = zeros(n,n,3);
T(:,:,1) = im_l(C_L+aaa2:C_L+aaa2+n+-1,R_L-aaa:R_L-aaa+n-1);
T(:,:,2) = im_r(C_R+10:C_R+10+n+-1,R_R:R_R+n-1);
T(:,:,3) = im_r(C_R+10:C_R+10+n+-1,R_R:R_R+n-1);
T = uint8(T);
imshow(T)


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global R_L C_L R_R C_R im_l im_r n b2 aaa2 aaa
a2=get(handles.slider2,'value');
aa2=round(a2)-b2;
aaa2=aaa2+aa2;
b2=round(a2);
T = zeros(n,n,3);
T(:,:,1) = im_l(C_L+aaa2:C_L+aaa2+n+-1,R_L-aaa:R_L-aaa+n-1);
T(:,:,2) = im_r(C_R+10:C_R+10+n+-1,R_R:R_R+n-1);
T(:,:,3) = im_r(C_R+10:C_R+10+n+-1,R_R:R_R+n-1);
T = uint8(T);
imshow(T)



% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in p5.
function p5_Callback(hObject, eventdata, handles)
% hObject    handle to p5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bcl bcr R_L C_L R_R C_R aaa2 aaa
while 1>0
    
h=impoly;
setColor(h,[0.93 0.69 0.13])
c=getPosition(h);
cl(:,1)=c(:,1)+R_L-aaa;
cl(:,2)=c(:,2)+C_L+aaa2;
cr(:,1)=c(:,1)+R_R;
cr(:,2)=c(:,2)+C_R+10;

bcl=[bcl;ceil(cl)];
bcr=[bcr;ceil(cr)];
w = waitforbuttonpress;
if w==0
    break
end
end



% --- Executes on button press in p6.
function p6_Callback(hObject, eventdata, handles)
% hObject    handle to p6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  rocl rocr R_L C_L R_R C_R aaa2 aaa
while 1>0
h=imline;

setColor(h,'r')
c=getPosition(h);
cl(:,1)=c(:,1)+R_L-aaa;
cl(:,2)=c(:,2)+C_L+aaa2;
cr(:,1)=c(:,1)+R_R;
cr(:,2)=c(:,2)+C_R+10;

rocl=[rocl;ceil(cl)];
rocr=[rocr;ceil(cr)];
w = waitforbuttonpress;
if w==0
    break
end
end



% --- Executes on button press in p7.
function p7_Callback(hObject, eventdata, handles)
% hObject    handle to p7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tcl tcr it R_L C_L R_R C_R aaa2 aaa
while 1>0
h=impoint;
   
setColor(h,'g')
c=getPosition(h);
cl(:,1)=c(:,1)+R_L-aaa;
cl(:,2)=c(:,2)+C_L+aaa2;
cr(:,1)=c(:,1)+R_R;
cr(:,2)=c(:,2)+C_R+10;

tcl=[tcl;ceil(cl)];
tcr=[tcr;ceil(cr)];
setString(h,it);
it=it+1;
w = waitforbuttonpress;
if w==0
    break
end
end

% --- Executes on button press in p8.
function p8_Callback(hObject, eventdata, handles)
% hObject    handle to p8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gcl gcr R_L C_L R_R C_R aaa2 aaa
while 1>0
h=impoly;
setColor(h,[0.47 .67 .19])
c=getPosition(h);
cl(:,1)=c(:,1)+R_L-aaa;
cl(:,2)=c(:,2)+C_L+aaa2;
cr(:,1)=c(:,1)+R_R;
cr(:,2)=c(:,2)+C_R+10;

gcl=[gcl;ceil(cl)];
gcr=[gcr;ceil(cr)];
w = waitforbuttonpress;
if w==0
    break
end
end

% --- Executes on button press in p9.
function p9_Callback(hObject, eventdata, handles)
% hObject    handle to p9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ricl ricr R_L C_L R_R C_R aaa2 aaa
while 1>0
h=imline;

setColor(h,'c');
c=getPosition(h);
cl(:,1)=c(:,1)+R_L-aaa;
cl(:,2)=c(:,2)+C_L+aaa2;
cr(:,1)=c(:,1)+R_R;
cr(:,2)=c(:,2)+C_R+10;

ricl=[ricl;ceil(cl)];
ricr=[ricr;ceil(cr)];
w = waitforbuttonpress;
if w==0
    break
end
end


% --- Executes on button press in p10.
function p10_Callback(hObject, eventdata, handles)
% hObject    handle to p10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  lcl lcr R_L C_L R_R C_R aaa2 aaa
while 1>0
h=impoly;

setColor(h,[0.3 .75 .93])
c=getPosition(h);
cl(:,1)=c(:,1)+R_L-aaa;
cl(:,2)=c(:,2)+C_L+aaa2;
cr(:,1)=c(:,1)+R_R;
cr(:,2)=c(:,2)+C_R+10;

lcl=[lcl;ceil(cl)];
lcr=[lcr;ceil(cr)];
w = waitforbuttonpress;
if w==0
    break
end
end

% --- Executes on button press in p11.
function p11_Callback(hObject, eventdata, handles)
% hObject    handle to p11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ocl ocr R_L C_L R_R C_R aaa2 aaa
while 1>0
h=imfreehand;

setColor(h,'y')
c=getPosition(h);
cl(:,1)=c(:,1)+R_L-aaa;
cl(:,2)=c(:,2)+C_L+aaa2;
cr(:,1)=c(:,1)+R_R;
cr(:,2)=c(:,2)+C_R+10;

ocl=[ocl;ceil(cl)];
ocr=[ocr;ceil(cr)];
w = waitforbuttonpress;
if w==0
    break
end
end

% --- Executes on button press in p12.
function p12_Callback(hObject, eventdata, handles)
% hObject    handle to p12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (vi)
guidata(vi)


% --- Executes on button press in p13.
function p13_Callback(hObject, eventdata, handles)
% hObject    handle to p13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global  bcl bcr rocl rocr tcl tcr gcl gcr ricl ricr lcl lcr ocl ocr
handles = guidata(hObject);
bcl(:,3)=1;
bcr(:,3)=1;
rocl(:,3)=2;
rocr(:,3)=2;
tcl(:,3)=3;
tcr(:,3)=3;
gcl(:,3)=4;
gcr(:,3)=4;
ricl(:,3)=5;
ricr(:,3)=5;
lcl(:,3)=6;
lcr(:,3)=6;
ocl(:,3)=7;
ocr(:,3)=7;
n9=[bcl;rocl;tcl;gcl;ricl;lcl;ocl];
n91=[bcr;rocr;tcr;gcr;ricr;lcr;ocr];

fhandles = guidata(final);


fhandles.n9 = n9;
fhandles.n91 = n91;
set(fhandles.p5,'enable','on')
set(fhandles.c5,'visible','on')
set(fhandles.es,'enable','on')
guidata(final,fhandles)

close(vi)
