function varargout = IO(varargin)
% IO MATLAB code for IO.fig
%      IO, by itself, creates a new IO or raises the existing
%      singleton*.
%
%      H = IO returns the handle to a new IO or the handle to
%      the existing singleton*.
%
%      IO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IO.M with the given input arguments.
%
%      IO('Property','Value',...) creates a new IO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IO

% Last Modified by GUIDE v2.5 31-Dec-2017 01:49:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IO_OpeningFcn, ...
                   'gui_OutputFcn',  @IO_OutputFcn, ...
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


% --- Executes just before IO is made visible.
function IO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IO (see VARARGIN)

% Choose default command line output for IO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IO_OutputFcn(hObject, eventdata, handles) 
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
global t_f im_l im_r k x1 x2 kk RMSE1 RMSE2 num

k=get(handles.pp1,'value');
kk=get(handles.pp1,'string');
kk=char(kk(k));
k=k-1;
if k==0
    warndlg('Select Model first','!!Warning!!')
else
    prompt = {'How many points in the first of FMS file are contorol points?'};
dlg_title = 'Contorol points';
num_lines = 1;
defaultans = {'7'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
num=str2num(answer{1});
if num>size(t_f,1)
   warndlg ('Dont enter more than max of size of FMS','!!warning!!')
   pause(2)
    close(IO)
    guidata(IO)
else
    
    set(handles.pp1,'enable','inactive');
    xf=t_f(:,1);
    yf=t_f(:,2);
    load ic7
    [l,r]=cpselect(im_l,im_r,l,r,'Wait',true);   
l=ceil(l);
r=ceil(r);
s=min(size(l,1),size(r,1));
if s>num
         warndlg ('Select Only contorol points','!!warning!!')
         pause(2)
    close(IO)
    guidata(IO)
else
    
% conformal
if k==1
%marhale 1 baraye samte chap (yaftane parametr haye model)
if s<2
    warndlg('Please select at least 2 FMs','!!Warning!!')
else
for i=1:size(l,1)
    yl(2*i-1,1)=xf(i,1);   %tashkile bordare moshahedat baraye samte chap
    yl(2*i,1)=yf(i,1);
end

Al=zeros(size(yl,1),4);
for i=1:size(l,1)
    Al(2*i-1,1)=l(i,1);
    Al(2*i,2)=-l(i,1);
    Al(2*i-1,2)=l(i,2);
    Al(2*i,1)=l(i,2);
    Al(2*i-1,3)=1;
    Al(2*i,4)=1;
end

x1=((Al'*Al)^-1)*Al'*yl;
yl2=Al*x1;
dy1=yl-yl2;
dy1=dy1.^2;
RMSE1=(sqrt(sum(dy1)))/(length(yl2)-1);


%marhale 1 baraye samte rast (yaftane parametr haye model)

for i=1:size(r,1)
    yr(2*i-1,1)=xf(i,1);   %tashkile bordare moshahedat baraye samte rast
    yr(2*i,1)=yf(i,1);
end

Ar=zeros(size(yr,1),4);
for i=1:size(r,1)
    Ar(2*i-1,1)=r(i,1);
    Ar(2*i,2)=-r(i,1);
    Ar(2*i-1,2)=r(i,2);
    Ar(2*i,1)=r(i,2);
    Ar(2*i-1,3)=1;
    Ar(2*i,4)=1;
end

x2=(Ar'*Ar)^-1*Ar'*yr;
yr2=Ar*x2;
dy2=yr-yr2;
dy2=dy2.^2;
RMSE2=(sqrt(sum(dy2)))/(length(yr2)-1);
set(handles.p2,'enable','on')
set(handles.p1,'enable','inactive');
end

% Affine
elseif k==2
%marhale 1 baraye samte chap (yaftane parametr haye model)
if s<3
    warndlg('Please select at least 3 FMs','!!Warning!!')
else
for i=1:size(l,1)
    yl(2*i-1,1)=xf(i,1);   %tashkile bordare moshahedat baraye samte chap
    yl(2*i,1)=yf(i,1);
end

Al=zeros(size(yl,1),6);
for i=1:size(l,1)
    Al(2*i-1,1)=l(i,1);
    Al(2*i,3)=-l(i,1);
    Al(2*i-1,2)=l(i,2);
    Al(2*i,4)=l(i,2);
    Al(2*i-1,5)=1;
    Al(2*i,6)=1;
end

x1=(Al'*Al)^-1*Al'*yl;
yl2=Al*x1;
dy1=yl-yl2;
dy1=dy1.^2;
RMSE1=(sqrt(sum(dy1)))/(length(yl2)-1);

%marhale 1 baraye samte rast (yaftane parametr haye model)

for i=1:size(r,1)
    yr(2*i-1,1)=xf(i,1);   %tashkile bordare moshahedat baraye samte rast
    yr(2*i,1)=yf(i,1);
end

Ar=zeros(size(yr,1),6);
for i=1:size(r,1)
    Ar(2*i-1,1)=r(i,1);
    Ar(2*i,3)=-r(i,1);
    Ar(2*i-1,2)=r(i,2);
    Ar(2*i,4)=r(i,2);
    Ar(2*i-1,5)=1;
    Ar(2*i,6)=1;
end

x2=(Ar'*Ar)^-1*Ar'*yr;
yr2=Ar*x2;
dy2=yr-yr2;
dy2=dy2.^2;
RMSE2=(sqrt(sum(dy2)))/(length(yr2)-1);
set(handles.p2,'enable','on')
set(handles.p1,'enable','inactive');
end

% projective
elseif k==3
%marhale 1 baraye samte chap (yaftane parametr haye model)
if s<4
    warndlg('Please select at least 4 FMs','!!Warning!!')
else
for i=1:size(l,1)
    yl(2*i-1,1)=xf(i,1);   %tashkile bordare moshahedat baraye samte chap
    yl(2*i,1)=yf(i,1);
end

Al=[];
for i=1:size(l,1)
   A11=[l(i,1) l(i,2) 1 0 0 0 -l(i,1)*xf(i,1) -l(i,2)*xf(i,1);0 0 0 l(i,1) l(i,2) 1 -l(i,1)*yf(i,1) -l(i,2)*yf(i,1)];
   Al=[Al;A11];

end

x1=(Al'*Al)^-1*Al'*yl;
yl2=Al*x1;
dy1=yl-yl2;
dy1=dy1.^2;
RMSE1=(sqrt(sum(dy1)))/(length(yl2)-1);

%marhale 1 baraye samte rast (yaftane parametr haye model)

for i=1:size(r,1)
    yr(2*i-1,1)=xf(i,1);   %tashkile bordare moshahedat baraye samte rast
    yr(2*i,1)=yf(i,1);
end

Ar=[];
for i=1:size(r,1)
   A22=[r(i,1) r(i,2) 1 0 0 0 -r(i,1)*xf(i,1) -r(i,2)*xf(i,1);0 0 0 r(i,1) r(i,2) 1 -r(i,1)*yf(i,1) -r(i,2)*yf(i,1)];
   Ar=[Ar;A22];

end

x2=(Ar'*Ar)^-1*Ar'*yr;
yr2=Ar*x2;
dy2=yr-yr2;
dy2=dy2.^2;
RMSE2=(sqrt(sum(dy2)))/(length(yr2)-1);
set(handles.p2,'enable','on')
set(handles.p1,'enable','inactive');
end

% polinomiyal
elseif k==4
%marhale 1 baraye samte chap (yaftane parametr haye model)
if s<6
    warndlg('Please select at least 6 FMs','!!Warning!!')
else
for i=1:size(l,1)
    yl(2*i-1,1)=xf(i,1);   %tashkile bordare moshahedat baraye samte chap
    yl(2*i,1)=yf(i,1);
end

Al=zeros(size(yl,1),12);
for i=1:size(l,1)
    Al(2*i-1,1)=1;
    Al(2*i-1,2)=l(i,1);
    Al(2*i-1,3)=l(i,2);
    Al(2*i-1,4)=l(i,1)^2;
    Al(2*i-1,5)=l(i,1)*l(i,2);
    Al(2*i-1,6)=l(i,2)^2;
    Al(2*i,7)=1;
    Al(2*i,8)=l(i,1);
    Al(2*i,9)=l(i,2);
    Al(2*i,10)=l(i,1)^2;
    Al(2*i,11)=l(i,1)*l(i,2);
    Al(2*i,12)=l(i,2)^2;
end

x1=(Al'*Al)^-1*Al'*yl;
yl2=Al*x1;
dy1=yl-yl2;
dy1=dy1.^2;
RMSE1=(sqrt(sum(dy1)))/(length(yl2)-1);

%marhale 1 baraye samte rast (yaftane parametr haye model)

for i=1:size(r,1)
    yr(2*i-1,1)=xf(i,1);   %tashkile bordare moshahedat baraye samte rast
    yr(2*i,1)=yf(i,1);
end

Ar=zeros(size(yr,1),12);
for i=1:size(r,1)
    Ar(2*i-1,1)=1;
    Ar(2*i-1,2)=r(i,1);
    Ar(2*i-1,3)=r(i,2);
    Ar(2*i-1,4)=r(i,1)^2;
    Ar(2*i-1,5)=r(i,1)*r(i,2);
    Ar(2*i-1,6)=r(i,2)^2;
    Ar(2*i,7)=1;
    Ar(2*i,8)=r(i,1);
    Ar(2*i,9)=r(i,2);
    Ar(2*i,10)=r(i,1)^2;
    Ar(2*i,11)=r(i,1)*r(i,2);
    Ar(2*i,12)=r(i,2)^2;
end

x2=(Ar'*Ar)^-1*Ar'*yr;
yr2=Ar*x2;
dy2=yr-yr2;
dy2=dy2.^2;
RMSE2=(sqrt(sum(dy2)))/(length(yr2)-1);
set(handles.p2,'enable','on')
  set(handles.p1,'enable','inactive');
end
    
    
end
end
end
end


% --- Executes on button press in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k x1 x2 xf1 yf1 xf2 yf2
warndlg('Please wait','!!Wait a minute!!')
set(handles.p3,'enable','on')
set(handles.p4,'enable','on')


    load ij
    l2=t;
    r2=t;
% conformal
if k==1
%marhaleye 2 baraye aske chap (mokhtasate kalibre shodeye sayere noghat)
Al2=zeros(2*size(l2,1),4);
for i=1:size(l2,1)
    Al2(2*i-1,1)=l2(i,1);
    Al2(2*i,2)=-l2(i,1);
    Al2(2*i-1,2)=l2(i,2);
    Al2(2*i,1)=l2(i,2);
    Al2(2*i-1,3)=1;
    Al2(2*i,4)=1;
end

xxl=Al2*x1;
xfl=[];yfl=[];
for i=1:size(xxl,1)/2
    xfl=[xfl;xxl(2*i-1)];
    yfl=[yfl;xxl(2*i)];
end
yfl=-yfl;  %ba tavajoh be inke mehvar y dar 2 sistem jahatesh fargh darad

%marhaleye 2 baraye aske rast (mokhtasate kalibre shodeye sayere noghat)
Ar2=zeros(2*size(r2,1),4);
for i=1:size(r2,1)
    Ar2(2*i-1,1)=r2(i,1);
    Ar2(2*i,2)=-r2(i,1);
    Ar2(2*i-1,2)=r2(i,2);
    Ar2(2*i,1)=r2(i,2);
    Ar2(2*i-1,3)=1;
    Ar2(2*i,4)=1;
end

xxr=Ar2*x2;
xfr=[];yfr=[];
for i=1:size(xxr,1)/2
    xfr=[xfr;xxr(2*i-1)];
    yfr=[yfr;xxr(2*i)];
end
yfr=-yfr;  %ba tavajoh be inke mehvar y dar 2 sistem jahatesh fargh darad

% Affine
elseif k==2
%marhaleye 2 baraye aske chap (mokhtasate kalibre shodeye sayere noghat)
Al2=zeros(2*size(l2,1),6);
for i=1:size(l2,1)
    Al2(2*i-1,1)=l2(i,1);
    Al2(2*i,3)=-l2(i,1);
    Al2(2*i-1,2)=l2(i,2);
    Al2(2*i,4)=l2(i,2);
    Al2(2*i-1,5)=1;
    Al2(2*i,6)=1;
end

xxl=Al2*x1;
xfl=[];yfl=[];
for i=1:size(xxl,1)/2
    xfl=[xfl;xxl(2*i-1)];
    yfl=[yfl;xxl(2*i)];
end

%marhaleye 2 baraye aske rast (mokhtasate kalibre shodeye sayere noghat)
Ar2=zeros(2*size(r2,1),6);
for i=1:size(r2,1)
    Ar2(2*i-1,1)=r2(i,1);
    Ar2(2*i,3)=-r2(i,1);
    Ar2(2*i-1,2)=r2(i,2);
    Ar2(2*i,4)=r2(i,2);
    Ar2(2*i-1,5)=1;
    Ar2(2*i,6)=1;
end

xxr=Ar2*x2;
xfr=[];yfr=[];
for i=1:size(xxr,1)/2
    xfr=[xfr;xxr(2*i-1)];
    yfr=[yfr;xxr(2*i)];
end
    
% projective
elseif k==3
%marhaleye 2 baraye aske chap (mokhtasate kalibre shodeye sayere noghat)

for i=1:size(l2,1)
xfl(i)=(x1(1)*l2(i,1)+x1(2)*l2(i,2)+x1(3))/(x1(7)*l2(i,1)+x1(8)*l2(i,2)+1);
yfl(i)=(x1(4)*l2(i,1)+x1(5)*l2(i,2)+x1(6))/(x1(7)*l2(i,1)+x1(8)*l2(i,2)+1);
end
xfl=xfl';
yfl=yfl';

%marhaleye 2 baraye aske rast (mokhtasate kalibre shodeye sayere noghat)

for i=1:size(r2,1)
xfr(i)=(x2(1)*r2(i,1)+x2(2)*r2(i,2)+x2(3))/(x2(7)*r2(i,1)+x2(8)*r2(i,2)+1);
yfr(i)=(x2(4)*r2(i,1)+x2(5)*r2(i,2)+x2(6))/(x2(7)*r2(i,1)+x2(8)*r2(i,2)+1);
end
xfr=xfr';
yfr=yfr';
    
% polinomiyal
elseif k==4
%marhaleye 2 baraye aske chap (mokhtasate kalibre shodeye sayere noghat)
Al2=zeros(2*size(l2,1),12);

for i=1:size(l2,1)
    Al2(2*i-1,1)=1;
    Al2(2*i-1,2)=l2(i,1);
    Al2(2*i-1,3)=l2(i,2);
    Al2(2*i-1,4)=l2(i,1)^2;
    Al2(2*i-1,5)=l2(i,1)*l2(i,2);
    Al2(2*i-1,6)=l2(i,2)^2;
    Al2(2*i,7)=1;
    Al2(2*i,8)=l2(i,1);
    Al2(2*i,9)=l2(i,2);
    Al2(2*i,10)=l2(i,1)^2;
    Al2(2*i,11)=l2(i,1)*l2(i,2);
    Al2(2*i,12)=l2(i,2)^2;
end

xxl=Al2*x1;
xfl=[];yfl=[];
for i=1:size(xxl,1)/2
    xfl=[xfl;xxl(2*i-1)];
    yfl=[yfl;xxl(2*i)];
end
%marhaleye 2 baraye aske rast (mokhtasate kalibre shodeye sayere noghat)
Ar2=zeros(2*size(r2,1),12);

for i=1:size(r2,1)
    Ar2(2*i-1,1)=1;
    Ar2(2*i-1,2)=r2(i,1);
    Ar2(2*i-1,3)=r2(i,2);
    Ar2(2*i-1,4)=r2(i,1)^2;
    Ar2(2*i-1,5)=r2(i,1)*r2(i,2);
    Ar2(2*i-1,6)=r2(i,2)^2;
    Ar2(2*i,7)=1;
    Ar2(2*i,8)=r2(i,1);
    Ar2(2*i,9)=r2(i,2);
    Ar2(2*i,10)=r2(i,1)^2;
    Ar2(2*i,11)=r2(i,1)*r2(i,2);
    Ar2(2*i,12)=r2(i,2)^2;
end

xxr=Ar2*x2;
xfr=[];yfr=[];
for i=1:size(xxr,1)/2
    xfr=[xfr;xxr(2*i-1)];
    yfr=[yfr;xxr(2*i)];
end
    
end
xf1=xfl;
yf1=yfl;
xf2=xfr;
yf2=yfr;
set(handles.p2,'enable','inactive');
% --- Executes on button press in p3.
function p3_Callback(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.p3,'enable','inactive');
 global k x1 x2 num rmsel rmser im_l im_r t_f
  load v8
[llp,rrp]=cpselect(im_l,im_r,l2,r2,'Wait',true);
if size(llp,1)>(size(t_f,1)-num)
    warndlg('Only choose Check point','Warning')
else
    l2=llp;
    r2=rrp;
    % conformal
if k==1
%marhaleye 2 baraye aske chap (mokhtasate kalibre shodeye sayere noghat)
Al2=zeros(2*size(l2,1),4);
for i=1:size(l2,1)
    Al2(2*i-1,1)=l2(i,1);
    Al2(2*i,2)=-l2(i,1);
    Al2(2*i-1,2)=l2(i,2);
    Al2(2*i,1)=l2(i,2);
    Al2(2*i-1,3)=1;
    Al2(2*i,4)=1;
end

xxl=Al2*x1;
xfl=[];yfl=[];
for i=1:size(xxl,1)/2
    xfl=[xfl;xxl(2*i-1)];
    yfl=[yfl;xxl(2*i)];
end
yfl=-yfl;  %ba tavajoh be inke mehvar y dar 2 sistem jahatesh fargh darad

%marhaleye 2 baraye aske rast (mokhtasate kalibre shodeye sayere noghat)
Ar2=zeros(2*size(r2,1),4);
for i=1:size(r2,1)
    Ar2(2*i-1,1)=r2(i,1);
    Ar2(2*i,2)=-r2(i,1);
    Ar2(2*i-1,2)=r2(i,2);
    Ar2(2*i,1)=r2(i,2);
    Ar2(2*i-1,3)=1;
    Ar2(2*i,4)=1;
end

xxr=Ar2*x2;
xfr=[];yfr=[];
for i=1:size(xxr,1)/2
    xfr=[xfr;xxr(2*i-1)];
    yfr=[yfr;xxr(2*i)];
end
yfr=-yfr;  %ba tavajoh be inke mehvar y dar 2 sistem jahatesh fargh darad

% Affine
elseif k==2
%marhaleye 2 baraye aske chap (mokhtasate kalibre shodeye sayere noghat)
Al2=zeros(2*size(l2,1),6);
for i=1:size(l2,1)
    Al2(2*i-1,1)=l2(i,1);
    Al2(2*i,3)=-l2(i,1);
    Al2(2*i-1,2)=l2(i,2);
    Al2(2*i,4)=l2(i,2);
    Al2(2*i-1,5)=1;
    Al2(2*i,6)=1;
end

xxl=Al2*x1;
xfl=[];yfl=[];
for i=1:size(xxl,1)/2
    xfl=[xfl;xxl(2*i-1)];
    yfl=[yfl;xxl(2*i)];
end

%marhaleye 2 baraye aske rast (mokhtasate kalibre shodeye sayere noghat)
Ar2=zeros(2*size(r2,1),6);
for i=1:size(r2,1)
    Ar2(2*i-1,1)=r2(i,1);
    Ar2(2*i,3)=-r2(i,1);
    Ar2(2*i-1,2)=r2(i,2);
    Ar2(2*i,4)=r2(i,2);
    Ar2(2*i-1,5)=1;
    Ar2(2*i,6)=1;
end

xxr=Ar2*x2;
xfr=[];yfr=[];
for i=1:size(xxr,1)/2
    xfr=[xfr;xxr(2*i-1)];
    yfr=[yfr;xxr(2*i)];
end
    
% projective
elseif k==3
%marhaleye 2 baraye aske chap (mokhtasate kalibre shodeye sayere noghat)

for i=1:size(l2,1)
xfl(i)=(x1(1)*l2(i,1)+x1(2)*l2(i,2)+x1(3))/(x1(7)*l2(i,1)+x1(8)*l2(i,2)+1);
yfl(i)=(x1(4)*l2(i,1)+x1(5)*l2(i,2)+x1(6))/(x1(7)*l2(i,1)+x1(8)*l2(i,2)+1);
end
xfl=xfl';
yfl=yfl';

%marhaleye 2 baraye aske rast (mokhtasate kalibre shodeye sayere noghat)

for i=1:size(r2,1)
xfr(i)=(x2(1)*r2(i,1)+x2(2)*r2(i,2)+x2(3))/(x2(7)*r2(i,1)+x2(8)*r2(i,2)+1);
yfr(i)=(x2(4)*r2(i,1)+x2(5)*r2(i,2)+x2(6))/(x2(7)*r2(i,1)+x2(8)*r2(i,2)+1);
end
xfr=xfr';
yfr=yfr';
    
% polinomiyal
elseif k==4
%marhaleye 2 baraye aske chap (mokhtasate kalibre shodeye sayere noghat)
Al2=zeros(2*size(l2,1),12);

for i=1:size(l2,1)
    Al2(2*i-1,1)=1;
    Al2(2*i-1,2)=l2(i,1);
    Al2(2*i-1,3)=l2(i,2);
    Al2(2*i-1,4)=l2(i,1)^2;
    Al2(2*i-1,5)=l2(i,1)*l2(i,2);
    Al2(2*i-1,6)=l2(i,2)^2;
    Al2(2*i,7)=1;
    Al2(2*i,8)=l2(i,1);
    Al2(2*i,9)=l2(i,2);
    Al2(2*i,10)=l2(i,1)^2;
    Al2(2*i,11)=l2(i,1)*l2(i,2);
    Al2(2*i,12)=l2(i,2)^2;
end

xxl=Al2*x1;
xfl=[];yfl=[];
for i=1:size(xxl,1)/2
    xfl=[xfl;xxl(2*i-1)];
    yfl=[yfl;xxl(2*i)];
end
%marhaleye 2 baraye aske rast (mokhtasate kalibre shodeye sayere noghat)
Ar2=zeros(2*size(r2,1),12);

for i=1:size(r2,1)
    Ar2(2*i-1,1)=1;
    Ar2(2*i-1,2)=r2(i,1);
    Ar2(2*i-1,3)=r2(i,2);
    Ar2(2*i-1,4)=r2(i,1)^2;
    Ar2(2*i-1,5)=r2(i,1)*r2(i,2);
    Ar2(2*i-1,6)=r2(i,2)^2;
    Ar2(2*i,7)=1;
    Ar2(2*i,8)=r2(i,1);
    Ar2(2*i,9)=r2(i,2);
    Ar2(2*i,10)=r2(i,1)^2;
    Ar2(2*i,11)=r2(i,1)*r2(i,2);
    Ar2(2*i,12)=r2(i,2)^2;
end

xxr=Ar2*x2;
xfr=[];yfr=[];
for i=1:size(xxr,1)/2
    xfr=[xfr;xxr(2*i-1)];
    yfr=[yfr;xxr(2*i)];
end
    
end
lco=[xfl,yfl];
rco=[xfr,yfr];

rmsel=(lco-t_f(num+1:num+size(llp,1),1:2)).^2;
rmsel=sum(sum(rmsel));
rmsel=sqrt(rmsel)/size(lco,1);

rmser=(rco-t_f(num+1:num+size(llp,1),1:2)).^2;
rmser=sum(sum(rmser));
rmser=sqrt(rmser)/size(rco,1);
end



% --- Executes on button press in p4.
function p4_Callback(hObject, eventdata, handles)
% hObject    handle to p4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x1 x2 xf1 yf1 xf2 yf2 kk RMSE1 RMSE2 rmsel rmser
handles = guidata(hObject);

 n4=x1;
 n41=x2;
 n42=[xf1 yf1];
 n43=[xf2 yf2];
 n44=kk;
 n45=RMSE1;
 n46=RMSE2;
 n47=rmsel;
 n48=rmser;
fhandles = guidata(final);


fhandles.n4 = n4;
fhandles.n41 = n41;
fhandles.n42 = n42;
fhandles.n43 = n43;
fhandles.n44 = n44;
fhandles.n45 = n45;
fhandles.n46 = n46;
fhandles.n47 = n47;
fhandles.n48 = n48;

set(fhandles.re,'enable','on')


guidata(final,fhandles)
set(fhandles.io,'enable','off')
set(fhandles.gen,'enable','off')
set(fhandles.exp,'enable','on')
set(fhandles.ei,'enable','on')
set(fhandles.p2,'enable','on');
set(fhandles.c2,'visible','on');

set(fhandles.s8,'visible','on');
set(fhandles.s9,'visible','on');

set(fhandles.s9,'string',kk);
close(IO)

% --- Executes on selection change in pp1.
function pp1_Callback(hObject, eventdata, handles)
% hObject    handle to pp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.p1,'enable','on')
