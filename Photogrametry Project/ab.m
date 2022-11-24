function varargout = ab(varargin)
% AB MATLAB code for ab.fig
%      AB, by itself, creates a new AB or raises the existing
%      singleton*.
%
%      H = AB returns the handle to a new AB or the handle to
%      the existing singleton*.
%
%      AB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AB.M with the given input arguments.
%
%      AB('Property','Value',...) creates a new AB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ab

% Last Modified by GUIDE v2.5 19-Jan-2018 19:53:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ab_OpeningFcn, ...
                   'gui_OutputFcn',  @ab_OutputFcn, ...
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


% --- Executes just before ab is made visible.
function ab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ab (see VARARGIN)

% Choose default command line output for ab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ab_OutputFcn(hObject, eventdata, handles) 
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
global f mpl mpr t_g xyzm xtm z im_l im_r ZA
c=f;
load contorol
[l,r]=cpselect(im_l,im_r,l,r,'Wait',true);
l=ceil(l);
r=ceil(r);
load ij
xyl=mpl;
xyr=mpr;

% marhaleye1

 

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
M1=[1 0 0;0 cos(z(1)) -sin(z(1));0 sin(z(1)) cos(z(1))];
M2=[cos(z(2)) 0 sin(z(2));0 1 0;-sin(z(2)) 0 cos(z(2))];
M3=[cos(z(3)) -sin(z(3)) 0;sin(z(3)) cos(z(3)) 0;0 0 1];
M=M3*M2*M1;         %matrise davaran
clear M1 M2 M3

X1=[X-X02;Y-z(4);Z-z(5)];
MX=M*X1;

m=-c/MX(3,1);
fx2=m*MX(1,1);  %moadelat sharte ham khati
fy2=m*MX(2,1);
F2=[fx2;fy2];

clear m X1 MX M 

F1=[F;F2];
j1=jacobian(fx,[X,Y,Z]);
j2=jacobian(fy,[X,Y,Z]);
j3=jacobian(fx2,[X,Y,Z]);
j4=jacobian(fy2,[X,Y,Z]);

%baraye tarfi
A1=[j1;j2;j3;j4];
clear j1 j2 j3 j4 F F2

% tojihe nesbi yek tarafe az rast


%maghadire avaliye
for i=1:size(xyl2,1)
   xytl(3*i-2,1)=xyl2(i,1); 
   xytl(3*i-1,1)=xyl2(i,2);
   xytl(3*i,1)=0; 
end
for i=1:size(xyl2,1)
   xyt(4*i-3,1)=xyl2(i,1); 
   xyt(4*i-2,1)=xyl2(i,2);
   xyt(4*i-1,1)=xyr2(i,1); 
   xyt(4*i,1)=xyr2(i,2);
end

x=xytl;

dx=1;

