function varargout = TT(varargin)
% TT MATLAB code for TT.fig
%      TT, by itself, creates a new TT or raises the existing
%      singleton*.
%
%      H = TT returns the handle to a new TT or the handle to
%      the existing singleton*.
%
%      TT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TT.M with the given input arguments.
%
%      TT('Property','Value',...) creates a new TT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TT

% Last Modified by GUIDE v2.5 30-Dec-2017 20:15:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TT_OpeningFcn, ...
                   'gui_OutputFcn',  @TT_OutputFcn, ...
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


% --- Executes just before TT is made visible.
function TT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TT (see VARARGIN)

% Choose default command line output for TT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TT_OutputFcn(hObject, eventdata, handles) 
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
global im_l im_r t_g mpl mpr zl zr xyl xyr hm  f c x1l x1r num

    prompt = {'How many points in the first of GCPs file are contorol points?'};
dlg_title = 'Contorol points';
num_lines = 1;
defaultans = {'9'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
num=str2num(answer{1});
if num>size(t_g,1)
   warndlg ('Dont enter more than max of size of GCPs','!!warning!!')
   pause(2)
    close(TT)
    guidata(TT)
else
    
load ij
c=f;
xyl=mpl;
xyr=mpr;

syms w f k x y X0 Y0 Z0 X Y Z
M1=[1 0 0;0 cos(w) -sin(w);0 sin(w) cos(w)];
M2=[cos(f) 0 sin(f);0 1 0;-sin(f) 0 cos(f)];
M3=[cos(k) -sin(k) 0;sin(k) cos(k) 0;0 0 1];
M=M3*M2*M1;         %matrise davaran

X1=[X-X0;Y-Y0;Z-Z0];
MX=M*X1;

m=-c/MX(3,1);
fx=m*MX(1,1);  %moadelat sharte ham khati
fy=m*MX(2,1);
F=[fx;fy];

dfxw=diff(fx,w);dfxf=diff(fx,f);dfxk=diff(fx,k);dfxX0=diff(fx,X0);dfxY0=diff(fx,Y0);dfxZ0=diff(fx,Z0);
dfyw=diff(fy,w);dfyf=diff(fy,f);dfyk=diff(fy,k);dfyX0=diff(fy,X0);dfyY0=diff(fy,Y0);dfyZ0=diff(fy,Z0);
dfxX=diff(fx,X);dfxY=diff(fx,Y);dfxZ=diff(fx,Z);
dfyX=diff(fy,X);dfyY=diff(fy,Y);dfyZ=diff(fy,Z);
%baraye tarfi
Al11=[dfxw,dfxf,dfxk,dfxX0,dfxY0,dfxZ0;dfyw,dfyf,dfyk,dfyX0,dfyY0,dfyZ0];
Ar11=[dfxw,dfxf,dfxk,dfxX0,dfxY0,dfxZ0;dfyw,dfyf,dfyk,dfyX0,dfyY0,dfyZ0];
%baraye taghato
Af=[dfxX,dfxY,dfxZ;dfyX,dfyY,dfyZ];


% marhale 1
load contorol9
[l,r]=cpselect(im_l,im_r,l,r,'Wait',true);
l=ceil(l);
r=ceil(r);
s=min(size(l,1),size(r,1));
if s<3 || s>num
       warndlg ('Select at least 3 points or only contorol points','!!warning!!')
         pause(2)
    close(IO)
    guidata(IO)
    else
 

xyl2=xyl((l(:,1)-1).*max(t(:,2))+l(:,2),:);   %payda kardan mokhtasate palayesh shodeye noghate gerefte shode roye tasvir
xyr2=xyr((r(:,1)-1).*max(t(:,2))+r(:,2),:);


hm=(sum(t_g(:,4)))/size(t_g,1); %ertefaeh motevaset

% tarfiye akse chap
%conformal chap

for i=1:size(xyl2,1)
    xyg(2*i-1,1)=t_g(i,2);   %tashkile bordare moshahedat baraye samte chap
    xyg(2*i,1)=t_g(i,3);
end
Al=[];
for i=1:size(xyl2,1)
   Al=[Al;xyl2(i,1) xyl2(i,2) 1 0;xyl2(i,2) -xyl2(i,1) 0 1]; 
end
zl=(Al'*Al)^(-1)*Al'*xyg; %zarayebe conformal
X0l=zl(3);Y0l=zl(4); kl=atan2(zl(2),zl(1)); 
landa=sqrt(zl(1)^2+zl(2)^2);
Z02=c*landa+hm;


%majholat tarfi akse chap
for i=1:size(xyl2,1)
   xytl(2*i-1,1)=xyl2(i,1);
   xytl(2*i,1)=xyl2(i,2);
end

dlz=1;
x1l=[0.01;0.01;kl;X0l;Y0l;Z02];
while norm(dlz)>10^-10
Al1=[];Fl=[];
for i=1:size(xyl2,1)
   Al111=eval(subs(Al11,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1l(1),x1l(2),x1l(3),x1l(4),x1l(5),x1l(6),t_g(i,2),t_g(i,3),t_g(i,4)})); 
   Al1=[Al1;Al111];
   F1=eval(subs(F,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1l(1),x1l(2),x1l(3),x1l(4),x1l(5),x1l(6),t_g(i,2),t_g(i,3),t_g(i,4)}));
   Fl=[Fl;F1];
