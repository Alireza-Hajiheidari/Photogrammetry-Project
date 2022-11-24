function varargout = rel(varargin)
% REL MATLAB code for rel.fig
%      REL, by itself, creates a new REL or raises the existing
%      singleton*.
%
%      H = REL returns the handle to a new REL or the handle to
%      the existing singleton*.
%
%      REL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REL.M with the given input arguments.
%
%      REL('Property','Value',...) creates a new REL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rel

% Last Modified by GUIDE v2.5 30-Dec-2017 23:44:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rel_OpeningFcn, ...
                   'gui_OutputFcn',  @rel_OutputFcn, ...
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


% --- Executes just before rel is made visible.
function rel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rel (see VARARGIN)

% Choose default command line output for rel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in p1.
function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xtn f im_l im_r mpl mpr num t_g z
c=f;
load ij
xyl=mpl;
xyr=mpr;


  prompt = {'How many points in the first of GCPs file are contorol points?'};
dlg_title = 'Contorol points';
num_lines = 1;
defaultans = {'8'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
num=str2num(answer{1});
if num>size(t_g,1)
   warndlg ('Dont enter more than max of size of GCPs','!!warning!!')
   pause(2)
    close(TT)
    guidata(TT)
else
    
    
% marhaleye1
load contorol8
[l,r]=cpselect(im_l,im_r,l,r,'Wait',true);
l=ceil(l);
r=ceil(r);
s=min(size(l,1),size(r,1));
if s<5 || s>num
       warndlg ('Select at least 5 points or only contorol points','!!warning!!')
         pause(2)
    close(rel)
    guidata(rel)
    else
 

xyl2=xyl((l(:,1)-1).*max(t(:,2))+l(:,2),:);   %payda kardan mokhtasate palayesh shodeye noghate gerefte shode roye tasvir
xyr2=xyr((r(:,1)-1).*max(t(:,2))+r(:,2),:);
%malomat
X02=mean(xyl2(:,1)-xyr2(:,1));
X02=100;
% moadelate sharte ham khati
syms  X Y Z w2 f2 k2 Y02 Z02
%chap
M1=[1 0 0;0 cos(0) -sin(0);0 sin(0) cos(0)];
M2=[cos(0) 0 sin(0);0 1 0;-sin(0) 0 cos(0)];
M3=[cos(0) -sin(0) 0;sin(0) cos(0) 0;0 0 1];
M=M3*M2*M1;         %matrise davaran
clear M1 M2 M3 

X1=[X;Y;Z-c];
MX=M*X1;

m=-c/MX(3,1);
fx=m*MX(1,1);  %moadelat sharte ham khati
fy=m*MX(2,1);
F=[fx;fy];


%rast
M1=[1 0 0;0 cos(w2) -sin(w2);0 sin(w2) cos(w2)];
M2=[cos(f2) 0 sin(f2);0 1 0;-sin(f2) 0 cos(f2)];
M3=[cos(k2) -sin(k2) 0;sin(k2) cos(k2) 0;0 0 1];
M=M3*M2*M1;         %matrise davaran
clear M1 M2 M3

X1=[X-X02;Y-Y02;Z-Z02];
MX=M*X1;

m=-c/MX(3,1);
fx2=m*MX(1,1);  %moadelat sharte ham khati
fy2=m*MX(2,1);
F2=[fx2;fy2];

clear m X1 MX M 

F1=[F;F2];
j1=jacobian(fx,[w2,f2,k2,Y02,Z02,X,Y,Z]);
j2=jacobian(fy,[w2,f2,k2,Y02,Z02,X,Y,Z]);
j3=jacobian(fx2,[w2,f2,k2,Y02,Z02,X,Y,Z]);
j4=jacobian(fy2,[w2,f2,k2,Y02,Z02,X,Y,Z]);

%baraye tarfi
A1=[j1;j2;j3;j4];
clear j1 j2 j3 j4 F F2

% tojihe nesbi yek tarafe az rast


%maghadire avaliye
for i=1:size(xyl2,1)
   xytl(3*i-2,1)=xyl2(i,1); 
   xytl(3*i-1,1)=xyl2(i,2);
   xytl(3*i,1)=150; 
end
for i=1:size(xyl2,1)
   xyt(4*i-3,1)=xyl2(i,1); 
   xyt(4*i-2,1)=xyl2(i,2);
   xyt(4*i-1,1)=xyr2(i,1); 
   xyt(4*i,1)=xyr2(i,2);
end

x=[0;0;0;0;c;xytl];

dx=1;

while norm(dx)>10^-6
    A22=[];FFF=[];A3=zeros(4,3*size(xyl2,1)+5);F3=zeros(4,3*size(xyl2,1)+5);
    for i=1:size(xyl2,1)
   
    A3=zeros(4,3*size(xyl2,1)+5);
    A2=eval(subs(A1,{w2,f2,k2,Y02,Z02,X,Y,Z},{x(1),x(2),x(3),x(4),x(5),x(3*i-2+5),x(3*i-1+5),x(3*i+5)}));
    A2(:,3*i-2+5:3*i+5)=A2(:,6:8);
    FF=eval(subs(F1,{w2,f2,k2,Y02,Z02,X,Y,Z},{x(1),x(2),x(3),x(4),x(5),x(3*i-2+5),x(3*i-1+5),x(3*i+5)}));
    
    if i~=1
       A2(:,6:8)=0; 
    end
    A3(1:size(A2,1),1:size(A2,2))=A2;
   A22=[A22;A3];
   FFF=[FFF;FF];
    end
 dy=xyt-FFF;
 dx=(A22'*A22)^-1*A22'*dy;
 x=x+dx;
end
z=x(1:5);
xtn=vec2mat(x(6:end),3);
set(handles.p2,'enable','on')
set(handles.p1,'enable','inactive')
end
end

% --- Executes on button press in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xtn num z
handles = guidata(hObject);

n7=xtn;
n71=num;
n72=z;

fhandles = guidata(final);


fhandles.n7 = n7;
fhandles.n71 = n71;
fhandles.n72 = n72;

guidata(final,fhandles)
set(fhandles.ab,'enable','on')
set(fhandles.tt,'enable','off')
set(fhandles.rel,'enable','off')
set(fhandles.ero,'enable','on')
close(rel)