while norm(dx)>10^-6
    for i=1:size(xyl2,1)
   

    A2(4*i-3:4*i,3*i-2:3*i)=eval(subs(A1,{X,Y,Z},{x(3*i-2),x(3*i-1),x(3*i)}));
    FF(4*i-3:4*i,1)=eval(subs(F1,{X,Y,Z},{x(3*i-2),x(3*i-1),x(3*i)}));
    
    end
 dy=xyt-FF;
 dx=pinv(A2'*A2)*A2'*dy;
 x=x+dx;
end
xtn=vec2mat(x,3);



% tojihe motlagh

%marhale aval
xyz=[];
for i=1:size(xyzm,1)  
   xyz=[xyz;t_g(i,2);t_g(i,3);t_g(i,4)] ;
end

AA=[];
for i=1:size(xyz,1)/3 
   AA=[AA;xyzm(i,1) xyzm(i,2) xyzm(i,3) 0 0 0 0 0 0 1 0 0;0 0 0 xyzm(i,1) xyzm(i,2) xyzm(i,3) 0 0 0 0 1 0;0 0 0 0 0 0 xyzm(i,1) xyzm(i,2) xyzm(i,3) 0 0 1]; 
end
ZA=(AA'*AA)^-1*AA'*xyz;

%marhale dovom
%dar halate koli niyaz be tashih darad 

AAt=[];
for i=1:size(l,1)    
      AAt=[AAt;xtn(i,1) xtn(i,2) xtn(i,3) 0 0 0 0 0 0 1 0 0;0 0 0 xtn(i,1) xtn(i,2) xtn(i,3) 0 0 0 0 1 0;0 0 0 0 0 0 xtn(i,1) xtn(i,2) xtn(i,3) 0 0 1]; 
end

xtm=AAt*ZA;
xtm=vec2mat(xtm,3);
set(handles.p2,'enable','on')
set(handles.p3,'enable','on')
set(handles.p1,'enable','inactive')

% --- Executes on button press in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xtm ZA rmse
handles = guidata(hObject);

fhandles = guidata(final);

n8=xtm;
n81=ZA;
n82=rmse;
fhandles.n8 = n8;
fhandles.n81 = n81;
fhandles.n82 = n82;


guidata(final,fhandles)

set(fhandles.pro,'enable','off')
set(fhandles.ea,'enable','on')
set(fhandles.es,'enable','on')
set(fhandles.p4,'enable','on')
set(fhandles.str,'enable','on')
set(fhandles.c4,'visible','on')
set(fhandles.s10,'visible','on')
set(fhandles.s11,'visible','on')
set(fhandles.s11,'string','Relative & absolute oreintation')


close(ab)


% --- Executes on button press in p3.
function p3_Callback(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f mpl mpr t_g xyzm z im_l im_r number rmse
c=f;

load contorol10_11
[l,r]=cpselect(im_l,im_r,l,r,'Wait',true);
l=ceil(l);
r=ceil(r);
if size(l,1)>(size(t_g,1)-number)
    warndlg('Only choose Check point','Warning')
else

load ij
xyl=mpl;
xyr=mpr;

% marhaleye1

 

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
M1=[1 0 0;0 cos(z(1)) -sin(z(1));0 sin(z(1)) cos(z(1))];
M2=[cos(z(2)) 0 sin(z(2));0 1 0;-sin(z(2)) 0 cos(z(2))];
M3=[cos(z(3)) -sin(z(3)) 0;sin(z(3)) cos(z(3)) 0;0 0 1];
M=M3*M2*M1;         %matrise davaran
clear M1 M2 M3

X1=[X-X02;Y-z(4);Z-z(5)];
MX=M*X1;

m=-c/MX(3,1);
fx2=m*MX(1,1);  %moadelat sharte ham khati
fy2=m*MX(2,1);
F2=[fx2;fy2];

clear m X1 MX M 

F1=[F;F2];
j1=jacobian(fx,[X,Y,Z]);
j2=jacobian(fy,[X,Y,Z]);
j3=jacobian(fx2,[X,Y,Z]);
j4=jacobian(fy2,[X,Y,Z]);

%baraye tarfi
A1=[j1;j2;j3;j4];
clear j1 j2 j3 j4 F F2

% tojihe nesbi yek tarafe az rast


%maghadire avaliye
for i=1:size(xyl2,1)
   xytl(3*i-2,1)=xyl2(i,1); 
   xytl(3*i-1,1)=xyl2(i,2);
   xytl(3*i,1)=0; 
end
for i=1:size(xyl2,1)
   xyt(4*i-3,1)=xyl2(i,1); 
   xyt(4*i-2,1)=xyl2(i,2);
   xyt(4*i-1,1)=xyr2(i,1); 
   xyt(4*i,1)=xyr2(i,2);
end

x=xytl;

dx=1;

while norm(dx)>10^-10
    for i=1:size(xyl2,1)
   

    A2(4*i-3:4*i,3*i-2:3*i)=eval(subs(A1,{X,Y,Z},{x(3*i-2),x(3*i-1),x(3*i)}));
    FF(4*i-3:4*i,1)=eval(subs(F1,{X,Y,Z},{x(3*i-2),x(3*i-1),x(3*i)}));
    
    end
 dy=xyt-FF;
 dx=pinv(A2'*A2)*A2'*dy;
 x=x+dx;
end
xtn=vec2mat(x,3);



% tojihe motlagh

%marhale aval
xyz=[];
for i=1:size(xyzm,1)  
   xyz=[xyz;t_g(i,2);t_g(i,3);t_g(i,4)] ;
end

AA=[];
for i=1:size(xyz,1)/3 
   AA=[AA;xyzm(i,1) xyzm(i,2) xyzm(i,3) 0 0 0 0 0 0 1 0 0;0 0 0 xyzm(i,1) xyzm(i,2) xyzm(i,3) 0 0 0 0 1 0;0 0 0 0 0 0 xyzm(i,1) xyzm(i,2) xyzm(i,3) 0 0 1]; 
end
ZA=(AA'*AA)^-1*AA'*xyz;

%marhale dovom
%dar halate koli niyaz be tashih darad 

AAt=[];
for i=1:size(l,1)    
      AAt=[AAt;xtn(i,1) xtn(i,2) xtn(i,3) 0 0 0 0 0 0 1 0 0;0 0 0 xtn(i,1) xtn(i,2) xtn(i,3) 0 0 0 0 1 0;0 0 0 0 0 0 xtn(i,1) xtn(i,2) xtn(i,3) 0 0 1]; 
end

xtm=AAt*ZA;
xtm=vec2mat(xtm,3);


rmse=(xtm-t_g(number+1:number+size(l,1),2:4)).^2;
rmse=sum(sum(rmse));
rmse=(sqrt(rmse))/size(xtm,1);
set(handles.p2,'enable','on')
set(handles.p3,'enable','inactive')

end