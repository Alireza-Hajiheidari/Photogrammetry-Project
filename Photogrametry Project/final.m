function varargout = final(varargin)
% FINAL MATLAB code for final.fig
%      FINAL, by itself, creates a new FINAL or raises the existing
%      singleton*.
%
%      H = FINAL returns the handle to a new FINAL or the handle to
%      the existing singleton*.
%
%      FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL.M with the given input arguments.
% 
%      FINAL('Property','Value',...) creates a new FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final

% Last Modified by GUIDE v2.5 19-Jan-2018 20:15:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
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


% --- Executes just before final is made visible.
function final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final (see VARARGIN)

% Choose default command line output for final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function pro_Callback(hObject, eventdata, handles)
% hObject    handle to pro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_l im_r f x0 y0 H R t_f t_r t_g hm
format long g
im_l=handles.n1;
im_r=handles.n12;
f=handles.n2(1);
x0=handles.n2(2);
y0=handles.n2(3);
H=handles.n2(4);
R=handles.n2(6);
hm=handles.n2(5);
t_f=handles.n21;
t_r=handles.n22';
t_g=handles.n23;

% --------------------------------------------------------------------
function str_Callback(hObject, eventdata, handles)
% hObject    handle to str (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function exp_Callback(hObject, eventdata, handles)
% hObject    handle to exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Help.pdf')
% --------------------------------------------------------------------
function gen_Callback(hObject, eventdata, handles)
% hObject    handle to gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function phy_Callback(hObject, eventdata, handles)
% hObject    handle to phy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function new_Callback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

guidata(final);

handles.n1 = [];
handles.n11=[];
handles.n12=[];
n1 = handles.n1;
n11=handles.n11;
n12=handles.n12;

shandles = guidata(new);

shandles.n12 = n12;
shandles.n11 = n11;
shandles.n1 = n1;
guidata(new,shandles)


% --------------------------------------------------------------------
function pra_Callback(hObject, eventdata, handles)
% hObject    handle to pra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


handles.n2 = [];
handles.n21=[];
handles.n22=[];
handles.n23=[];
n2 = handles.n2;
n21 = handles.n21;
n22=handles.n22;
n23=handles.n23;
shandles = guidata(prameters);

shandles.n23 = n23;
shandles.n22 = n22;
shandles.n21 = n21;
shandles.n2 = n2;
guidata(prameters,shandles)

% --------------------------------------------------------------------
function ext_Callback(hObject, eventdata, handles)
% hObject    handle to ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exit

% --------------------------------------------------------------------
function io_Callback(hObject, eventdata, handles)
% hObject    handle to io (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.n4 = [];
n4 = handles.n4;
handles.n41 = [];
n41 = handles.n41;
handles.n42 = [];
n42 = handles.n42;
handles.n43 = [];
n43 = handles.n43;
handles.n44 = [];
n44 = handles.n44;
handles.n45 = [];
n45 = handles.n45;
handles.n46 = [];
n46 = handles.n46;
handles.n47 = [];
n47 = handles.n47;
handles.n48 = [];
n48 = handles.n48;

shandles = guidata(IO);

shandles.n4 = n4;
shandles.n41 = n41;
shandles.n42 = n42;
shandles.n43 = n43;
shandles.n44 = n44;
shandles.n45 = n45;
shandles.n46 = n46;
shandles.n47 = n47;
shandles.n48 = n48;

guidata(IO,shandles)

% --------------------------------------------------------------------
function re_Callback(hObject, eventdata, handles)
% hObject    handle to re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ml mr
ml=handles.n42;  %mokhtasat akse chap pas az IO
mr=handles.n43;  %mokhtasat akse rast pas az IO

handles.n5 = [];
n5 = handles.n5;
handles.n51 = [];
n51 = handles.n51;
handles.n52 = [];
n52 = handles.n52;
handles.n53 = [];
n53 = handles.n53;
handles.n54 = [];
n54 = handles.n54;
handles.n55 = [];
n55= handles.n55;
handles.n57 = [];
n57 = handles.n57;
handles.n56 = [];
n56 = handles.n56;


shandles = guidata(Refining);

shandles.n5 = n5;
shandles.n51 = n51;
shandles.n52 = n52;
shandles.n53 = n53;
shandles.n54 = n54;
shandles.n55 = n55;
shandles.n56 = n56;
shandles.n57 = n57;

guidata(Refining,shandles)

% --------------------------------------------------------------------
function eo_Callback(hObject, eventdata, handles)
% hObject    handle to eo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mpl mpr
mpl=handles.n56;
mpr=handles.n57;
% --------------------------------------------------------------------
function dlt_Callback(hObject, eventdata, handles)
% hObject    handle to dlt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global strstr
strstr=1;
handles.n3 = [];
n3 = handles.n3;
handles.n31 = [];
n31 = handles.n31;
handles.n32 = [];
n32 = handles.n32;

shandles = guidata(DLT);

shandles.n3 = n3;
shandles.n31 = n31;
shandles.n32 = n32;
guidata(DLT,shandles)
% --------------------------------------------------------------------
function tt_Callback(hObject, eventdata, handles)
% hObject    handle to tt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global strstr
strstr=2;
handles.n6 = [];
n6= handles.n6;
handles.n61 = [];
n61= handles.n61;
handles.n62 = [];
n62= handles.n62;
handles.n63 = [];
n63= handles.n63;
handles.n64 = [];
n64= handles.n64;
handles.n65 = [];
n65= handles.n65;

shandles = guidata(TT);

shandles.n6 = n6;
shandles.n61 = n61;
shandles.n62= n62;
shandles.n63 = n63;
shandles.n64 = n64;
shandles.n65 = n65;
guidata(TT,shandles)

% --------------------------------------------------------------------
function ra_Callback(hObject, eventdata, handles)
% hObject    handle to ra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function rel_Callback(hObject, eventdata, handles)
% hObject    handle to rel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.n7 = [];
n7= handles.n7;
handles.n71 = [];
n71= handles.n71;
handles.n72 = [];
n72= handles.n72;

shandles = guidata(rel);

shandles.n7 = n7;
shandles.n71 = n71;
shandles.n72 = n72;
guidata(rel,shandles)

% --------------------------------------------------------------------
function ab_Callback(hObject, eventdata, handles)
% hObject    handle to ab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xyzm number z  strstr
strstr=3;
xyzm=handles.n7;
number=handles.n71;
z=handles.n72;
handles.n8 = [];
n8= handles.n8;
handles.n81 = [];
n81= handles.n81;
handles.n82 = [];
n82= handles.n82;

shandles = guidata(ab);

shandles.n8 = n8;
shandles.n81 = n81;
shandles.n82 = n82;
guidata(ab,shandles)


% --------------------------------------------------------------------
function vi_Callback(hObject, eventdata, handles)
% hObject    handle to vi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.n9 = [];
n9= handles.n9;
handles.n91 = [];
n91= handles.n91;


shandles = guidata(vi);

shandles.n9 = n9;
shandles.n91 = n91;


guidata(vi,shandles)


% --------------------------------------------------------------------
function ed_Callback(hObject, eventdata, handles)
% hObject    handle to ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ei_Callback(hObject, eventdata, handles)
% hObject    handle to ei (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function er_Callback(hObject, eventdata, handles)
% hObject    handle to er (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ett_Callback(hObject, eventdata, handles)
% hObject    handle to ett (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ero_Callback(hObject, eventdata, handles)
% hObject    handle to ero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ea_Callback(hObject, eventdata, handles)
% hObject    handle to ea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function es_Callback(hObject, eventdata, handles)
% hObject    handle to es (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function edp_Callback(hObject, eventdata, handles)
% hObject    handle to edp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for parameters');
f=strcat(ff,f);
p=handles.n31;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function edo_Callback(hObject, eventdata, handles)
% hObject    handle to edo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for Coords');
f=strcat(ff,f);
p=handles.n3;
save (f,'p', '-ascii')
msgbox('DONE')
% --------------------------------------------------------------------
function edr_Callback(hObject, eventdata, handles)
% hObject    handle to edr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for RMSE');
f=strcat(ff,f);
p=handles.n32;
save (f,'p', '-ascii')
msgbox('DONE')


% --------------------------------------------------------------------
function eilp_Callback(hObject, eventdata, handles)
% hObject    handle to eilp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for left prameters');
f=strcat(ff,f);
p=handles.n4;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function eirp_Callback(hObject, eventdata, handles)
% hObject    handle to eirp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for right prameters');
f=strcat(ff,f);
p=handles.n41;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function eilc_Callback(hObject, eventdata, handles)
% hObject    handle to eilc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for left ccords');
f=strcat(ff,f);
p=handles.n42;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function eirc_Callback(hObject, eventdata, handles)
% hObject    handle to eirc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for left ccords');
f=strcat(ff,f);
p=handles.n43;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function eirlco_Callback(hObject, eventdata, handles)
% hObject    handle to eirlco (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for RMSE for left contorol points');
f=strcat(ff,f);
p=handles.n45;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function eirrco_Callback(hObject, eventdata, handles)
% hObject    handle to eirrco (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for RMSE for right contorol points');
f=strcat(ff,f);
p=handles.n46;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function eirlch_Callback(hObject, eventdata, handles)
% hObject    handle to eirlch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for RMSE for left check points');
f=strcat(ff,f);
p=handles.n47;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function eirrch_Callback(hObject, eventdata, handles)
% hObject    handle to eirrch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for RMSE for right check points');
f=strcat(ff,f);
p=handles.n48;
save (f,'p', '-ascii')
msgbox('DONE')


% --------------------------------------------------------------------
function erl_Callback(hObject, eventdata, handles)
% hObject    handle to erl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function err_Callback(hObject, eventdata, handles)
% hObject    handle to err (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function errp_Callback(hObject, eventdata, handles)
% hObject    handle to errp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for PP Refining coord of right image');
f=strcat(ff,f);
p=handles.n51;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function errr_Callback(hObject, eventdata, handles)
% hObject    handle to errr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for PP & radial distortion Refining coord of right image');
f=strcat(ff,f);
p=handles.n53;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function errre_Callback(hObject, eventdata, handles)
% hObject    handle to errre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for PP-rd & refraction Refining coord of right image');
f=strcat(ff,f);
p=handles.n55;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function erre_Callback(hObject, eventdata, handles)
% hObject    handle to erre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for PP-rd-ref & earth curvature Refining coord of right image');
f=strcat(ff,f);
p=handles.n57;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function erlp_Callback(hObject, eventdata, handles)
% hObject    handle to erlp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for PP Refining coord of left image');
f=strcat(ff,f);
p=handles.n5;
save (f,'p', '-ascii')
msgbox('DONE')


% --------------------------------------------------------------------
function erlr_Callback(hObject, eventdata, handles)
% hObject    handle to erlr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for PP & radial distortion Refining coord of left image');
f=strcat(ff,f);
p=handles.n52;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function erlre_Callback(hObject, eventdata, handles)
% hObject    handle to erlre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for PP-rd & refraction Refining coord of left image');
f=strcat(ff,f);
p=handles.n54;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function erle_Callback(hObject, eventdata, handles)
% hObject    handle to erle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for PP-rd-ref & earth curvature Refining coord of left image');
f=strcat(ff,f);
p=handles.n56;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function ettl_Callback(hObject, eventdata, handles)
% hObject    handle to ettl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ettr_Callback(hObject, eventdata, handles)
% hObject    handle to ettr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ettc_Callback(hObject, eventdata, handles)
% hObject    handle to ettc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for  coord of points');
f=strcat(ff,f);
p=handles.n6;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function ettrm_Callback(hObject, eventdata, handles)
% hObject    handle to ettrm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for RMSE');
f=strcat(ff,f);
p=handles.n65;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function ettrc_Callback(hObject, eventdata, handles)
% hObject    handle to ettrc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for conformal parameters of right image');
f=strcat(ff,f);
p=handles.n62;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function ettre_Callback(hObject, eventdata, handles)
% hObject    handle to ettre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for EO parameters of right image');
f=strcat(ff,f);
p=handles.n64;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function ettlc_Callback(hObject, eventdata, handles)
% hObject    handle to ettlc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for conformal parameters of left image');
f=strcat(ff,f);
p=handles.n61;
save (f,'p', '-ascii')
msgbox('DONE')

% --------------------------------------------------------------------
function ettle_Callback(hObject, eventdata, handles)
% hObject    handle to ettle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for EO parameters of left image');
f=strcat(ff,f);
p=handles.n63;
save (f,'p', '-ascii')
msgbox('DONE')


% --------------------------------------------------------------------
function erom_Callback(hObject, eventdata, handles)
% hObject    handle to erom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for model coords');
f=strcat(ff,f);
p=handles.n7;
save (f,'p', '-ascii')
msgbox('DONE')


% --------------------------------------------------------------------
function eror_Callback(hObject, eventdata, handles)
% hObject    handle to eror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for relative prameters');
f=strcat(ff,f);
p=handles.n72;
save (f,'p', '-ascii')
msgbox('DONE')


% --------------------------------------------------------------------
function eaf_Callback(hObject, eventdata, handles)
% hObject    handle to eaf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for Object coords');
f=strcat(ff,f);
p=handles.n8;
save (f,'p', '-ascii')
msgbox('DONE')


% --------------------------------------------------------------------
function eaa_Callback(hObject, eventdata, handles)
% hObject    handle to eaa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for Affine prameters');
f=strcat(ff,f);
p=handles.n81;
save (f,'p', '-ascii')
msgbox('DONE')


% --------------------------------------------------------------------
function ear_Callback(hObject, eventdata, handles)
% hObject    handle to ear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,ff]=uiputfile('.txt','Enter path for RMSE');
f=strcat(ff,f);
p=handles.n82;
save (f,'p', '-ascii')
msgbox('DONE')


% --------------------------------------------------------------------
function stre_Callback(hObject, eventdata, handles)
% hObject    handle to stre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global strstr t_g f H mpl mpr hm


lc=handles.n9;
lc(find(lc(:,1)==0&lc(:,2)==0),:)=[];
rc=handles.n91;
rc(find(rc(:,1)==0&rc(:,2)==0),:)=[];


%dlt
if strstr==1
 xx=handles.n31;   
    
    xll=lc(:,1);
    yll=lc(:,2);
    xrr=rc(:,1);
    yrr=rc(:,2);
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
while norm((dx))>10^-6
    
%matrise A
AA=zeros(4,3);
%baraye moshahedate samte chap
   AA(1,1)=(subs(jx1,{X1 Y1 Z1},{Xcc Ycc hm1}));
   AA(1,2)=subs(jx2,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(1,3)=subs(jx3,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(2,1)=subs(jy1,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(2,2)=subs(jy2,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(2,3)=subs(jy3,{X1 Y1 Z1},{Xcc Ycc hm1});
   
   yc0(1,1)=eval(subs(x1,{X1 Y1 Z1},{Xcc Ycc hm1}));
   yc0(2,1)=eval(subs(y1,{X1 Y1 Z1},{Xcc Ycc hm1}));
%baraye moshahedate samte rast
% s=1;
   AA(3,1)=subs(jx11,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(3,2)=subs(jx22,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(3,3)=subs(jx33,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(4,1)=subs(jy11,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(4,2)=subs(jy22,{X1 Y1 Z1},{Xcc Ycc hm1});
   AA(4,3)=subs(jy33,{X1 Y1 Z1},{Xcc Ycc hm1});
   
    yc0(3,1)=eval(subs(x2,{X1 Y1 Z1},{Xcc Ycc hm1}));
   yc0(4,1)=eval(subs(y2,{X1 Y1 Z1},{Xcc Ycc hm1}));
   

dy=ll3-yc0;
dx=((AA'*AA)^-1*AA'*dy);
xxx=xxx+dx;
Xcc=xxx(1);Ycc=xxx(2);hm1=xxx(3);
end
Xfcc=[Xfcc;Xcc];
Yfcc=[Yfcc;Ycc];
hfm=[hfm;hm1];
end
cord=[Xfcc,Yfcc,hfm,lc(:,3)];


% taghato va tarfi
elseif strstr==2
    
   c=f;
   clear f
   xyl=mpl;
xyr=mpr;
zl=handles.n61;
zr=handles.n62;
x1l=handles.n63;
x1r=handles.n64;

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
load ij


xyl3=xyl((lc(:,1)-1).*max(t(:,2))+lc(:,2),:);   %payda kardan mokhtasate palayesh shodeye noghate gerefte shode roye tasvir
xyr3=xyr((rc(:,1)-1).*max(t(:,2))+rc(:,2),:);

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

finall=(fr+fl)/2;
finall(:,3)=hm;


dfz=1;

while norm(dfz)>10^-6
FF=[];
for i=1:size(xyl3,1)
   Aff(4*i-3:4*i-2,3*i-2:3*i)=eval(subs(Af,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1l(1),x1l(2),x1l(3),x1l(4),x1l(5),x1l(6),finall(i,1),finall(i,2),finall(i,3)})); 
   Aff(4*i-1:4*i,3*i-2:3*i)=eval(subs(Af,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1r(1),x1r(2),x1r(3),x1r(4),x1r(5),x1r(6),finall(i,1),finall(i,2),finall(i,3)})); 
   
   Af2=eval(subs(F,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1l(1),x1l(2),x1l(3),x1l(4),x1l(5),x1l(6),finall(i,1),finall(i,2),finall(i,3)})); 
   Af22=eval(subs(F,{w,f,k,X0,Y0,Z0,X,Y,Z},{x1r(1),x1r(2),x1r(3),x1r(4),x1r(5),x1r(6),finall(i,1),finall(i,2),finall(i,3)})); 
   FF=[FF;Af2;Af22];
end

dyf=xytf-FF;
dfz=(Aff'*Aff)^-1*Aff'*dyf;  %majholate taghato
dfz=vec2mat(dfz,3);
finall=finall+dfz;
cord=[finall lc(:,3)];

end
    
else
  %% RO & AO    
  xyzm=handles.n7;
z=handles.n72;
    
    c=f;
load ij
xyl=mpl;
xyr=mpr;

% marhaleye1

 

xyl2=xyl((lc(:,1)-1).*max(t(:,2))+lc(:,2),:);   %payda kardan mokhtasate palayesh shodeye noghate gerefte shode roye tasvir
xyr2=xyr((rc(:,1)-1).*max(t(:,2))+rc(:,2),:);

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
for i=1:size(lc,1)    
      AAt=[AAt;xtn(i,1) xtn(i,2) xtn(i,3) 0 0 0 0 0 0 1 0 0;0 0 0 xtn(i,1) xtn(i,2) xtn(i,3) 0 0 0 0 1 0;0 0 0 0 0 0 xtn(i,1) xtn(i,2) xtn(i,3) 0 0 1]; 
end

xtm=AAt*ZA;
xtm=vec2mat(xtm,3);
cord=[xtm lc(:,3)];
    
end

[f,ff]=uiputfile('.txt','Enter path for Drawing coords');
f=strcat(ff,f);
p=cord;
save (f,'p', '-ascii')
msgbox('DONE')