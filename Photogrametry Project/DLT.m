function varargout = DLT(varargin)
% DLT MATLAB code for DLT.fig
%      DLT, by itself, creates a new DLT or raises the existing
%      singleton*.
%
%      H = DLT returns the handle to a new DLT or the handle to
%      the existing singleton*.
%
%      DLT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DLT.M with the given input arguments.
%
%      DLT('Property','Value',...) creates a new DLT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DLT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DLT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DLT

% Last Modified by GUIDE v2.5 19-Jan-2018 01:06:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DLT_OpeningFcn, ...
                   'gui_OutputFcn',  @DLT_OutputFcn, ...
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


% --- Executes just before DLT is made visible.
function DLT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DLT (see VARARGIN)

% Choose default command line output for DLT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DLT wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global rmse
rmse=0;

% --- Outputs from this function are returned to the command line.
function varargout = DLT_OutputFcn(hObject, eventdata, handles) 
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

%yaftane moshahedat
global im_l im_r t_g xx lp num
prompt = {'How many points in the first of GCPs file are contorol points?'};
dlg_title = 'Contorol points';
num_lines = 1;
defaultans = {'9'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
num=str2num(answer{1});
if num<6 || num>size(t_g,1)
   warndlg ('Enter at least 6 contorol points or max size of GCPS','!!warning!!')
   pause(2)
    close(DLT)
    guidata(DLT)
else
load im_l1
  load im_r1
  mp=[xl' yl'];
  fp=[xr' yr'];
[lp,rp]=cpselect(im_l,im_r,mp,fp,'Wait',true);
lp=ceil(lp);
rp=ceil(rp);
xl=lp(:,1);
yl=lp(:,2);
xr=rp(:,1);
yr=rp(:,2);
s=min(size(xl,1),size(xr,1));
if s<6
    warndlg ('Enter at least 6 contorol points in each picture','!!warning!!')
elseif s>num
         warndlg ('Select Only contorol points','!!warning!!')
else
l1=[];
l2=[];
for i=1:s
    l1=[l1;xl(i);yl(i)];
    l2=[l2;xr(i);yr(i)];
end
l=[l1;l2];
%malomat (mokhtasate GCPs)
X=t_g(:,2);
Y=t_g(:,3);
Z=t_g(:,4);

%yaftane matrise A dar sar shekani
A1=[];A2=[];
for i=1:s
   A11=[X(i) Y(i) Z(i) 1 0 0 0 0 -X(i)*xl(i) -Y(i)*xl(i) -Z(i)*xl(i) 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 X(i) Y(i) Z(i) 1 -X(i)*yl(i) -Y(i)*yl(i) -Z(i)*yl(i) 0 0 0 0 0 0 0 0 0 0 0];
   A1=[A1;A11];
   A22=[0 0 0 0 0 0 0 0 0 0 0 X(i) Y(i) Z(i) 1 0 0 0 0 -X(i)*xr(i) -Y(i)*xr(i) -Z(i)*xr(i);0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X(i) Y(i) Z(i) 1 -X(i)*yr(i) -Y(i)*yr(i) -Z(i)*yr(i)];
   A2=[A2;A22];
end
A=[A1;A2]; %matrise disiyn

%majholat(parametr haye DLT 22 ta L)
xx=inv(A'*A)*A'*l;
set(handles.p4,'enable','on')
set(handles.p2,'enable','on')
set(handles.p1,'enable','inactive')
end
end




% --- Executes on button press in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_l im_r t_g xx f H Xfcc Yfcc hfm
  load i1
[llp,rrp]=cpselect(im_l,im_r,i1,i2,'Wait',true);
llp=ceil(llp);
rrp=ceil(rrp);
xll=llp(:,1);
yll=llp(:,2);
xrr=rrp(:,1);
yrr=rrp(:,2);
s=min(size(xll,1),size(xrr,1));
ll=[];
ll2=[];
for i=1:s
    ll=[ll;xll(i);yll(i)];
    ll2=[ll2;xrr(i);yrr(i)];
end


%ertefaye motevasete mantaghe (miyangin GCPs)
hm11=mean(t_g(:,4));
% hm=hm1*ones(n,1);

ps=0.23/2880;  %pixel size
dxl= 2030.14389523126;
dyl= 3807.91191212267;
dxr=3365.18378329078;
dyr=3714.32881437937;

sm=f/(H-hm11);
Xcc1=xll'/sm*ps+dxl;
Ycc1=-yll'/sm*ps+dyl;
Xcc2=xrr'/sm*ps+dxr;
Ycc2=-yrr'/sm*ps+dyr;

Xcc11=(Xcc1+Xcc2)./2;
Ycc11=(Ycc1+Ycc2)./2;

%matrise A

syms x1 y1 X1 Y1 Z1  x2 y2

%formole DLT baraye akse chap
x1=(xx(1)*X1+xx(2)*Y1+xx(3)*Z1+xx(4))/(xx(9)*X1+xx(10)*Y1+xx(11)*Z1+1);
y1=(xx(5)*X1+xx(6)*Y1+xx(7)*Z1+xx(8))/(xx(9)*X1+xx(10)*Y1+xx(11)*Z1+1);
%formole DLT baraye akse rast
x2=(xx(12)*X1+xx(13)*Y1+xx(14)*Z1+xx(15))/(xx(20)*X1+xx(21)*Y1+xx(22)*Z1+1);
y2=(xx(16)*X1+xx(17)*Y1+xx(18)*Z1+xx(19))/(xx(20)*X1+xx(21)*Y1+xx(22)*Z1+1);

%moshtaghat smate chap
jx1=diff(x1,X1);jx2=diff(x1,Y1);jx3=diff(x1,Z1);
jy1=diff(y1,X1);jy2=diff(y1,Y1);jy3=diff(y1,Z1);
%moshtaghat smate rast
jx11=diff(x2,X1);jx22=diff(x2,Y1);jx33=diff(x2,Z1);
jy11=diff(y2,X1);jy22=diff(y2,Y1);jy33=diff(y2,Z1);


%majholat

Xfcc=[];
Yfcc=[];
hfm=[];

for p=1:s
Xcc=Xcc11(p);Ycc=Ycc11(p);hm1=hm11;
xxx=[Xcc;Ycc;hm1];

ll3=[ll(2*p-1);ll(2*p);ll2(2*p-1);ll2(2*p)];

dx=1;
while max(abs(dx))>10^-10
    
%matrise A
AA=zeros(4,3);
%baraye moshahedate samte chap
   AA(1,1)=(subs(jx1,{X1 Y1 Z1},{Xcc Ycc hm1}));
   AA(1,2)=subs(jx2,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(1,3)=subs(jx3,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(2,1)=subs(jy1,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(2,2)=subs(jy2,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(2,3)=subs(jy3,{X1 Y1 Z1},{Xcc Ycc hm1});
   
   yc0(1,1)=subs(x1,{X1 Y1 Z1},{Xcc Ycc hm1});
   yc0(2,1)=subs(y1,{X1 Y1 Z1},{Xcc Ycc hm1});
%baraye moshahedate samte rast
% s=1;
   AA(3,1)=subs(jx11,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(3,2)=subs(jx22,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(3,3)=subs(jx33,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(4,1)=subs(jy11,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(4,2)=subs(jy22,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(4,3)=subs(jy33,{X1 Y1 Z1},{Xcc Ycc hm1});
   
    yc0(3,1)=subs(x2,{X1 Y1 Z1},{Xcc Ycc hm1});
   yc0(4,1)=subs(y2,{X1 Y1 Z1},{Xcc Ycc hm1});
   

dy=ll3-yc0;
dx=eval((AA'*AA)^-1*AA'*dy);
xxx=xxx+dx;
Xcc=xxx(1);Ycc=xxx(2);hm1=xxx(3);
end
Xfcc=[Xfcc;Xcc];
Yfcc=[Yfcc;Ycc];
hfm=[hfm;hm1];
end
set(handles.p3,'enable','on')
set(handles.p4,'enable','on')
set(handles.p2,'enable','inactive')

% --- Executes on button press in p3.
function p3_Callback(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.p3,'enable','inactive')
global im_l im_r t_g xx f H rmse num
  load contorol10_11
[llp,rrp]=cpselect(im_l,im_r,l,r,'Wait',true);
if size(llp,1)>(size(t_g,1)-num)
    warndlg('Only choose Check point','Warning')
else
llp=ceil(llp);
rrp=ceil(rrp);
xll=llp(:,1);
yll=llp(:,2);
xrr=rrp(:,1);
yrr=rrp(:,2);
s=min(size(xll,1),size(xrr,1));
ll=[];
ll2=[];
for i=1:s
    ll=[ll;xll(i);yll(i)];
    ll2=[ll2;xrr(i);yrr(i)];
end


%ertefaye motevasete mantaghe (miyangin GCPs)
hm11=mean(t_g(:,4));
% hm=hm1*ones(n,1);

ps=0.23/2880;  %pixel size
dxl= 2030.14389523126;
dyl= 3807.91191212267;
dxr=3365.18378329078;
dyr=3714.32881437937;

sm=f/(H-hm11);
Xcc1=xll'/sm*ps+dxl;
Ycc1=-yll'/sm*ps+dyl;
Xcc2=xrr'/sm*ps+dxr;
Ycc2=-yrr'/sm*ps+dyr;

Xcc11=(Xcc1+Xcc2)./2;
Ycc11=(Ycc1+Ycc2)./2;

%matrise A

syms x1 y1 X1 Y1 Z1  x2 y2

%formole DLT baraye akse chap
x1=(xx(1)*X1+xx(2)*Y1+xx(3)*Z1+xx(4))/(xx(9)*X1+xx(10)*Y1+xx(11)*Z1+1);
y1=(xx(5)*X1+xx(6)*Y1+xx(7)*Z1+xx(8))/(xx(9)*X1+xx(10)*Y1+xx(11)*Z1+1);
%formole DLT baraye akse rast
x2=(xx(12)*X1+xx(13)*Y1+xx(14)*Z1+xx(15))/(xx(20)*X1+xx(21)*Y1+xx(22)*Z1+1);
y2=(xx(16)*X1+xx(17)*Y1+xx(18)*Z1+xx(19))/(xx(20)*X1+xx(21)*Y1+xx(22)*Z1+1);

%moshtaghat smate chap
jx1=diff(x1,X1);jx2=diff(x1,Y1);jx3=diff(x1,Z1);
jy1=diff(y1,X1);jy2=diff(y1,Y1);jy3=diff(y1,Z1);
%moshtaghat smate rast
jx11=diff(x2,X1);jx22=diff(x2,Y1);jx33=diff(x2,Z1);
jy11=diff(y2,X1);jy22=diff(y2,Y1);jy33=diff(y2,Z1);


%majholat

Xfcc=[];
Yfcc=[];
hfm=[];

for p=1:s
Xcc=Xcc11(p);Ycc=Ycc11(p);hm1=hm11;
xxx=[Xcc;Ycc;hm1];

ll3=[ll(2*p-1);ll(2*p);ll2(2*p-1);ll2(2*p)];

dx=1;
while max(abs(dx))>10^-10
    
%matrise A
AA=zeros(4,3);
%baraye moshahedate samte chap
   AA(1,1)=(subs(jx1,{X1 Y1 Z1},{Xcc Ycc hm1}));
   AA(1,2)=subs(jx2,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(1,3)=subs(jx3,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(2,1)=subs(jy1,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(2,2)=subs(jy2,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(2,3)=subs(jy3,{X1 Y1 Z1},{Xcc Ycc hm1});
   
   yc0(1,1)=subs(x1,{X1 Y1 Z1},{Xcc Ycc hm1});
   yc0(2,1)=subs(y1,{X1 Y1 Z1},{Xcc Ycc hm1});
%baraye moshahedate samte rast
% s=1;
   AA(3,1)=subs(jx11,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(3,2)=subs(jx22,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(3,3)=subs(jx33,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(4,1)=subs(jy11,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(4,2)=subs(jy22,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(4,3)=subs(jy33,{X1 Y1 Z1},{Xcc Ycc hm1});
   
    yc0(3,1)=subs(x2,{X1 Y1 Z1},{Xcc Ycc hm1});
   yc0(4,1)=subs(y2,{X1 Y1 Z1},{Xcc Ycc hm1});
   

dy=ll3-yc0;
dx=eval((AA'*AA)^-1*AA'*dy);
xxx=xxx+dx;
Xcc=xxx(1);Ycc=xxx(2);hm1=xxx(3);
end
Xfcc=[Xfcc;Xcc];
Yfcc=[Yfcc;Ycc];
hfm=[hfm;hm1];
end
fc=[Xfcc Yfcc hfm];
rmse=(fc-t_g(num+1:num+size(llp,1),2:4)).^2;
rmse=sum(sum(rmse));
rmse=sqrt(rmse)/size(fc,1);
end

% --- Executes on button press in p4.
function p4_Callback(hObject, eventdata, handles)
% hObject    handle to p4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xx Xfcc Yfcc hfm rmse

handles = guidata(hObject);

 n3=[Xfcc Yfcc hfm];
 n31=xx;
 n32=rmse;
fhandles = guidata(final);


fhandles.n3 = n3;
fhandles.n31 = n31;
fhandles.n32 = n32;
set(fhandles.t1,'data',n3);
set(fhandles.s3,'visible','on');
if rmse~=0
set(fhandles.s5,'string',n32);
set(fhandles.s4,'visible','on');
set(fhandles.s5,'visible','on');
set(fhandles.edr,'enable','on');
end
set(fhandles.t1,'visible','on');
set(fhandles.phy,'enable','off');
set(fhandles.str,'enable','on');
set(fhandles.ed,'enable','on');
set(fhandles.exp,'enable','on');
set(fhandles.pro,'enable','off');
guidata(final,fhandles)

close(DLT)