end
dyl=xytl-Fl;
dlz=(inv(Al1'*Al1))*(Al1'*dyl);     %majholate tarfi akse chap  
x1l=x1l+dlz;

end


% tarifiye akse rast
%conformal rast
for i=1:size(xyr2,1)
   xytr(2*i-1,1)=xyr2(i,1);
   xytr(2*i,1)=xyr2(i,2);
end
Ar=[];
for i=1:size(xyr2,1)
   Ar=[Ar;xyr2(i,1) xyr2(i,2) 1 0;xyr2(i,2) -xyr2(i,1) 0 1]; 
end
zr=(Ar'*Ar)^-1*Ar'*xyg; %zarayebe conformal
X0r=zr(3);Y0r=zr(4); kr=atan2(zr(2),zr(1)); 
landa=sqrt(zr(1)^2+zr(2)^2);
Z0r=c*landa+hm;


%majholat tarfi akse rast
drz=1;
x1r=[0;0;kr;X0r;Y0r;Z0r];
while max(abs(drz))>10^-10
Ar1=[];Fr=[];
for i=1:size(xyr2,1)
   Ar111=eval(subs(Ar11,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1r(1),x1r(2),x1r(3),x1r(4),x1r(5),x1r(6),t_g(i,2),t_g(i,3),t_g(i,4)})); 
   Ar1=[Ar1;Ar111];
   F2=eval(subs(F,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1r(1),x1r(2),x1r(3),x1r(4),x1r(5),x1r(6),t_g(i,2),t_g(i,3),t_g(i,4)}));
   Fr=[Fr;F2];
end
dyr=xytr-Fr;
drz=(Ar1'*Ar1)^-1*Ar1'*dyr;  %majholate tarfi akse rast
x1r=x1r+drz;

end
set(handles.p2,'enable','on')
set(handles.p1,'enable','inactive');
end
end

% --- Executes on button press in p3.
function p3_Callback(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.p3,'enable','inactive');

global zl zr im_l im_r xyl xyr hm c x1l x1r num t_g rmse

syms w f k x y X0 Y0 Z0 X Y Z
M1=[1 0 0;0 cos(w) -sin(w);0 sin(w) cos(w)];
M2=[cos(f) 0 sin(f);0 1 0;-sin(f) 0 cos(f)];
M3=[cos(k) -sin(k) 0;sin(k) cos(k) 0;0 0 1];
M=M3*M2*M1;         %matrise davaran

X1=[X-X0;Y-Y0;Z-Z0];
MX=M*X1;

m=-c/MX(3,1);
fx=m*MX(1,1);  %moadelat sharte ham khati
fy=m*MX(2,1);
F=[fx;fy];

dfxw=diff(fx,w);dfxf=diff(fx,f);dfxk=diff(fx,k);dfxX0=diff(fx,X0);dfxY0=diff(fx,Y0);dfxZ0=diff(fx,Z0);
dfyw=diff(fy,w);dfyf=diff(fy,f);dfyk=diff(fy,k);dfyX0=diff(fy,X0);dfyY0=diff(fy,Y0);dfyZ0=diff(fy,Z0);
dfxX=diff(fx,X);dfxY=diff(fx,Y);dfxZ=diff(fx,Z);
dfyX=diff(fy,X);dfyY=diff(fy,Y);dfyZ=diff(fy,Z);
%baraye tarfi
Al11=[dfxw,dfxf,dfxk,dfxX0,dfxY0,dfxZ0;dfyw,dfyf,dfyk,dfyX0,dfyY0,dfyZ0];
Ar11=[dfxw,dfxf,dfxk,dfxX0,dfxY0,dfxZ0;dfyw,dfyf,dfyk,dfyX0,dfyY0,dfyZ0];
%baraye taghato
Af=[dfxX,dfxY,dfxZ;dfyX,dfyY,dfyZ];

% taghato
load contorol10_11
load ij
[l,r]=cpselect(im_l,im_r,l,r,'Wait',true);
l=ceil(l);
r=ceil(r);

if size(l,1)>(size(t_g,1)-num)
    warndlg('Only choose Check point','Warning')
else

xyl3=xyl((l(:,1)-1).*max(t(:,2))+l(:,2),:);   %payda kardan mokhtasate palayesh shodeye noghate gerefte shode roye tasvir
xyr3=xyr((r(:,1)-1).*max(t(:,2))+r(:,2),:);

for i=1:size(xyl3,1)
   xytf(4*i-3,1)=xyl3(i,1);
   xytf(4*i-2,1)=xyl3(i,2);
   xytf(4*i-1,1)=xyr3(i,1);
   xytf(4*i,1)=xyr3(i,2); 
end


%chap
taghl=[];
for  i=1:size(xyl3)
    taghl=[taghl;xyl3(i,1) xyl3(i,2) 1 0;xyl3(i,2) -xyl3(i,1) 0 1];
end
fl=taghl*zl;
fl=vec2mat(fl,2);

%rast
taghr=[];
for  i=1:size(xyr3)
    taghr=[taghr;xyr3(i,1) xyr3(i,2) 1 0;xyr3(i,2) -xyr3(i,1) 0 1];
end
fr=taghr*zr;
fr=vec2mat(fr,2);

ff=(fr+fl)/2;
ff(:,3)=hm;


dfz=1;

while max(abs(dfz))>10^-10
FF=[];
for i=1:size(xyl3,1)
   Aff(4*i-3:4*i-2,3*i-2:3*i)=eval(subs(Af,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1l(1),x1l(2),x1l(3),x1l(4),x1l(5),x1l(6),ff(i,1),ff(i,2),ff(i,3)})); 
   Aff(4*i-1:4*i,3*i-2:3*i)=eval(subs(Af,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1r(1),x1r(2),x1r(3),x1r(4),x1r(5),x1r(6),ff(i,1),ff(i,2),ff(i,3)})); 
   
   Af2=eval(subs(F,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1l(1),x1l(2),x1l(3),x1l(4),x1l(5),x1l(6),ff(i,1),ff(i,2),ff(i,3)})); 
   Af22=eval(subs(F,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1r(1),x1r(2),x1r(3),x1r(4),x1r(5),x1r(6),ff(i,1),ff(i,2),ff(i,3)})); 
   FF=[FF;Af2;Af22];
end

dyf=xytf-FF;
dfz=(Aff'*Aff)^-1*Aff'*dyf;  %majholate taghato
dfz=vec2mat(dfz,3);
ff=ff+dfz;




end



rmse=(ff-t_g(num+1:num+size(l,1),2:4)).^2;
rmse=sum(sum(rmse));
rmse=sqrt(rmse)/size(ff,1);
end


% --- Executes on button press in p4.
function p4_Callback(hObject, eventdata, handles)
% hObject    handle to p4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ff zl zr x1l x1r rmse
handles = guidata(hObject);

n6=ff;
n61=zl;
n62=zr;
n63=x1l;
n64=x1r;
n65=rmse;


fhandles = guidata(final);


fhandles.n6 = n6;
fhandles.n61 = n61;
fhandles.n62 = n62;
fhandles.n63 = n63;
fhandles.n64 = n64;
fhandles.n65 = n65;


guidata(final,fhandles)
set(fhandles.ra,'enable','off')
set(fhandles.pro,'enable','off')
set(fhandles.str,'enable','on')
set(fhandles.ett,'enable','on')
set(fhandles.p4,'enable','on')
set(fhandles.c4,'visible','on')
set(fhandles.s10,'visible','on')
set(fhandles.s11,'visible','on')
set(fhandles.s11,'string','Intersection & Resection')
close(TT)

% --- Executes on button press in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zl zr im_l im_r xyl xyr hm c x1l x1r ff

syms w f k x y X0 Y0 Z0 X Y Z
M1=[1 0 0;0 cos(w) -sin(w);0 sin(w) cos(w)];
M2=[cos(f) 0 sin(f);0 1 0;-sin(f) 0 cos(f)];
M3=[cos(k) -sin(k) 0;sin(k) cos(k) 0;0 0 1];
M=M3*M2*M1;         %matrise davaran

X1=[X-X0;Y-Y0;Z-Z0];
MX=M*X1;

m=-c/MX(3,1);
fx=m*MX(1,1);  %moadelat sharte ham khati
fy=m*MX(2,1);
F=[fx;fy];

dfxw=diff(fx,w);dfxf=diff(fx,f);dfxk=diff(fx,k);dfxX0=diff(fx,X0);dfxY0=diff(fx,Y0);dfxZ0=diff(fx,Z0);
dfyw=diff(fy,w);dfyf=diff(fy,f);dfyk=diff(fy,k);dfyX0=diff(fy,X0);dfyY0=diff(fy,Y0);dfyZ0=diff(fy,Z0);
dfxX=diff(fx,X);dfxY=diff(fx,Y);dfxZ=diff(fx,Z);
dfyX=diff(fy,X);dfyY=diff(fy,Y);dfyZ=diff(fy,Z);
%baraye tarfi
Al11=[dfxw,dfxf,dfxk,dfxX0,dfxY0,dfxZ0;dfyw,dfyf,dfyk,dfyX0,dfyY0,dfyZ0];
Ar11=[dfxw,dfxf,dfxk,dfxX0,dfxY0,dfxZ0;dfyw,dfyf,dfyk,dfyX0,dfyY0,dfyZ0];
%baraye taghato
Af=[dfxX,dfxY,dfxZ;dfyX,dfyY,dfyZ];

% taghato
load contorol10_11
load ij
[l,r]=cpselect(im_l,im_r,l,r,'Wait',true);
l=ceil(l);
r=ceil(r);


xyl3=xyl((l(:,1)-1).*max(t(:,2))+l(:,2),:);   %payda kardan mokhtasate palayesh shodeye noghate gerefte shode roye tasvir
xyr3=xyr((r(:,1)-1).*max(t(:,2))+r(:,2),:);

for i=1:size(xyl3,1)
   xytf(4*i-3,1)=xyl3(i,1);
   xytf(4*i-2,1)=xyl3(i,2);
   xytf(4*i-1,1)=xyr3(i,1);
   xytf(4*i,1)=xyr3(i,2); 
end


%chap
taghl=[];
for  i=1:size(xyl3)
    taghl=[taghl;xyl3(i,1) xyl3(i,2) 1 0;xyl3(i,2) -xyl3(i,1) 0 1];
end
fl=taghl*zl;
fl=vec2mat(fl,2);

%rast
taghr=[];
for  i=1:size(xyr3)
    taghr=[taghr;xyr3(i,1) xyr3(i,2) 1 0;xyr3(i,2) -xyr3(i,1) 0 1];
end
fr=taghr*zr;
fr=vec2mat(fr,2);

ff=(fr+fl)/2;
ff(:,3)=hm;


dfz=1;

while max(abs(dfz))>10^-10
FF=[];
for i=1:size(xyl3,1)
   Aff(4*i-3:4*i-2,3*i-2:3*i)=eval(subs(Af,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1l(1),x1l(2),x1l(3),x1l(4),x1l(5),x1l(6),ff(i,1),ff(i,2),ff(i,3)})); 
   Aff(4*i-1:4*i,3*i-2:3*i)=eval(subs(Af,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1r(1),x1r(2),x1r(3),x1r(4),x1r(5),x1r(6),ff(i,1),ff(i,2),ff(i,3)})); 
   
   Af2=eval(subs(F,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1l(1),x1l(2),x1l(3),x1l(4),x1l(5),x1l(6),ff(i,1),ff(i,2),ff(i,3)})); 
   Af22=eval(subs(F,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1r(1),x1r(2),x1r(3),x1r(4),x1r(5),x1r(6),ff(i,1),ff(i,2),ff(i,3)})); 
   FF=[FF;Af2;Af22];
end

dyf=xytf-FF;
dfz=(Aff'*Aff)^-1*Aff'*dyf;  %majholate taghato
dfz=vec2mat(dfz,3);
ff=ff+dfz;


end
set(handles.p3,'enable','on')
set(handles.p4,'enable','on')
set(handles.p2,'enable','inactive');