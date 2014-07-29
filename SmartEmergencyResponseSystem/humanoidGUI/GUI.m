function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 23-Apr-2014 10:59:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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
end
% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clc
imshow('wrecs.png','Parent',handles.wrecs);
homePositionBtn_Callback(hObject, eventdata, handles);
end
% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end
%Slider Controls***********************************************************
%Back Joints---------------------------------------------------------------
function bkz_Callback(hObject, eventdata, handles) 
guidata(hObject, handles);
end
function bkz_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0.663225);
set(hObject, 'Max', 0.663225);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function bky_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function bky_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0.610691);%TODO check new value
set(hObject, 'Max', 0.438427); %TODO check new value
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function bkx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function bkx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0.698132);
set(hObject, 'Max', 0.698132);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
%Right Arm-----------------------------------------------------------------
function r_shy_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_shy_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1.5708);
set(hObject, 'Max', 0.785395);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_shx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_shx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1.5708);
set(hObject, 'Max', 1.5708);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_ely_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_ely_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', 0);
set(hObject, 'Max', 3.14159);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_elx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_elx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -2.35619);
set(hObject, 'Max', 0);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_wry_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_wry_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0);
set(hObject, 'Max', 3.14159);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_wrx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_wrx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1.1781);
set(hObject, 'Max', 1.1781);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
%Left Arm------------------------------------------------------------------
function l_shy_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_shy_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1.5708);
set(hObject, 'Max', 0.785398);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_shx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_shx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1.5708);
set(hObject, 'Max', 1.5708);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_ely_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_ely_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0);
set(hObject, 'Max', 3.14159);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_elx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_elx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0);
set(hObject, 'Max', 2.35619);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_wry_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_wry_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0);
set(hObject, 'Max', 3.14159);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_wrx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_wrx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1.1781);
set(hObject, 'Max', 1.1781);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
%Right Leg-----------------------------------------------------------------
function r_hpz_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_hpz_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1.22173);
set(hObject, 'Max', 0.174533);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_hpx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_hpx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0.523599);
set(hObject, 'Max', 0.523599);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_hpy_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_hpy_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1.72072);
set(hObject, 'Max', 0.524821);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_kny_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_kny_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', 0);
set(hObject, 'Max', 2.38569);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_aky_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_aky_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1);
set(hObject, 'Max', 0.7);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function r_akx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function r_akx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0.8);
set(hObject, 'Max', 0.8);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
%Left Leg------------------------------------------------------------------
function l_hpz_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_hpz_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0.174533);
set(hObject, 'Max', 1.22173);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_hpx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_hpx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0.523599);
set(hObject, 'Max', 0.523599);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_hpy_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_hpy_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1.72072);
set(hObject, 'Max', 0.524821);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_kny_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_kny_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', 0);
set(hObject, 'Max', 2.38569);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_aky_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_aky_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -1);
set(hObject, 'Max', 0.7);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
function l_akx_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function l_akx_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0.8);
set(hObject, 'Max', 0.8);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
%Neck----------------------------------------------------------------------
function ay_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function ay_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Min', -0.602139);
set(hObject, 'Max', 1.14494);
set(hObject, 'SliderStep', [0.1 1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end
%IK text box***************************************************************
%Right Arm-----------------------------------------------------------------
%Position------------------------------------------------------------------
function XpositionRA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function XpositionRA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function YpositionRA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function YpositionRA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function ZpositionRA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function ZpositionRA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
%Orientation---------------------------------------------------------------
function XorientationRA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function XorientationRA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function YorientationRA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function YorientationRA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function ZorientationRA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function ZorientationRA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
%Left Arm------------------------------------------------------------------
%Position------------------------------------------------------------------
function XpositionLA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function XpositionLA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function YpositionLA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function YpositionLA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function ZpositionLA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function ZpositionLA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
%Orientation---------------------------------------------------------------
function XorientationLA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function XorientationLA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function YorientationLA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function YorientationLA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function ZorientationLA_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
end
function ZorientationLA_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
%Feet In Contact Toggle****************************************************
function RLinContact_Callback(hObject, eventdata, handles)
global RLinContact
    if (get(hObject,'Value') == get(hObject,'Max'))
        RLinContact=1;
    else
        RLinContact=0;
    end
end
function LLinContact_Callback(hObject, eventdata, handles)
global LLinContact
    if (get(hObject,'Value') == get(hObject,'Max'))
        LLinContact=1;
    else
        LLinContact=0;
    end
end
%View Collision Bounding Boxes
function collisionCheckBox_Callback(hObject, eventdata, handles)
global viewCollisionBoxes
    if (get(hObject,'Value') == get(hObject,'Max'))
        viewCollisionBoxes=1;
    else
        viewCollisionBoxes=0;
    end
end
%**************************************************************************
%This is where the magic happens :-D
%
%**************************************************************************
function homePositionBtn_Callback(hObject, eventdata, handles)
clc
joint_angles = zeros(1,28);
global RAx RAy RAz RArx RAry RArz LAx LAy LAz LArx LAry LArz
global RLinContact LLinContact viewCollisionBoxes
RLinContact = 1;
LLinContact = 1;
viewCollisionBoxes = 0;
set(handles.RLinContact,'Value',1);
set(handles.LLinContact,'Value',1);
set(handles.collisionCheckBox,'Value',0);
%Set sliders to default****************************************************
%Back Joints---------------------------------------------------------------
set(handles.bkz,'Value',joint_angles(1));
set(handles.bky,'Value',joint_angles(2));
set(handles.bkx,'Value',joint_angles(3));
%Left Arm Joints-----------------------------------------------------------
set(handles.l_shy,'Value',joint_angles(4));
set(handles.l_shx,'Value',joint_angles(5));
set(handles.l_ely,'Value',joint_angles(6));
set(handles.l_elx,'Value',joint_angles(7));
set(handles.l_wry,'Value',joint_angles(8));
set(handles.l_wrx,'Value',joint_angles(9));
%Right Arm Joints----------------------------------------------------------
set(handles.r_shy,'Value',joint_angles(10));
set(handles.r_shx,'Value',joint_angles(11));
set(handles.r_ely,'Value',joint_angles(12));
set(handles.r_elx,'Value',joint_angles(13));
set(handles.r_wry,'Value',joint_angles(14));
set(handles.r_wrx,'Value',joint_angles(15));
%Left Leg Joints-----------------------------------------------------------
set(handles.l_hpz,'Value',joint_angles(16));
set(handles.l_hpx,'Value',joint_angles(17));
set(handles.l_hpy,'Value',joint_angles(18));
set(handles.l_kny,'Value',joint_angles(19));
set(handles.l_aky,'Value',joint_angles(20));
set(handles.l_akx,'Value',joint_angles(21));
%Right Leg Joints----------------------------------------------------------
set(handles.r_hpz,'Value',joint_angles(22));
set(handles.r_hpx,'Value',joint_angles(23));
set(handles.r_hpy,'Value',joint_angles(24));
set(handles.r_kny,'Value',joint_angles(25));
set(handles.r_aky,'Value',joint_angles(26));
set(handles.r_akx,'Value',joint_angles(27));
%Head Joint----------------------------------------------------------------
set(handles.ay,'Value',joint_angles(28))
%Calculate Forward Kinematics**********************************************
%Back Joints
backOrigin = transform(0,0,0,0,0,0);
[BP0,BT01,BT02,BT03]=atlasBackFK(backOrigin,joint_angles(1:3));
%Left Arm Joints
leftArmOff = [0,-0.5,0.866,303.27;0,-0.866,-0.5,-279.01;1,0,0,64.41;0,0,0,1];
leftArmOrigin = BT03*leftArmOff;
[LATG0,LAT01,LAT02,LAT03,LAT04,LAT05,LAT06]=atlasArmFK(leftArmOrigin ,joint_angles(4:9),'left');
%Right Arm Joints
rightArmOff = [0,-0.5,0.866,303.27;0,0.866,0.5,279.01;-1,0,0,64.41;0,0,0,1];
rightArmOrigin = BT03*rightArmOff;
[RATG0,RAT01,RAT02,RAT03,RAT04,RAT05,RAT06]=atlasArmFK(rightArmOrigin ,joint_angles(10:15),'right');
%Left Leg Joint
leftLegOrigin = BP0*transform(0,89,0,0,0,0);
[LLTG0,LLT01,LLT02,LLT03,LLT04,LLT05,LLT06]=atlasLegFK(leftLegOrigin ,joint_angles(16:21),'left');
%Right Leg Joint
rightLegOrigin = BP0*transform(0,-89,0,0,0,0);
[RLTG0,RLT01,RLT02,RLT03,RLT04,RLT05,RLT06]=atlasLegFK(rightLegOrigin ,joint_angles(22:27),'right');
%Head Joint
headOff = [1,0,0,537.96;0,0,-1,0;0,1,0,216.72;0,0,0,1];
headOrigin = BT03*headOff;
[HTG0,HT01] = atlasHeadFK(headOrigin,joint_angles(28));
%Set Transforms
Transformations(:,:,1) = BP0;
Transformations(:,:,2) = BT01;
Transformations(:,:,3) = BT02;
Transformations(:,:,4) = BT03;
Transformations(:,:,5) = LATG0;
Transformations(:,:,6) = LAT01;
Transformations(:,:,7) = LAT02;
Transformations(:,:,8) = LAT03;
Transformations(:,:,9) = LAT04;
Transformations(:,:,10) =LAT05;
Transformations(:,:,11) =LAT06;
Transformations(:,:,12) =RATG0;
Transformations(:,:,13) =RAT01;
Transformations(:,:,14) =RAT02;
Transformations(:,:,15) =RAT03;
Transformations(:,:,16) =RAT04;
Transformations(:,:,17) =RAT05;
Transformations(:,:,18) =RAT06;
Transformations(:,:,19) =LLTG0;
Transformations(:,:,20) =LLT01;
Transformations(:,:,21) =LLT02;
Transformations(:,:,22) =LLT03;
Transformations(:,:,23) =LLT04;
Transformations(:,:,24) =LLT05;
Transformations(:,:,25) =LLT06;
Transformations(:,:,26) =RLTG0;
Transformations(:,:,27) =RLT01;
Transformations(:,:,28) =RLT02;
Transformations(:,:,29) =RLT03;
Transformations(:,:,30) =RLT04;
Transformations(:,:,31) =RLT05;
Transformations(:,:,32) =RLT06;
Transformations(:,:,33) = HTG0;
Transformations(:,:,34) = HT01;
%Set IK text boxes to defalt-----------------------------------------------
%Right Arm
RAx = RAT06(1,4);
RAy = RAT06(2,4);
RAz = RAT06(3,4);
set(handles.XpositionRA,'String',num2str(RAx,'%2.2f'));
set(handles.YpositionRA,'String',num2str(RAy,'%2.2f'));
set(handles.ZpositionRA,'String',num2str(RAz,'%2.2f'));
[RArx,RAry,RArz] = dcm2angle(RAT06(1:3,1:3),'xyz');
set(handles.XorientationRA,'String',num2str(RArx,'%2.2f'));
set(handles.YorientationRA,'String',num2str(RAry,'%2.2f'));
set(handles.ZorientationRA,'String',num2str(RArz,'%2.2f'));
%Left Arm
LAx = LAT06(1,4);
LAy = LAT06(2,4);
LAz = LAT06(3,4);
set(handles.XpositionLA,'String',num2str(LAx,'%2.2f'));
set(handles.YpositionLA,'String',num2str(LAy,'%2.2f'));
set(handles.ZpositionLA,'String',num2str(LAz,'%2.2f'));
[LArx,LAry,LArz] = dcm2angle(LAT06(1:3,1:3),'xyz');
set(handles.XorientationLA,'String',num2str(LArx,'%2.2f'));
set(handles.YorientationLA,'String',num2str(LAry,'%2.2f'));
set(handles.ZorientationLA,'String',num2str(LArz,'%2.2f'));
%Calculate link parameters*************************************************
[atlasXCOM,atlasYCOM]=atlasLinkParams(joint_angles,Transformations);
cla(handles.main)
axes(handles.main);
rotate3d on;
%Patch*********************************************************************
Bcolor = ['b','g','c'];
LAcolor = ['r','m','y','b','g','c'];
RAcolor = ['r','m','y','b','g','c'];
LLcolor = ['r','m','y','b','g','c'];
RLcolor = ['r','m','y','b','g','c'];
Hcolor = 'r';
view([120 25]);
patchAtlasBack(BP0,BT01,BT02,joint_angles(1:3),Bcolor);
patchAtlasArm(LATG0,LAT01,LAT02,LAT03,LAT04,LAT05,joint_angles(4:9),'left',LAcolor);
patchAtlasArm(RATG0,RAT01,RAT02,RAT03,RAT04,RAT05,joint_angles(10:15),'right',RAcolor);
patchAtlasLeg(LLTG0,LLT01,LLT02,LLT03,LLT04,LLT05,joint_angles(16:21),'left',LLcolor);
patchAtlasLeg(RLTG0,RLT01,RLT02,RLT03,RLT04,RLT05,joint_angles(22:27),'right',RLcolor);
patchAtlasHead(HTG0,joint_angles(28),Hcolor);
cla(handles.COM)
axes(handles.COM);
stable = plotCOM(LLT06,RLT06,atlasXCOM,atlasYCOM);
guidata(hObject, handles);
end
%**************************************************************************
function executeBtn_Callback(hObject, eventdata, handles)
global RAx RAy RAz RArx RAry RArz LAx LAy LAz LArx LAry LArz
global viewCollisionBoxes
clc
%Get desired joint angles from sliders*************************************
%Back Joints
joint_angles(1) = get(handles.bkz,'Value');
joint_angles(2) = get(handles.bky,'Value');
joint_angles(3) = get(handles.bkx,'Value');
%Left Arm Joints
joint_angles(4) = get(handles.l_shy,'Value');
joint_angles(5) = get(handles.l_shx,'Value');
joint_angles(6) = get(handles.l_ely,'Value');
joint_angles(7) = get(handles.l_elx,'Value');
joint_angles(8) = get(handles.l_wry,'Value');
joint_angles(9) = get(handles.l_wrx,'Value');
%Right Arm Joints
joint_angles(10) = get(handles.r_shy,'Value');
joint_angles(11) = get(handles.r_shx,'Value');
joint_angles(12) = get(handles.r_ely,'Value');
joint_angles(13) = get(handles.r_elx,'Value');
joint_angles(14) = get(handles.r_wry,'Value');
joint_angles(15) = get(handles.r_wrx,'Value');
%Left Leg Joints
joint_angles(16) = get(handles.l_hpz,'Value');
joint_angles(17) = get(handles.l_hpx,'Value');
joint_angles(18) = get(handles.l_hpy,'Value');
joint_angles(19) = get(handles.l_kny,'Value');
joint_angles(20) = get(handles.l_aky,'Value');
joint_angles(21) = get(handles.l_akx,'Value');
%Right Leg Joints
joint_angles(22) = get(handles.r_hpz,'Value');
joint_angles(23) = get(handles.r_hpx,'Value');
joint_angles(24) = get(handles.r_hpy,'Value');
joint_angles(25) = get(handles.r_kny,'Value');
joint_angles(26) = get(handles.r_aky,'Value');
joint_angles(27) = get(handles.r_akx,'Value');
%Head Joint
joint_angles(28) = get(handles.ay,'Value');
%Calculate Forward Kinematics**********************************************
%Back Joints
backOrigin = transform(0,0,0,0,0,0);
[BP0,BT01,BT02,BT03]=atlasBackFK(backOrigin,joint_angles(1:3));
%Left Arm Joints
leftArmOff = [0,-0.5,0.866,303.27;0,-0.866,-0.5,-279.01;1,0,0,64.41;0,0,0,1];
leftArmOrigin = BT03*leftArmOff;
%Right Arm Joints
rightArmOff = [0,-0.5,0.866,303.27;0,0.866,0.5,279.01;-1,0,0,64.41;0,0,0,1];
rightArmOrigin = BT03*rightArmOff;
%Left Leg Joint
leftLegOrigin = BP0*transform(0,89,0,0,0,0);
[LLTG0,LLT01,LLT02,LLT03,LLT04,LLT05,LLT06]=atlasLegFK(leftLegOrigin ,joint_angles(16:21),'left');
%Right Leg Joint
rightLegOrigin = BP0*transform(0,-89,0,0,0,0);
[RLTG0,RLT01,RLT02,RLT03,RLT04,RLT05,RLT06]=atlasLegFK(rightLegOrigin ,joint_angles(22:27),'right');
%Head Joint
headOff = [1,0,0,537.96;0,0,-1,0;0,1,0,216.72;0,0,0,1];
headOrigin = BT03*headOff;
[HTG0,HT01] = atlasHeadFK(headOrigin,joint_angles(28));
% %Check if any IK textboxes for the right arm were changed****************
% if (compare(RAx,str2double(get(handles.XpositionRA,'String')),2)&&...
%         compare(RAy,str2double(get(handles.YpositionRA,'String')),2)&&...
%         compare(RAz,str2double(get(handles.ZpositionRA,'String')),2)&&...
%         compare(RArx,str2double(get(handles.XorientationRA,'String')),2)&&...
%         compare(RAry,str2double(get(handles.YorientationRA,'String')),2)&&...
%         compare(RArz,str2double(get(handles.ZorientationRA,'String')),2))
%     display('Right arm textBox values are unchanged')
% else
%     %Calculate IK
%     display('Right arm textBox values have changed')
%     %Right Arm
%     RAx = str2double(get(handles.XpositionRA,'String'));
%     RAy = str2double(get(handles.YpositionRA,'String'));
%     RAz = str2double(get(handles.ZpositionRA,'String'));
%     RArx = str2double(get(handles.XorientationRA,'String'));
%     RAry = str2double(get(handles.YorientationRA,'String'));
%     RArz = str2double(get(handles.ZorientationRA,'String'));
%     %Calculate Inverse Kinematics******************************************
%     rightGoalPose= transform(RAx,RAy,RAz,RArx,RAry,RArz);
%     q_d(10:15) = atlasRightArmIK(rightGoalPose,rightArmOrigin);
%     joint_angles(10:15) = q_d(10:15);
% end
% %Check if any IK textboxes for the left arm were changed
% if(compare(LAx,str2double(get(handles.XpositionLA,'String')),2)&&...
%         compare(LAy,str2double(get(handles.YpositionLA,'String')),2)&&...
%         compare(LAz,str2double(get(handles.ZpositionLA,'String')),2)&&...
%         compare(LArx,str2double(get(handles.XorientationLA,'String')),2)&&...
%         compare(LAry,str2double(get(handles.YorientationLA,'String')),2)&&...
%         compare(LArz,str2double(get(handles.ZorientationLA,'String')),2))
%     display('Left arm textBox values are unchanged')
% else
%     %Calculate IK
%     display('Left arm textBox values have changed')
%     %Left Arm
%     LAx = str2double(get(handles.XpositionLA,'String'));
%     LAy = str2double(get(handles.YpositionLA,'String'));
%     LAz = str2double(get(handles.ZpositionLA,'String'));
%     LArx = str2double(get(handles.XorientationLA,'String'));
%     LAry = str2double(get(handles.YorientationLA,'String'));
%     LArz = str2double(get(handles.ZorientationLA,'String'));  
%     %Calculate Inverse Kinematics******************************************
%     leftGoalPose = transform(LAx,LAy,LAz,LArx,LAry,LArz)
%     q_d(4:9) = atlasLeftArmIK(leftGoalPose,leftArmOrigin);
%     joint_angles(4:9) = q_d(4:9);
% end
%Calculate Forward Kinematics of arms**************************************
[LATG0,LAT01,LAT02,LAT03,LAT04,LAT05,LAT06]=atlasArmFK(leftArmOrigin ,joint_angles(4:9),'left');
[RATG0,RAT01,RAT02,RAT03,RAT04,RAT05,RAT06]=atlasArmFK(rightArmOrigin ,joint_angles(10:15),'right');
Transformations(:,:,1) = BP0;
Transformations(:,:,2) = BT01;
Transformations(:,:,3) = BT02;
Transformations(:,:,4) = BT03;
Transformations(:,:,5) = LATG0;
Transformations(:,:,6) = LAT01;
Transformations(:,:,7) = LAT02;
Transformations(:,:,8) = LAT03;
Transformations(:,:,9) = LAT04;
Transformations(:,:,10) =LAT05;
Transformations(:,:,11) =LAT06;
Transformations(:,:,12) =RATG0;
Transformations(:,:,13) =RAT01;
Transformations(:,:,14) =RAT02;
Transformations(:,:,15) =RAT03;
Transformations(:,:,16) =RAT04;
Transformations(:,:,17) =RAT05;
Transformations(:,:,18) =RAT06;
Transformations(:,:,19) =LLTG0;
Transformations(:,:,20) =LLT01;
Transformations(:,:,21) =LLT02;
Transformations(:,:,22) =LLT03;
Transformations(:,:,23) =LLT04;
Transformations(:,:,24) =LLT05;
Transformations(:,:,25) =LLT06;
Transformations(:,:,26) =RLTG0;
Transformations(:,:,27) =RLT01;
Transformations(:,:,28) =RLT02;
Transformations(:,:,29) =RLT03;
Transformations(:,:,30) =RLT04;
Transformations(:,:,31) =RLT05;
Transformations(:,:,32) =RLT06;
Transformations(:,:,33) = HTG0;
Transformations(:,:,34) = HT01;
%Set IK text boxes*********************************************************
%Right Arm
set(handles.XpositionRA,'String',num2str(RAT06(1,4),'%2.2f'));
set(handles.YpositionRA,'String',num2str(RAT06(2,4),'%2.2f'));
set(handles.ZpositionRA,'String',num2str(RAT06(3,4),'%2.2f'));
[RArx,RAry,RArz] = dcm2angle(RAT06(1:3,1:3),'xyz');
set(handles.XorientationRA,'String',num2str(RArx,'%2.2f'));
set(handles.YorientationRA,'String',num2str(RAry,'%2.2f'));
set(handles.ZorientationRA,'String',num2str(RArz,'%2.2f'));
%Left Arm
set(handles.XpositionLA,'String',num2str(LAT06(1,4),'%2.2f'));
set(handles.YpositionLA,'String',num2str(LAT06(2,4),'%2.2f'));
set(handles.ZpositionLA,'String',num2str(LAT06(3,4),'%2.2f'));
[LArx,LAry,LArz] = dcm2angle(LAT06(1:3,1:3),'xyz');
set(handles.XorientationLA,'String',num2str(LArx,'%2.2f'));
set(handles.YorientationLA,'String',num2str(LAry,'%2.2f'));
set(handles.ZorientationLA,'String',num2str(LArz,'%2.2f'));
%Calculate link parameters*************************************************
[atlasXCOM,atlasYCOM]=atlasLinkParams(joint_angles,Transformations);
 %Collision Detection******************************************************
OBB = collisionBoundingBoxes(Transformations,joint_angles);
inCollision = atlasSelfCollisionDetect(OBB);
%Patch*********************************************************************
cla(handles.main)
axes(handles.main);
rotate3d on;
%Temporary will change to update value based on collision
Bcolor = ['b','g','c'];
LAcolor = ['r','m','y','b','g','c'];
RAcolor = ['r','m','y','b','g','c'];
LLcolor = ['r','m','y','b','g','c'];
RLcolor = ['r','m','y','b','g','c'];
Hcolor = 'r';
patchAtlasBack(BP0,BT01,BT02,joint_angles(1:3),Bcolor);
patchAtlasArm(LATG0,LAT01,LAT02,LAT03,LAT04,LAT05,joint_angles(4:9),'left',LAcolor);
patchAtlasArm(RATG0,RAT01,RAT02,RAT03,RAT04,RAT05,joint_angles(10:15),'right',RAcolor);
patchAtlasLeg(LLTG0,LLT01,LLT02,LLT03,LLT04,LLT05,joint_angles(16:21),'left',LLcolor);
patchAtlasLeg(RLTG0,RLT01,RLT02,RLT03,RLT04,RLT05,joint_angles(22:27),'right',RLcolor);
patchAtlasHead(HTG0,joint_angles(28),Hcolor);
if viewCollisionBoxes ==1
    OBBcolor = ['g','g','g','g','g','g','g','g','g','g','g','g','g','g'];
        for i=1:14
            if inCollision(i) ==1
                OBBcolor(i) = 'r';
            else
                OBBcolor(i) = 'g';
            end
        end
    patchAtlasCollisionBoxes(OBB,Transformations,joint_angles,OBBcolor);
end
cla(handles.COM)
axes(handles.COM);
plotCOM(LLT06,RLT06,atlasXCOM,atlasYCOM);
guidata(hObject, handles);
end
%**************************************************************************
%
%
%**************************************************************************
%Forward Kinematics********************************************************
function [TP0,T01,T02,T03] = atlasBackFK(origin,q)
q(2) = -q(2);
%Link Lengths in milimeters------------------------------------------------
d0 = 0;
d1 = 161.97;
d2 = 0;
d3 = 0;
%Link offsets in Meters----------------------------------------------------
r0 = -12.5;
r1 = 0;
r2 = 50;
r3 = 0;
%Link Twist in Radians-----------------------------------------------------
a0 = 0;
a1 = pi/2;
a2 = pi/2;
a3 = 0;
%Link Angle in Radians-----------------------------------------------------
q0 = 0;
q1 = q(1);
q2 = q(2)+pi/2;
q3 = q(3);
%D-H Paramerters-----------------------------------------------------------
%Right Arm
%       TG0     T01     T02     T03
alpha = [a0,    a1,     a2,     a3];
a     = [r0,    r1,     r2,     r3];         
d     = [d0,    d1,     d2,     d3];
theta = [q0,    q1,     q2,     q3];
Transform = zeros(4,4,length(theta));
%Calculate homogeneous transformation matrix-------------------------------
for k=1:length(theta)
Transform(:,:,k) = [cos(theta(k)), -sin(theta(k))*cos(alpha(k)),  sin(theta(k))*sin(alpha(k)), a(k)*cos(theta(k));...
                    sin(theta(k)),  cos(theta(k))*cos(alpha(k)), -cos(theta(k))*sin(alpha(k)), a(k)*sin(theta(k));...
                    0,              sin(alpha(k)),                cos(alpha(k)),               d(k);...
                    0,              0,                            0,                           1];
end
%Transformations ----------------------------------------------------------
TG0 = origin;
TP0 = TG0*Transform(:,:,1);
T01 = TP0*Transform(:,:,2);
T02 = T01*Transform(:,:,3);
T03 = T02*Transform(:,:,4);
end
function [TG0,T01,T02,T03,T04,T05,T06] = atlasArmFK(origin,q,arm)
    if isequal('right',arm)
        q(1) = -q(1);
        q(2) = -q(2);
        q(4) = -q(4);
    else
        q(3) = -q(3);
    end
q(5) = -q(5);
q(6) = -q(6);
la2 = 307.1;
la3 = 306.6;
la4 = 13.65;
%Link Lengths in milimeters------------------------------------------------
d0 = 0;
d1 = 0;
d2 = -la2;
d3 = 0;
d4 = -la3;
d5 = 0;
%Link offsets in Meters----------------------------------------------------
r0 = 0;
r1 = 0;
r2 = 0;
r3 = 0;
r4 = 0;
r5 = la4;
%Link Twist in Radians-----------------------------------------------------
a0 = pi/2;
a1 = pi/2;
a2 = -pi/2;
a3 = pi/2;
a4 = -pi/2;
a5 = 0;
%Link Angle in Radians-----------------------------------------------------
q0 = q(1)+pi/2;
q1 = q(2)-1.0472;%-1.57 rotation for DH params & 0.5236 to match zero config
q2 = q(3)+pi;%1.57 rotation for DH params & 1.57 to match zero config
q3 = q(4);
q4 = q(5);
q5 = q(6)+pi/2;
%D-H Paramerters-----------------------------------------------------------
%       T01     T02     T03     T04     T05     T06
alpha = [a0,    a1,     a2,     a3,     a4,     a5];
a     = [r0,    r1,     r2,     r3,     r4,     r5];         
d     = [d0,    d1,     d2,     d3,     d4,     d5];
theta = [q0,    q1,     q2,     q3,     q4,     q5];
Transform = zeros(4,4,length(theta));
%Calculate homogeneous transformation matrix-------------------------------
for k=1:length(theta)
Transform(:,:,k) = [cos(theta(k)), -sin(theta(k))*cos(alpha(k)),  sin(theta(k))*sin(alpha(k)), a(k)*cos(theta(k));...
                    sin(theta(k)),  cos(theta(k))*cos(alpha(k)), -cos(theta(k))*sin(alpha(k)), a(k)*sin(theta(k));...
                    0,              sin(alpha(k)),                cos(alpha(k)),               d(k);...
                    0,              0,                            0,                           1];
end
%Transformations ----------------------------------------------------------
TG0 = origin;
T01 = origin*Transform(:,:,1);
T02 = T01*Transform(:,:,2);
T03 = T02*Transform(:,:,3);
T04 = T03*Transform(:,:,4);
T05 = T04*Transform(:,:,5);
T06 = T05*Transform(:,:,6);
end
function [TG0,T01,T02,T03,T04,T05,T06] = atlasLegFK(origin,q,leg)
Ll3 = 374;
Ll4 = 422;
Ll5 = 81.35;
%Link Lengths in milimeters------------------------------------------------
d0 = 0;
d1 = 50;
dT = 0;
d2 = 0;
d3 = 0;
d4 = 0;
d5 = 0;
%Link offsets in Meters----------------------------------------------------
r0 = 0;
r1 = 50;
rT = -50;
r2 = Ll3;
r3 = Ll4;
r4 = 0;
r5 = Ll5;
%Link Twist in Radians-----------------------------------------------------
a0 = pi/2;
a1 = -pi/2;
aT = 0;
a2 = 0;
a3 = 0;
a4 = pi/2;
a5 = 0;
%Link Angle in Radians-----------------------------------------------------
q0 = q(1)+pi/2;
q1 = q(2)-pi/2;
qT = -pi/2;
q2 = q(3)+pi/2;
q3 = q(4);
q4 = q(5);
q5 = q(6);
%D-H Paramerters-----------------------------------------------------------
%Right Arm
%       T01     T02     TTT     T03     T04     T05     T06
alpha = [a0,    a1,     aT,     a2,     a3,     a4,     a5];
a     = [r0,    r1,     rT,     r2,     r3,     r4,     r5];         
d     = [d0,    d1,     dT,     d2,     d3,     d4,     d5];
theta = [q0,    q1,     qT,     q2,     q3,     q4,     q5];
Transform = zeros(4,4,length(theta));
%Calculate homogeneous transformation matrix-------------------------------
for k=1:length(theta)
Transform(:,:,k) = [cos(theta(k)), -sin(theta(k))*cos(alpha(k)),  sin(theta(k))*sin(alpha(k)), a(k)*cos(theta(k));...
                    sin(theta(k)),  cos(theta(k))*cos(alpha(k)), -cos(theta(k))*sin(alpha(k)), a(k)*sin(theta(k));...
                    0,              sin(alpha(k)),                cos(alpha(k)),               d(k);...
                    0,              0,                            0,                           1];
end
%Transformations ----------------------------------------------------------
TG0 = origin;
T01 = origin*Transform(:,:,1);
T02 = T01*Transform(:,:,2);
TTT = T02*Transform(:,:,3);
T03 = TTT*Transform(:,:,4);
T04 = T03*Transform(:,:,5);
T05 = T04*Transform(:,:,6);
T06 = T05*Transform(:,:,7);
end
function [TG0,T01] = atlasHeadFK(origin,q)
%Link Lengths in milimeters------------------------------------------------
d0 = 216.72;
%Link offsets in Meters----------------------------------------------------
r0 = 537.96;
%Link Twist in Radians-----------------------------------------------------
a0 = pi/2;
%Link Angle in Radians-----------------------------------------------------
q0 = q;
%D-H Paramerters-----------------------------------------------------------
%Right Arm
%       T01
alpha = a0;
a     = r0;
d     = d0;
theta = q0;
Transform = zeros(4,4,length(theta));
%Calculate homogeneous transformation matrix-------------------------------
for k=1:length(theta)
Transform(:,:,k) = [cos(theta(k)), -sin(theta(k))*cos(alpha(k)),  sin(theta(k))*sin(alpha(k)), a(k)*cos(theta(k));...
                    sin(theta(k)),  cos(theta(k))*cos(alpha(k)), -cos(theta(k))*sin(alpha(k)), a(k)*sin(theta(k));...
                    0,              sin(alpha(k)),                cos(alpha(k)),               d(k);...
                    0,              0,                            0,                           1];
end
%Transformations ----------------------------------------------------------
TG0 = origin;
T01 = TG0*Transform(:,:,1);
end
%Inverse Kinematics********************************************************
function [q_dMin] = atlasArmIK(goalPose,arm)
La2 = 307.1;
La3 = 306.6;
La4 = 13.65;
invGoalPose = inv(goalPose);
%Right Arm
RApx = invGoalPose(1,4);
RApy = invGoalPose(2,4);
RApz = invGoalPose(3,4);
RAnx = invGoalPose(1,1);
RAny = invGoalPose(2,1);
RAnz = invGoalPose(3,1);
RAsx = invGoalPose(1,2);
RAsy = invGoalPose(2,2);
RAsz = invGoalPose(3,2);
RAax = invGoalPose(1,3);
RAay = invGoalPose(2,3);
RAaz = invGoalPose(3,3);   
%q4_dP,q5_dP,q2_dP--------------------------------------------------------1    
C4 = ((RApx+La4)^2+RApy^2+RApz^2-La2^2-La3^2)/(2*La2*La3);
q4_dP = atan2(real(sqrt(1-C4^2)),C4); 

S5 = RApz/(sin(q4_dP)*La2);
S5(isnan(S5))=0;
q5_dP = atan2(S5,real(sqrt(1-S5^2)));

psi = atan2(RApy,(RApx+La4));
q6_d = wrapToPi(atan2(sin(q4_dP)*cos(q5_dP)*La2,-cos(q4_dP)*La2-La3)-psi);

S2 = RAax*(cos(q4_dP)*cos(q6_d)-cos(q5_dP)*sin(q4_dP)*sin(q6_d))-RAay*(cos(q4_dP)...
    *sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dP))-RAaz*sin(q4_dP)*sin(q5_dP);
q2_dP = atan2(S2,real(sqrt(1-S2^2)));

S3 = -RAax*(cos(q6_d)*sin(q4_dP)+cos(q4_dP)*cos(q5_dP)*sin(q6_d))+RAay*(sin(q4_dP)...
    *sin(q6_d)-cos(q4_dP)*cos(q5_dP)*cos(q6_d))-RAaz*cos(q4_dP)*sin(q5_dP);
C3 = -RAax*sin(q5_dP)*sin(q6_d)-RAay*cos(q6_d)*sin(q5_dP)+RAaz*cos(q5_dP);
q3_d = atan2(S3,C3);

S1 = -RAnx*(cos(q4_dP)*cos(q6_d)-cos(q5_dP)*sin(q4_dP)*sin(q6_d))-RAsy*(cos(q4_dP)*...
    sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dP))-RAsz*sin(q4_dP)*sin(q5_dP);
C1 = RAsx*(cos(q4_dP)*cos(q6_d)-cos(q5_dP)*sin(q4_dP)*sin(q6_d))-RAsy*(cos(q4_dP)*...
    sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dP))-RAsz*sin(q4_dP)*sin(q5_dP);
q1_d = atan2(S1,C1);
%Elbow Singularity---------------------------------------------------------
if q4_dP == 0
    qT = atan2(-cos(q6_d)*RAay-sin(q6_d)*RAax,RAaz);
        if cos(q2_dP)<0
            qT = wrapToPi(qT-pi/2);
        end
    q5_dP = wrapToPi(qT-q3_d);
end
%Shoulder singularity------------------------------------------------------
if q2_dP == -pi/2
    qT = atan2(sin(q6_d)*RAsy-cos(q6_d)*RAsx,sin(q6_d)*RAny-cos(q6_d)*RAnx);
    if sin(q4_dP)<0
        qT = Qt+pi;
    end
    q1_d = wrapToPi(qT-q3_d);
end
%Arm singularity-----------------------------------------------------------
if q4_dP ==0 && q2_dP == -pi/2
    qT = atan2(-RAnz,RAsz);
    q5_dP = wrapToPi(qT-q1_d-q3_d);
end
%**************************************************************************
q_d(:,1) = [q1_d,q2_dP,q3_d,q4_dP,q5_dP,q6_d];
%q4_dN,q5_dP,q2_dP--------------------------------------------------------2 
C4 = ((RApx+La4)^2+RApy^2+RApz^2-La2^2-La3^2)/(2*La2*La3);
q4_dN = atan2(real(-sqrt(1-C4^2)),C4); 

S5 = RApz/(sin(q4_dN)*La2);
S5(isnan(S5))=0;
q5_dP = atan2(S5,real(sqrt(1-S5^2)));

psi = atan2(RApy,(RApx+La4));
q6_d = wrapToPi(atan2(sin(q4_dN)*cos(q5_dP)*La2,-cos(q4_dN)*La2-La3)-psi);

S2 = RAax*(cos(q4_dN)*cos(q6_d)-cos(q5_dP)*sin(q4_dN)*sin(q6_d))-RAay*(cos(q4_dN)...
    *sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dN))-RAaz*sin(q4_dN)*sin(q5_dP);
q2_dP = atan2(S2,real(sqrt(1-S2^2)));

S3 = -RAax*(cos(q6_d)*sin(q4_dN)+cos(q4_dN)*cos(q5_dP)*sin(q6_d))+RAay*(sin(q4_dN)...
    *sin(q6_d)-cos(q4_dN)*cos(q5_dP)*cos(q6_d))-RAaz*cos(q4_dN)*sin(q5_dP);
C3 = -RAax*sin(q5_dP)*sin(q6_d)-RAay*cos(q6_d)*sin(q5_dP)+RAaz*cos(q5_dP);
q3_d = atan2(S3,C3);

S1 = -RAnx*(cos(q4_dN)*cos(q6_d)-cos(q5_dP)*sin(q4_dN)*sin(q6_d))-RAsy*(cos(q4_dN)*...
    sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dN))-RAsz*sin(q4_dN)*sin(q5_dP);
C1 = RAsx*(cos(q4_dN)*cos(q6_d)-cos(q5_dP)*sin(q4_dN)*sin(q6_d))-RAsy*(cos(q4_dN)*...
    sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dN))-RAsz*sin(q4_dN)*sin(q5_dP);
q1_d = atan2(S1,C1);
%Elbow Singularity---------------------------------------------------------
if q4_dN == 0
    qT = atan2(-cos(q6_d)*RAay-sin(q6_d)*RAax,RAaz);
        if cos(q2_dP)<0
            qT = wrapToPi(qT-pi/2);
        end
    q5_dP = wrapToPi(qT-q3_d);
end
%Shoulder singularity------------------------------------------------------
if q2_dP == -pi/2
    qT = atan2(sin(q6_d)*RAsy-cos(q6_d)*RAsx,sin(q6_d)*RAny-cos(q6_d)*RAnx);
    if sin(q4_dN)<0
        qT = Qt+pi;
    end
    q1_d = wrapToPi(qT-q3_d);
end
%Arm singularity-----------------------------------------------------------
if q4_dN ==0 && q2_dP == -pi/2
    qT = atan2(-RAnz,RAsz);
    q5_dP = wrapToPi(qT-q1_d-q3_d);
end
%**************************************************************************
q_d(:,2) = [q1_d,q2_dP,q3_d,q4_dP,q5_dP,q6_d];
%q4_dP,q5_dN,q2_dP--------------------------------------------------------3    
C4 = ((RApx+La4)^2+RApy^2+RApz^2-La2^2-La3^2)/(2*La2*La3);
q4_dP = atan2(real(sqrt(1-C4^2)),C4); 

S5 = RApz/(sin(q4_dP)*La2);
S5(isnan(S5))=0;
q5_dN = atan2(S5,real(-sqrt(1-S5^2)));

psi = atan2(RApy,(RApx+La4));
q6_d = wrapToPi(atan2(sin(q4_dP)*cos(q5_dN)*La2,-cos(q4_dP)*La2-La3)-psi);

S2 = RAax*(cos(q4_dP)*cos(q6_d)-cos(q5_dN)*sin(q4_dP)*sin(q6_d))-RAay*(cos(q4_dP)...
    *sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dP))-RAaz*sin(q4_dP)*sin(q5_dN);
q2_dP = atan2(S2,real(sqrt(1-S2^2)));

S3 = -RAax*(cos(q6_d)*sin(q4_dP)+cos(q4_dP)*cos(q5_dN)*sin(q6_d))+RAay*(sin(q4_dP)...
    *sin(q6_d)-cos(q4_dP)*cos(q5_dN)*cos(q6_d))-RAaz*cos(q4_dP)*sin(q5_dN);
C3 = -RAax*sin(q5_dN)*sin(q6_d)-RAay*cos(q6_d)*sin(q5_dN)+RAaz*cos(q5_dN);
q3_d = atan2(S3,C3);

S1 = -RAnx*(cos(q4_dP)*cos(q6_d)-cos(q5_dN)*sin(q4_dP)*sin(q6_d))-RAsy*(cos(q4_dP)*...
    sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dP))-RAsz*sin(q4_dP)*sin(q5_dN);
C1 = RAsx*(cos(q4_dP)*cos(q6_d)-cos(q5_dN)*sin(q4_dP)*sin(q6_d))-RAsy*(cos(q4_dP)*...
    sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dP))-RAsz*sin(q4_dP)*sin(q5_dN);
q1_d = atan2(S1,C1);
%Elbow Singularity---------------------------------------------------------
if q4_dP == 0
    qT = atan2(-cos(q6_d)*RAay-sin(q6_d)*RAax,RAaz);
        if cos(q2_dP)<0
            qT = wrapToPi(qT-pi/2);
        end
    q5_dN = wrapToPi(qT-q3_d);
end
%Shoulder singularity------------------------------------------------------
if q2_dP == -pi/2
    qT = atan2(sin(q6_d)*RAsy-cos(q6_d)*RAsx,sin(q6_d)*RAny-cos(q6_d)*RAnx);
    if sin(q4_dP)<0
        qT = Qt+pi;
    end
    q1_d = wrapToPi(qT-q3_d);
end
%Arm singularity-----------------------------------------------------------
if q4_dP ==0 && q2_dP == -pi/2
    qT = atan2(-RAnz,RAsz);
    q5_dN = wrapToPi(qT-q1_d-q3_d);
end
%**************************************************************************
q_d(:,3) = [q1_d,q2_dP,q3_d,q4_dP,q5_dN,q6_d];
%q4_dN,q5_dN,q2_dP--------------------------------------------------------4 
C4 = ((RApx+La4)^2+RApy^2+RApz^2-La2^2-La3^2)/(2*La2*La3);
q4_dN = atan2(real(-sqrt(1-C4^2)),C4); 

S5 = RApz/(sin(q4_dN)*La2);
S5(isnan(S5))=0;
q5_dN = atan2(S5,real(-sqrt(1-S5^2)));

psi = atan2(RApy,(RApx+La4));
q6_d = wrapToPi(atan2(sin(q4_dN)*cos(q5_dN)*La2,-cos(q4_dN)*La2-La3)-psi);

S2 = RAax*(cos(q4_dN)*cos(q6_d)-cos(q5_dN)*sin(q4_dN)*sin(q6_d))-RAay*(cos(q4_dN)...
    *sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dN))-RAaz*sin(q4_dN)*sin(q5_dN);
q2_dP = atan2(S2,real(sqrt(1-S2^2)));

S3 = -RAax*(cos(q6_d)*sin(q4_dN)+cos(q4_dN)*cos(q5_dN)*sin(q6_d))+RAay*(sin(q4_dN)...
    *sin(q6_d)-cos(q4_dN)*cos(q5_dN)*cos(q6_d))-RAaz*cos(q4_dN)*sin(q5_dN);
C3 = -RAax*sin(q5_dN)*sin(q6_d)-RAay*cos(q6_d)*sin(q5_dN)+RAaz*cos(q5_dN);
q3_d = atan2(S3,C3);

S1 = -RAnx*(cos(q4_dN)*cos(q6_d)-cos(q5_dN)*sin(q4_dN)*sin(q6_d))-RAsy*(cos(q4_dN)*...
    sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dN))-RAsz*sin(q4_dN)*sin(q5_dN);
C1 = RAsx*(cos(q4_dN)*cos(q6_d)-cos(q5_dN)*sin(q4_dN)*sin(q6_d))-RAsy*(cos(q4_dN)*...
    sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dN))-RAsz*sin(q4_dN)*sin(q5_dN);
q1_d = atan2(S1,C1);
%Elbow Singularity---------------------------------------------------------
if q4_dN == 0
    qT = atan2(-cos(q6_d)*RAay-sin(q6_d)*RAax,RAaz);
        if cos(q2_dP)<0
            qT = wrapToPi(qT-pi/2);
        end
    q5_dN = wrapToPi(qT-q3_d);
end
%Shoulder singularity------------------------------------------------------
if q2_dP == -pi/2
    qT = atan2(sin(q6_d)*RAsy-cos(q6_d)*RAsx,sin(q6_d)*RAny-cos(q6_d)*RAnx);
    if sin(q4_dN)<0
        qT = Qt+pi;
    end
    q1_d = wrapToPi(qT-q3_d);
end
%Arm singularity-----------------------------------------------------------
if q4_dN ==0 && q2_dP == -pi/2
    qT = atan2(-RAnz,RAsz);
    q5_dN = wrapToPi(qT-q1_d-q3_d);
end
%**************************************************************************
q_d(:,4) = [q1_d,q2_dP,q3_d,q4_dP,q5_dN,q6_d];
%q4_dP,q5_dP,q2_dN--------------------------------------------------------5 
C4 = ((RApx+La4)^2+RApy^2+RApz^2-La2^2-La3^2)/(2*La2*La3);
q4_dP = atan2(real(sqrt(1-C4^2)),C4); 

S5 = RApz/(sin(q4_dP)*La2);
S5(isnan(S5))=0;
q5_dP = atan2(S5,real(sqrt(1-S5^2)));

psi = atan2(RApy,(RApx+La4));
q6_d = wrapToPi(atan2(sin(q4_dP)*cos(q5_dP)*La2,-cos(q4_dP)*La2-La3)-psi);

S2 = RAax*(cos(q4_dP)*cos(q6_d)-cos(q5_dP)*sin(q4_dP)*sin(q6_d))-RAay*(cos(q4_dP)...
    *sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dP))-RAaz*sin(q4_dP)*sin(q5_dP);
q2_dN = atan2(S2,real(-sqrt(1-S2^2)));

S3 = -RAax*(cos(q6_d)*sin(q4_dP)+cos(q4_dP)*cos(q5_dP)*sin(q6_d))+RAay*(sin(q4_dP)...
    *sin(q6_d)-cos(q4_dP)*cos(q5_dP)*cos(q6_d))-RAaz*cos(q4_dP)*sin(q5_dP);
C3 = -RAax*sin(q5_dP)*sin(q6_d)-RAay*cos(q6_d)*sin(q5_dP)+RAaz*cos(q5_dP);
q3_d = atan2(S3,C3);

S1 = -RAnx*(cos(q4_dP)*cos(q6_d)-cos(q5_dP)*sin(q4_dP)*sin(q6_d))-RAsy*(cos(q4_dP)*...
    sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dP))-RAsz*sin(q4_dP)*sin(q5_dP);
C1 = RAsx*(cos(q4_dP)*cos(q6_d)-cos(q5_dP)*sin(q4_dP)*sin(q6_d))-RAsy*(cos(q4_dP)*...
    sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dP))-RAsz*sin(q4_dP)*sin(q5_dP);
q1_d = atan2(S1,C1);
%Elbow Singularity---------------------------------------------------------
if q4_dP == 0
    qT = atan2(-cos(q6_d)*RAay-sin(q6_d)*RAax,RAaz);
        if cos(q2_dN)<0
            qT = wrapToPi(qT-pi/2);
        end
    q5_dP = wrapToPi(qT-q3_d);
end
%Shoulder singularity------------------------------------------------------
if q2_dN == -pi/2
    qT = atan2(sin(q6_d)*RAsy-cos(q6_d)*RAsx,sin(q6_d)*RAny-cos(q6_d)*RAnx);
    if sin(q4_dP)<0
        qT = Qt+pi;
    end
    q1_d = wrapToPi(qT-q3_d);
end
%Arm singularity-----------------------------------------------------------
if q4_dP ==0 && q2_dN == -pi/2
    qT = atan2(-RAnz,RAsz);
    q5_dP = wrapToPi(qT-q1_d-q3_d);
end
%**************************************************************************
q_d(:,5) = [q1_d,q2_dN,q3_d,q4_dP,q5_dP,q6_d];
%q4_dN,q5_dP,q2_dN--------------------------------------------------------6 
C4 = ((RApx+La4)^2+RApy^2+RApz^2-La2^2-La3^2)/(2*La2*La3);
q4_dN = atan2(real(-sqrt(1-C4^2)),C4); 

S5 = RApz/(sin(q4_dN)*La2);
S5(isnan(S5))=0;
q5_dP = atan2(S5,real(sqrt(1-S5^2)));

psi = atan2(RApy,(RApx+La4));
q6_d = wrapToPi(atan2(sin(q4_dN)*cos(q5_dP)*La2,-cos(q4_dN)*La2-La3)-psi);

S2 = RAax*(cos(q4_dN)*cos(q6_d)-cos(q5_dP)*sin(q4_dN)*sin(q6_d))-RAay*(cos(q4_dN)...
    *sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dN))-RAaz*sin(q4_dN)*sin(q5_dP);
q2_dN = atan2(S2,real(-sqrt(1-S2^2)));

S3 = -RAax*(cos(q6_d)*sin(q4_dN)+cos(q4_dN)*cos(q5_dP)*sin(q6_d))+RAay*(sin(q4_dN)...
    *sin(q6_d)-cos(q4_dN)*cos(q5_dP)*cos(q6_d))-RAaz*cos(q4_dN)*sin(q5_dP);
C3 = -RAax*sin(q5_dP)*sin(q6_d)-RAay*cos(q6_d)*sin(q5_dP)+RAaz*cos(q5_dP);
q3_d = atan2(S3,C3);

S1 = -RAnx*(cos(q4_dN)*cos(q6_d)-cos(q5_dP)*sin(q4_dN)*sin(q6_d))-RAsy*(cos(q4_dN)*...
    sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dN))-RAsz*sin(q4_dN)*sin(q5_dP);
C1 = RAsx*(cos(q4_dN)*cos(q6_d)-cos(q5_dP)*sin(q4_dN)*sin(q6_d))-RAsy*(cos(q4_dN)*...
    sin(q6_d)+cos(q5_dP)*cos(q6_d)*sin(q4_dN))-RAsz*sin(q4_dN)*sin(q5_dP);
q1_d = atan2(S1,C1);
%Elbow Singularity---------------------------------------------------------
if q4_dN == 0
    qT = atan2(-cos(q6_d)*RAay-sin(q6_d)*RAax,RAaz);
        if cos(q2_dN)<0
            qT = wrapToPi(qT-pi/2);
        end
    q5_dP = wrapToPi(qT-q3_d);
end
%Shoulder singularity------------------------------------------------------
if q2_dN == -pi/2
    qT = atan2(sin(q6_d)*RAsy-cos(q6_d)*RAsx,sin(q6_d)*RAny-cos(q6_d)*RAnx);
    if sin(q4_dN)<0
        qT = Qt+pi;
    end
    q1_d = wrapToPi(qT-q3_d);
end
%Arm singularity-----------------------------------------------------------
if q4_dN ==0 && q2_dN == -pi/2
    qT = atan2(-RAnz,RAsz);
    q5_dP = wrapToPi(qT-q1_d-q3_d);
end
%**************************************************************************
q_d(:,6) = [q1_d,q2_dN,q3_d,q4_dN,q5_dP,q6_d];
%q4_dP,q5_dN,q2_dN--------------------------------------------------------7  
C4 = ((RApx+La4)^2+RApy^2+RApz^2-La2^2-La3^2)/(2*La2*La3);
q4_dP = atan2(real(sqrt(1-C4^2)),C4); 

S5 = RApz/(sin(q4_dP)*La2);
S5(isnan(S5))=0;
q5_dN = atan2(S5,real(-sqrt(1-S5^2)));

psi = atan2(RApy,(RApx+La4));
q6_d = wrapToPi(atan2(sin(q4_dP)*cos(q5_dN)*La2,-cos(q4_dP)*La2-La3)-psi);

S2 = RAax*(cos(q4_dP)*cos(q6_d)-cos(q5_dN)*sin(q4_dP)*sin(q6_d))-RAay*(cos(q4_dP)...
    *sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dP))-RAaz*sin(q4_dP)*sin(q5_dN);
q2_dN = atan2(S2,real(-sqrt(1-S2^2)));

S3 = -RAax*(cos(q6_d)*sin(q4_dP)+cos(q4_dP)*cos(q5_dN)*sin(q6_d))+RAay*(sin(q4_dP)...
    *sin(q6_d)-cos(q4_dP)*cos(q5_dN)*cos(q6_d))-RAaz*cos(q4_dP)*sin(q5_dN);
C3 = -RAax*sin(q5_dN)*sin(q6_d)-RAay*cos(q6_d)*sin(q5_dN)+RAaz*cos(q5_dN);
q3_d = atan2(S3,C3);

S1 = -RAnx*(cos(q4_dP)*cos(q6_d)-cos(q5_dN)*sin(q4_dP)*sin(q6_d))-RAsy*(cos(q4_dP)*...
    sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dP))-RAsz*sin(q4_dP)*sin(q5_dN);
C1 = RAsx*(cos(q4_dP)*cos(q6_d)-cos(q5_dN)*sin(q4_dP)*sin(q6_d))-RAsy*(cos(q4_dP)*...
    sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dP))-RAsz*sin(q4_dP)*sin(q5_dN);
q1_d = atan2(S1,C1);
%Elbow Singularity---------------------------------------------------------
if q4_dP == 0
    qT = atan2(-cos(q6_d)*RAay-sin(q6_d)*RAax,RAaz);
        if cos(q2_dN)<0
            qT = wrapToPi(qT-pi/2);
        end
    q5_dN = wrapToPi(qT-q3_d);
end
%Shoulder singularity------------------------------------------------------
if q2_dN == -pi/2
    qT = atan2(sin(q6_d)*RAsy-cos(q6_d)*RAsx,sin(q6_d)*RAny-cos(q6_d)*RAnx);
    if sin(q4_dP)<0
        qT = Qt+pi;
    end
    q1_d = wrapToPi(qT-q3_d);
end
%Arm singularity-----------------------------------------------------------
if q4_dP ==0 && q2_dN == -pi/2
    qT = atan2(-RAnz,RAsz);
    q5_dN = wrapToPi(qT-q1_d-q3_d);
end
%**************************************************************************
q_d(:,7) = [q1_d,q2_dN,q3_d,q4_dP,q5_dN,q6_d];
%q4_dN,q5_dN,q2_dN--------------------------------------------------------8 
C4 = ((RApx+La4)^2+RApy^2+RApz^2-La2^2-La3^2)/(2*La2*La3);
q4_dN = atan2(real(-sqrt(1-C4^2)),C4); 

S5 = RApz/(sin(q4_dN)*La2);
S5(isnan(S5))=0;
q5_dN = atan2(S5,real(-sqrt(1-S5^2)));

psi = atan2(RApy,(RApx+La4));
q6_d = wrapToPi(atan2(sin(q4_dN)*cos(q5_dN)*La2,-cos(q4_dN)*La2-La3)-psi);

S2 = RAax*(cos(q4_dN)*cos(q6_d)-cos(q5_dN)*sin(q4_dN)*sin(q6_d))-RAay*(cos(q4_dN)...
    *sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dN))-RAaz*sin(q4_dN)*sin(q5_dN);
q2_dN = atan2(S2,real(-sqrt(1-S2^2)));

S3 = -RAax*(cos(q6_d)*sin(q4_dN)+cos(q4_dN)*cos(q5_dN)*sin(q6_d))+RAay*(sin(q4_dN)...
    *sin(q6_d)-cos(q4_dN)*cos(q5_dN)*cos(q6_d))-RAaz*cos(q4_dN)*sin(q5_dN);
C3 = -RAax*sin(q5_dN)*sin(q6_d)-RAay*cos(q6_d)*sin(q5_dN)+RAaz*cos(q5_dN);
q3_d = atan2(S3,C3);

S1 = -RAnx*(cos(q4_dN)*cos(q6_d)-cos(q5_dN)*sin(q4_dN)*sin(q6_d))-RAsy*(cos(q4_dN)*...
    sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dN))-RAsz*sin(q4_dN)*sin(q5_dN);
C1 = RAsx*(cos(q4_dN)*cos(q6_d)-cos(q5_dN)*sin(q4_dN)*sin(q6_d))-RAsy*(cos(q4_dN)*...
    sin(q6_d)+cos(q5_dN)*cos(q6_d)*sin(q4_dN))-RAsz*sin(q4_dN)*sin(q5_dN);
q1_d = atan2(S1,C1);
%Elbow Singularity---------------------------------------------------------
if q4_dN == 0
    qT = atan2(-cos(q6_d)*RAay-sin(q6_d)*RAax,RAaz);
        if cos(q2_dN)<0
            qT = wrapToPi(qT-pi/2);
        end
    q5_dN = wrapToPi(qT-q3_d);
end
%Shoulder singularity------------------------------------------------------
if q2_dN == -pi/2
    qT = atan2(sin(q6_d)*RAsy-cos(q6_d)*RAsx,sin(q6_d)*RAny-cos(q6_d)*RAnx);
    if sin(q4_dN)<0
        qT = Qt+pi;
    end
    q1_d = wrapToPi(qT-q3_d);
end
%Arm singularity-----------------------------------------------------------
if q4_dN ==0 && q2_dN == -pi/2
    qT = atan2(-RAnz,RAsz);
    q5_dN = wrapToPi(qT-q1_d-q3_d);
end
%**************************************************************************
q_d(:,8) = [q1_d,q2_dN,q3_d,q4_dN,q5_dN,q6_d];
%Check if solution is in valid range
safety = 1e-6;
if isequal('left',arm)
    elxMin = 0;
else
    elxMin = -2.35619;
end
for i=1:8
       if q_d(1,i) < -1.5708-safety || q_d(1,i) > 0.785395+safety
           q_d(1,i) = 100;
       end
       if q_d(2,i) < -1.5708-safety || q_d(2,i) > 1.5708+safety
           q_d(2,i) = 100;
       end
       if q_d(3,i) < -safety || q_d(3,i) > 3.14159+safety
           q_d(3,i) = 100;
       end
       if q_d(4,i) < elxMin-safety || q_d(4,i) > 0+safety
           q_d(4,i) = 100;
       end
       if q_d(5,i) < -safety || q_d(5,i) > 3.1459+safety
           q_d(5,i) = 100;
       end
       if q_d(6,i) < -1.1781-safety || q_d(6,i) > 1.1781+safety
           q_d(6,i) = 100;
       end
end
%Choose solution with angles closest to zero configuration
[Sum,Column]=min(sum(q_d,1));
q_dMin = q_d(:,Column);
end
function [q_dMin] = atlasLeftArmIK(leftGoalPose,leftArmOrigin)
    goalPose = leftArmOrigin\leftGoalPose;
    goalPose(abs(goalPose)<1e-10) = 0;
    q_dMin = atlasArmIK(goalPose,'left');
end
function [q_dMin] = atlasRightArmIK(rightGoalPose,rightArmOrigin)
    goalPose = rightArmOrigin\rightGoalPose;
    goalPose(abs(goalPose)<1e-10) = 0;
    q_dMin = atlasArmIK(goalPose,'right');
end
%Inverse Kinematics helper function----------------------------------------
function [angle] = wrapToPi(angle)
angle = mod(angle,2*pi); % [0 2pi)

% shift
j = angle > pi;
angle(j) = angle(j) - 2*pi;
j = angle < - pi;
angle(j) = angle(j) + 2*pi;
end
%AtlasLinkParams***********************************************************
function [atlasXCOM,atlasYCOM]= atlasLinkParams(joint_angles,Transformations)
%pelvis--------------------------------------------------------------------
linkMass(1) = 17.882;
linkCOM(:,:,1) = Transformations(:,:,1)*transform(0.0111,0,0.0271,0,0,0);
ixx=0.1244;
ixy=0.0008;
ixz=-0.0007;
iyy=0.0958;
iyz=-0.0005;
izz=0.1167;
linkInertia(:,:,1) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%ltorso--------------------------------------------------------------------
linkMass(2) = 2.409;
linkCOM(:,:,2) = Transformations(:,:,2)*transform(-0.0112984,-3.15366e-06,0.0746835,0,0,joint_angles(1));
ixx=0.0039092;
ixy=-5.04491e-08;
ixz=-0.000342157;
iyy=0.00341694;
iyz=4.87119e-07;
izz=0.00174492;
linkInertia(:,:,2) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%mtorso--------------------------------------------------------------------
linkMass(3) = 0.69;
linkCOM(:,:,3) = Transformations(:,:,3)*transform(-0.00816266,-0.0131245,0.0305974,0,0,joint_angles(2));
ixx=0.000454181;
ixy=-6.10764e-05;
ixz=3.94009e-05;
iyy=0.000483282;
iyz=5.27463e-05;
izz=0.000444215;
linkInertia(:,:,3) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%utorso with backpack------------------------------------------------------
linkMass(4) = 52.007;
linkCOM(:,:,4) = Transformations(:,:,4)*transform(-0.0923,0,0.3,0,0,joint_angles(3)); 
ixx=1.466;
ixy=0.00362;
ixz=0.336;
iyy=1.51;
iyz=0.001;
izz=1.3;
linkInertia(:,:,4) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%Left Arm******************************************************************
%l_clav--------------------------------------------------------------------
linkMass(5) = 3.45;
linkCOM(:,:,5) = Transformations(:,:,5)*transform(0,0.048,0.084,0,0,joint_angles(4));
ixx=0.011;
ixy=0;
ixz=0;
iyy=0.009;
iyz=-0.004;
izz=0.004;
linkInertia(:,:,5) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_scap--------------------------------------------------------------------
linkMass(6) = 3.012;
linkCOM(:,:,6) = Transformations(:,:,6)*transform(0,0,0,0,0,joint_angles(5));
ixx=0.00319;
ixy=0;
ixz=0;
iyy=0.00583;
iyz=0;
izz=0.00583;
linkInertia(:,:,6) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_uarm--------------------------------------------------------------------
linkMass(7) = 3.388;
linkCOM(:,:,7) = Transformations(:,:,7)*transform(0,-0.065,0,0,0,joint_angles(6));
ixx=0.00656;
ixy=0;
ixz=0;
iyy=0.00358;
iyz=0;
izz=0.00656;
linkInertia(:,:,7) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_larm--------------------------------------------------------------------
linkMass(8) = 2.509;
linkCOM(:,:,8) = Transformations(:,:,8)*transform(0,0,0,0,0,joint_angles(7));
ixx=0.00265;
ixy=0;
ixz=0;
iyy=0.00446;
iyz=0;
izz=0.00446;
linkInertia(:,:,8) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_farm--------------------------------------------------------------------
linkMass(9) = 3.388;
linkCOM(:,:,9) = Transformations(:,:,9)*transform(0,-0.065,0,0,0,joint_angles(8));
ixx=0.00656;
ixy=0;
ixz=0;
iyy=0.00358;
iyz=0;
izz=0.00656;
linkInertia(:,:,9) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_hand--------------------------------------------------------------------
linkMass(10) = 2.509;
linkCOM(:,:,10) = Transformations(:,:,10)*transform(0,0,0,0,0,joint_angles(9));
ixx=0.00265;
ixy=0;
ixz=0;
iyy=0.00446;
iyz=0;
izz=0.00446;
linkInertia(:,:,10) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%Here is where I would add in the weight/inertia of hand/load
%l_load--------------------------------------------------------------------
linkMass(11) = 0;
linkCOM(:,:,11) = Transformations(:,:,11)*transform(0,0,0,0,0,joint_angles(9));
ixx=0;
ixy=0;
ixz=0;
iyy=0;
iyz=0;
izz=0;
linkInertia(:,:,11) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%Right Arm*****************************************************************
%r_clav--------------------------------------------------------------------
linkMass(12) = 3.45;
linkCOM(:,:,12) = Transformations(:,:,12)*transform(0,-0.048,0.084,0,0,joint_angles(10));
ixx=0.011;
ixy=0;
ixz=0;
iyy=0.009;
iyz=0.004;
izz=0.004;
linkInertia(:,:,12) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_scap--------------------------------------------------------------------
linkMass(13) = 3.012;
linkCOM(:,:,13) = Transformations(:,:,13)*transform(0,0,0,0,0,joint_angles(11));
ixx=0.00319;
ixy=0;
ixz=0;
iyy=0.00583;
iyz=0;
izz=0.00583;
linkInertia(:,:,13) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_uarm--------------------------------------------------------------------
linkMass(14) = 3.388;
linkCOM(:,:,14) = Transformations(:,:,14)*transform(0,0.065,0,0,0,joint_angles(12));
ixx=0.00656;
ixy=0;
ixz=0;
iyy=0.00358;
iyz=0;
izz=0.00656;
linkInertia(:,:,14) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_larm--------------------------------------------------------------------
linkMass(15) = 2.509;
linkCOM(:,:,15) = Transformations(:,:,15)*transform(0,0,0,0,0,joint_angles(13));
ixx=0.00265;
ixy=0;
ixz=0;
iyy=0.00446;
iyz=0;
izz=0.00446;
linkInertia(:,:,15) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_farm--------------------------------------------------------------------
linkMass(16) = 3.388;
linkCOM(:,:,16) = Transformations(:,:,16)*transform(0,0.065,0,0,0,joint_angles(14));
ixx=0.00656;
ixy=0;
ixz=0;
iyy=0.00358;
iyz=0;
izz=0.00656;
linkInertia(:,:,16) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_hand--------------------------------------------------------------------
linkMass(17) = 2.509;
linkCOM(:,:,17) = Transformations(:,:,17)*transform(0,0,0,0,0,joint_angles(15));
ixx=0.00265;
ixy=0;
ixz=0;
iyy=0.00446;
iyz=0;
izz=0.00446;
linkInertia(:,:,17) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%Here is where I would add in the weight/inertia of hand/load
%r_load--------------------------------------------------------------------
linkMass(18) = 0;
linkCOM(:,:,18) = Transformations(:,:,18)*transform(0,0,0,0,0,joint_angles(15));
ixx=0;
ixy=0;
ixz=0;
iyy=0;
iyz=0;
izz=0;
linkInertia(:,:,18) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%Left Leg******************************************************************
%l_uglut-------------------------------------------------------------------
linkMass(19) = 0.648;
linkCOM(:,:,23)= Transformations(:,:,19)*transform(0.00529262,-0.00344732,0.00313046,0,0,joint_angles(16));
ixx=0.00074276;
ixy=-3.79607e-08;
ixz=-2.79549e-05;
iyy=0.000688179;
iyz=-3.2735e-08;
izz=0.00041242;
linkInertia(:,:,19) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_lglut-------------------------------------------------------------------
linkMass(20) = 0.866;
linkCOM(:,:,24)= Transformations(:,:,20)*transform(0.0133341,0.0170484,-0.0312052,0,0,joint_angles(17));
ixx=0.000691326;
ixy=-2.24344e-05;
ixz=2.50508e-06;
iyy=0.00126856;
iyz=0.000137862;
izz=0.00106487;
linkInertia(:,:,20) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_uleg--------------------------------------------------------------------
linkMass(21) = 9.209;
linkCOM(:,:,21) = Transformations(:,:,21)*transform(0,0,-0.21,0,0,joint_angles(18));
ixx=0.09;
ixy=0;
ixz=0;
iyy=0.09;
iyz=0;
izz=0.02;
linkInertia(:,:,21) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_lleg--------------------------------------------------------------------
linkMass(22) = 5.479;
linkCOM(:,:,22) = Transformations(:,:,22)*transform(0.001,0,-0.187,0,0,joint_angles(19));
ixx=0.077;
ixy=0;
ixz=-0.003;
iyy=0.076;
iyz=0;
izz=0.01;
linkInertia(:,:,22) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_talus-------------------------------------------------------------------
linkMass(23) = 0.125;
linkCOM(:,:,23)= Transformations(:,:,23)*transform(0,0,0,0,0,joint_angles(20));
ixx=1.01674e-05;
ixy=0;
ixz=0;
iyy=8.42775e-06;
iyz=0;
izz=1.30101e-05;
linkInertia(:,:,23) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%l_foot--------------------------------------------------------------------
linkMass(24) = 2.05;
linkCOM(:,:,28) = Transformations(:,:,24)*transform(0.027,0,-0.067,0,0,joint_angles(21));
ixx=0.002;
ixy=0;
ixz=0;
iyy=0.007;
iyz=0;
izz=0.008;
linkInertia(:,:,24) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%Right Leg*****************************************************************
%r_uglut-------------------------------------------------------------------
linkMass(25) = 0.648;
linkCOM(:,:,25)= Transformations(:,:,26)*transform(0.00529262,0.00344732,0.00313046,0,0,joint_angles(22));
ixx=0.00074276;
ixy=3.79607e-08;
ixz=-2.79549e-05;
iyy=0.000688179;
iyz=3.2735e-08;
izz=0.00041242;
linkInertia(:,:,25) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_lglut-------------------------------------------------------------------
linkMass(26) = 0.866;
linkCOM(:,:,26)= Transformations(:,:,27)*transform(0.0133341,-0.0170484,-0.0312052,0,0,joint_angles(23));
ixx=0.000691326;
ixy=2.24344e-05;
ixz=2.50508e-06;
iyy=0.00126856;
iyz=-0.000137862;
izz=0.00106487;
linkInertia(:,:,26) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_uleg--------------------------------------------------------------------
linkMass(27) = 9.209;
linkCOM(:,:,27) = Transformations(:,:,28)*transform(0,0,-0.21,0,0,joint_angles(24));
ixx=0.09;
ixy=0;
ixz=0;
iyy=0.09;
iyz=0;
izz=0.02;
linkInertia(:,:,27) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_lleg--------------------------------------------------------------------
linkMass(28) = 5.479;
linkCOM(:,:,28) = Transformations(:,:,29)*transform(0.001,0,-0.187,0,0,joint_angles(25));
ixx=0.077;
ixy=-0;
ixz=-0.003;
iyy=0.076;
iyz=-0;
izz=0.01;
linkInertia(:,:,28) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_talus-------------------------------------------------------------------
linkMass(29) = 0.125;
linkCOM(:,:,29)= Transformations(:,:,30)*transform(0,0,0,0,0,joint_angles(26));
ixx=1.01674e-05;
ixy=0;
ixz=0;
iyy=8.42775e-06;
iyz=0;
izz=1.30101e-05;
linkInertia(:,:,29) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%r_foot--------------------------------------------------------------------
linkMass(30) = 2.05;
linkCOM(:,:,30) = Transformations(:,:,31)*transform(0.027,0,-0.067,0,0,joint_angles(27));
ixx=0.002;
ixy=0;
ixz=0;
iyy=0.007;
iyz=0;
izz=0.008;
linkInertia(:,:,30) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%head----------------------------------------------------------------------
linkMass(31) = 1.47757;
linkCOM(:,:,31)   = Transformations(:,:,33)*transform(-0.0738031,4.84927e-05,0.0299297,0,0,joint_angles(28));
ixx=0.00418873;
ixy=-2.36262e-06;
ixz=-0.00101648;
iyy=-2.36262e-06;
iyz=0.00444693;
izz=-1.85704e-06;
linkInertia(:,:,31) = [ixx,ixy,ixz;ixy,iyy,iyz;ixz,iyz,izz];
%Atlas COM sum of (link mass*link distance from orgin)/(link mass)
X=0;
Y=0;
Z=0;
M=0;
    for i=1:length(linkCOM)
        X = linkMass(i)*linkCOM(1,4,i)+X;
        Y = linkMass(i)*linkCOM(2,4,i)+Y;
        Z = linkMass(i)*linkCOM(3,4,i)+Z;
        M = linkMass(i)+M;
    end
atlasXCOM = X/M;
atlasYCOM = Y/M;
atlasZCOM = Z/M;
end
%Collison Detection********************************************************
%Could be sped up if when the first collision is found stop searching
function inCollision = atlasSelfCollisionDetect(OBB)
inCollision = zeros(1,14);
%Check Left foot for collisions--------------------------------------------
    if collisionDetectionOBB(OBB(1,:),OBB(4,:))%With Right foot
        inCollision(1) = 1;
        inCollision(4) = 1;
    end
    if collisionDetectionOBB(OBB(1,:),OBB(5,:));%With Right lower leg
        inCollision(1) = 1;
        inCollision(5) = 1;
    end
    if collisionDetectionOBB(OBB(1,:),OBB(6,:));%With Right upper leg
        inCollision(1) = 1;
        inCollision(6) = 1;
    end
    %Check Right foot for collisions---------------------------------------
    if collisionDetectionOBB(OBB(4,:),OBB(2,:));%With Left lower leg
        inCollision(4) = 1;
        inCollision(2) = 1;
    end
    if collisionDetectionOBB(OBB(4,:),OBB(3,:));%With Left upper leg
        inCollision(4) = 1;
        inCollision(3) = 1;
    end
    %Check Left lower leg for collisions-----------------------------------
    if collisionDetectionOBB(OBB(2,:),OBB(5,:));%With Right lower leg
        inCollision(2) = 1;
        inCollision(5) = 1;
    end
    if collisionDetectionOBB(OBB(2,:),OBB(6,:));%With Right upper leg
        inCollision(2) = 1;
        inCollision(6) = 1;
    end
    if collisionDetectionOBB(OBB(2,:),OBB(10,:));%With Left lower arm
        inCollision(2) = 1;
        inCollision(10) = 1;
    end
    if collisionDetectionOBB(OBB(2,:),OBB(11,:));%With Left hand
        inCollision(2) = 1;
        inCollision(11) = 1;
    end
    if collisionDetectionOBB(OBB(2,:),OBB(13,:));%With Right lower arm
        inCollision(2) = 1;
        inCollision(13) = 1;
    end
    if collisionDetectionOBB(OBB(2,:),OBB(14,:));%With Right hand
        inCollision(2) = 1;
        inCollision(14) = 1;
    end
    %Check Right lower leg for collisions----------------------------------
    if collisionDetectionOBB(OBB(5,:),OBB(3,:));%With Left upper leg
        inCollision(5) = 1;
        inCollision(3) = 1;
    end
    if collisionDetectionOBB(OBB(5,:),OBB(10,:));%With Left lower arm
        inCollision(5) = 1;
        inCollision(10) = 1;
    end
    if collisionDetectionOBB(OBB(5,:),OBB(11,:));%With Left hand
        inCollision(5) = 1;
        inCollision(11) = 1;
    end
    if collisionDetectionOBB(OBB(5,:),OBB(13,:));%With Right lower arm
        inCollision(5) = 1;
        inCollision(13) = 1;
    end
    if collisionDetectionOBB(OBB(5,:),OBB(14,:));%With Right hand
        inCollision(5) = 1;
        inCollision(14) = 1;
    end
    %Check Left upper leg for collisions-----------------------------------
    if collisionDetectionOBB(OBB(3,:),OBB(6,:));%With Right upper leg
        inCollision(3) = 1;
        inCollision(6) = 1;
    end
    if collisionDetectionOBB(OBB(3,:),OBB(10,:));%With Left lower arm
        inCollision(3) = 1;
        inCollision(10) = 1;
    end
    if collisionDetectionOBB(OBB(3,:),OBB(11,:));%With Left hand
        inCollision(3) = 1;
        inCollision(11) = 1;
    end
    if collisionDetectionOBB(OBB(3,:),OBB(13,:));%With Right lower arm
        inCollision(3) = 1;
        inCollision(13) = 1;
    end
    if collisionDetectionOBB(OBB(3,:),OBB(14,:));%With Right hand
        inCollision(3) = 1;
        inCollision(14) = 1;
    end
    %Check Right upper leg for collisions----------------------------------
    if collisionDetectionOBB(OBB(6,:),OBB(10,:));%With Left lower arm
        inCollision(6) = 1;
        inCollision(10) = 1;
    end
    if collisionDetectionOBB(OBB(6,:),OBB(11,:));%With Left hand
        inCollision(6) = 1;
        inCollision(11) = 1;
    end
    if collisionDetectionOBB(OBB(6,:),OBB(13,:));%With Right lower arm
        inCollision(6) = 1;
        inCollision(13) = 1;
    end
    if collisionDetectionOBB(OBB(6,:),OBB(14,:));%With Right hand
        inCollision(6) = 1;
        inCollision(14) = 1;
    end
    %Check Pelvis for collisions-------------------------------------------
    if collisionDetectionOBB(OBB(7,:),OBB(10,:));%With Left lower arm
        inCollision(7) = 1;
        inCollision(10) = 1;
    end
    if collisionDetectionOBB(OBB(7,:),OBB(11,:));%With Left hand
        inCollision(7) = 1;
        inCollision(11) = 1;
    end
    if collisionDetectionOBB(OBB(7,:),OBB(13,:));%With Right lower arm
        inCollision(7) = 1;
        inCollision(13) = 1;
    end
    if collisionDetectionOBB(OBB(7,:),OBB(14,:));%With Right hand
        inCollision(7) = 1;
        inCollision(14) = 1;
    end
    %Check Torso and pack for collisions-----------------------------------
    if collisionDetectionOBB(OBB(8,:),OBB(10,:));%With Left lower arm
        inCollision(8) = 1;
        inCollision(10) = 1;
    end
    if collisionDetectionOBB(OBB(8,:),OBB(11,:));%With Left hand
        inCollision(8) = 1;
        inCollision(11) = 1;
    end
    if collisionDetectionOBB(OBB(8,:),OBB(13,:));%With Right lower arm
        inCollision(8) = 1;
        inCollision(13) = 1;
    end
    if collisionDetectionOBB(OBB(8,:),OBB(14,:));%With Right hand
        inCollision(8) = 1;
        inCollision(14) = 1;
    end
    %Check Left upper arm for collisions-----------------------------------
    if collisionDetectionOBB(OBB(9,:),OBB(11,:));%With Left hand
        inCollision(9) = 1;
        inCollision(11) = 1;
    end
    %Check Right upper arm for collisions----------------------------------
    if collisionDetectionOBB(OBB(12,:),OBB(14,:));%With Right hand
        inCollision(12) = 1;
        inCollision(14) = 1;
    end
    %Check Left lower arm for collisions-----------------------------------
    if collisionDetectionOBB(OBB(10,:),OBB(13,:));%With Right lower arm
        inCollision(10) = 1;
        inCollision(13) = 1;
    end
    if collisionDetectionOBB(OBB(10,:),OBB(14,:));%With Right hand
        inCollision(10) = 1;
        inCollision(14) = 1;
    end
    %Check Right lower arm for collisions----------------------------------
    if collisionDetectionOBB(OBB(13,:),OBB(11,:));%With Left hand
        inCollision(13) = 1;
        inCollision(11) = 1;
    end
    %Check Left hand for collisions----------------------------------------
    if collisionDetectionOBB(OBB(11,:),OBB(14,:));%With Right hand
        inCollision(11) = 1;
        inCollision(14) = 1;
    end
end
function inCollision = collisionDetectionOBB(BoxA,BoxB)
%Ap - center of box A
%Ax - unit vector along x-axis of box A
%Ay - unit vector along y-axis of box A
%Az - unit vector along z-axis of box A
%Aw - half the width of box A (along A x-axis)
%Ah - half the height of box A (along A y-axis)
%Ad - half the depth of box A (along A z-axis)
Ap = BoxA(4:6);
Ax = BoxA(7:9);
Ay = BoxA(10:12);
Az = BoxA(13:15);
Aw = BoxA(1);
Ah = BoxA(2);
Ad = BoxA(3);
Bp = BoxB(4:6);
Bx = BoxB(7:9);
By = BoxB(10:12);
Bz = BoxB(13:15);
Bw = BoxB(1);
Bh = BoxB(2);
Bd = BoxB(3);
T = Bp-Ap;
Rxx = dot(Ax,Bx);
Rxy = dot(Ax,By);
Rxz = dot(Ax,Bz);
Ryx = dot(Ay,Bx);
Ryy = dot(Ay,By);
Ryz = dot(Ay,Bz);
Rzx = dot(Az,Bx);
Rzy = dot(Az,By);
Rzz = dot(Az,Az);

        %L=Ax
        if abs(dot(T,Ax))>Aw+abs(Bw*Rxx)+abs(Bh*Rxy)+abs(Bd*Rxz)
            inCollision = false; 
            return
        %L = Ay
        elseif abs(dot(T,Ay))>Ah+abs(Bw*Ryx)+abs(Bh*Ryy)+abs(Bd*Ryz)
            inCollision = false; 
            return
        %L=Az
        elseif abs(dot(T,Az))>Ad+abs(Bw*Rzx)+abs(Bh*Rzy)+abs(Bd*Rzz)
            inCollision = false;
            return
        %L=Bx
        elseif abs(dot(T,Bx))>abs(Aw*Rxx)+abs(Ah*Ryx)+abs(Ad*Rzx)+Bw
            inCollision = false; 
            return
        %L=By
        elseif abs(dot(T,By))>abs(Aw*Rxy)+abs(Ah*Ryy)+abs(Ad*Rzy)+Bh
            inCollision = false; 
            return
        %L=Bz
        elseif abs(dot(T,Bz))>abs(Aw*Rxz)+abs(Ah*Ryz)+abs(Ad*Rzz)+Bd
            inCollision = false; 
            return
        %L=Ax x Bx
        elseif abs(dot(T,Az)*Ryx-dot(T,Ay)*Rzx)>abs(Ah*Rzx)+abs(Ad*Ryx)+abs(Bh*Rxz)+abs(Bd*Rxy)
            inCollision = false; 
            return
        %L=Ax x By
        elseif abs(dot(T,Az)*Ryy-dot(T,Ay)*Rzy)>abs(Ah*Rzy)+abs(Ad*Ryy)+abs(Bw*Rxz)+abs(Bd*Rxx)
            inCollision = false; 
            return
        %L=Ax x Bz
        elseif abs(dot(T,Az)*Ryz-dot(T,Ay)*Rzz)>abs(Ah*Rzz)+abs(Ad*Ryz)+abs(Bw*Rxy)+abs(Bh*Rxx)
            inCollision = false; 
            return
        %L=Ay x Bx
        elseif abs(dot(T,Ax)*Rzx-dot(T,Az)*Rxx)>abs(Aw*Rzx)+abs(Ad*Rxx)+abs(Bh*Ryz)+abs(Bd*Ryy)
            inCollision = false; 
            return
        %L=Ay x By
        elseif abs(dot(T,Ax)*Rzy-dot(T,Az)*Rxy)>abs(Aw*Rzy)+abs(Ad*Rxy)+abs(Bw*Ryz)+abs(Bd*Ryx)
            inCollision = false; 
            return
       %L=Ay x Bz 
        elseif abs(dot(T,Ax)*Rzz-dot(T,Az)*Rxz)>abs(Aw*Rzz)+abs(Ad*Rxz)+abs(Bw*Ryy)+abs(Bh*Ryx)
            inCollision = false; 
            return
        %L=Az x Bx
        elseif abs(dot(T,Ay)*Rxx-dot(T,Ax)*Ryx)>abs(Aw*Ryx)+abs(Ah*Ryx)+abs(Bh*Rzz)+abs(Bd*Rzy)
            inCollision = false; 
            return
        %L=Az x By
        elseif abs(dot(T,Ay)*Rxy-dot(T,Ax)*Ryy)>abs(Aw*Ryy)+abs(Ah*Rxy)+abs(Bw*Rzz)+abs(Bd*Rzx)
            inCollision = false; 
            return
        %L=Az x Bz
        elseif abs(dot(T,Ay)*Rxz-dot(T,Ax)*Ryz)>abs(Aw*Ryz)+abs(Ah*Rxz)+abs(Bw*Rzy)+abs(Bh*Rzx)
            inCollision = false; 
            return
        else
            inCollision = true;
        end

end
function [OBB] = collisionBoundingBoxes(Transformations,joint_angles)
leftTrans = [0,0,1,0;0,1,0,0;-1,0,0,0;0,0,0,1];
rightTrans= [0,0,-1,0;0,1,0,0;1,0,0,0;0,0,0,1];
%Left foot*****************************************************************
unitVect = Transformations(:,:,24)*transform(0,0,0,0,0,-joint_angles(21))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[-44;0;44])';
OBB(1,:)= [136,65.5,38,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',-44,0,44];
%Left lower leg
unitVect = Transformations(:,:,22)*transform(0,0,0,0,0,-joint_angles(19))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[0;-25.5;201])';
OBB(2,:)= [62,72,227,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',0,-25.5,201];
% % %Left upper leg
unitVect = Transformations(:,:,21)*transform(0,0,0,0,0,-joint_angles(18))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[-18;16;194.5])';
OBB(3,:)= [104,100,210.5,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',-18,16,194.5];
% % %Right foot**************************************************************
unitVect = Transformations(:,:,31)*transform(0,0,0,0,0,-joint_angles(27))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[-44;0;44])';
OBB(4,:)= [136,65.5,38,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',-44,0,44];
% % %Right lower leg
unitVect = Transformations(:,:,29)*transform(0,0,0,0,0,-joint_angles(25))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[0;-25.5;201])';
OBB(5,:)= [62,72,227,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',0,-25.5,201];
% % %Right upper leg
unitVect = Transformations(:,:,28)*transform(0,0,0,0,0,-joint_angles(24))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[18;16;194.5])';
OBB(6,:)= [104,100,210.5,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',18,16,194.5];
% % %Pelvis******************************************************************
unitVect = Transformations(:,:,1);
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[8;0;-10])';
OBB(7,:)= [170,192,140,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',8,0,-10];
% % %Torso and pack
unitVect = Transformations(:,:,3)*transform(0,0,0,0,0,-joint_angles(3));
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[364;5;-40])';
OBB(8,:)= [373.5,238,304,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',364,5,-40];
% % %Left upper arm**********************************************************
unitVect = Transformations(:,:,6)*transform(0,0,0,0,0,-joint_angles(5)-1.0472)*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[0;129;-10])';
OBB(9,:)= [78,156,56,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',0,129,-10];
% % %Left lower arm
unitVect = Transformations(:,:,8)*transform(0,0,0,0,0,-joint_angles(7))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[0;156;0])';
OBB(10,:)= [78,150,56,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',0,156,0];
% % %Left hand
unitVect = Transformations(:,:,10)*transform(0,0,0,0,0,-joint_angles(9))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[0;66;0])';
OBB(11,:)= [78,64,56,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',0,66,0];
% % %Right upper arm*********************************************************
unitVect = Transformations(:,:,13)*transform(0,0,0,0,0,joint_angles(11)-1.0472)*rightTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[0;129;10])';
OBB(12,:)= [78,156,56,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',0,129,10];
% % %Right lower arm
unitVect = Transformations(:,:,15)*transform(0,0,0,0,0,joint_angles(13))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[0;154;0])';
OBB(13,:)= [78,152,56,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',0,154,0];
% % %Right hand
unitVect = Transformations(:,:,17)*transform(0,0,0,0,0,joint_angles(15))*leftTrans;
P = unitVect(1:3,4)'+(unitVect(1:3,1:3)*[0;66;0])';
OBB(14,:)= [78,64,56,P,unitVect(1:3,1)',unitVect(1:3,2)',unitVect(1:3,3)',0,66,0];
end
%Patching Functions********************************************************
function []=patchAtlasBack(TP0,T01,T02,q,color)
q(3) = -q(3);
%Read in STL files---------------------------------------------------------
pelvis = stlread('pelvis.STL');
mtorso = stlread('m_torso.STL');
utorso = stlread('utorso_n_pack.STL');
%Given Configuration-------------------------------------------------------
pelvis1 = transformSTL(pelvis.faces,pelvis.vertices,TP0);
mtorso1 = transformSTL(mtorso.faces,mtorso.vertices,T01*transform(0,0,0,0,0,q(2)));
utorso1 = transformSTL(utorso.faces,utorso.vertices,T02*transform(0,0,0,0,0,q(3)));
%plot stls-----------------------------------------------------------------
plotSTL(pelvis1.faces,pelvis1.vertices,color(1),[0 0 0])
plotSTL(mtorso1.faces,mtorso1.vertices,color(2),[0 0 0])
plotSTL(utorso1.faces,utorso1.vertices,color(3),[0 0 0])
title('Atlas')
end
function []=patchAtlasArm(TG0,T01,T02,T03,T04,T05,q,arm,color)
%Read in STL files---------------------------------------------------------
if isequal('left',arm)
    clav = stlread('l_clav.STL');
    q(2) = -q(2);
    q(4) = -q(4);
    q(6) = -q(6);
else
    clav = stlread('r_clav.STL');
    q(1) = -q(1);
    q(3) = -q(3);
end
scap = stlread('sh_rx.STL');
uarm = stlread('elbow_ry.STL');
larm = stlread('elbow_rx.STL');
farm = stlread('farm.STL');
hand = stlread('hand.STL');
%Given Configuration-------------------------------------------------------
clav1 = transformSTL(clav.faces,clav.vertices,TG0*transform(0,0,0,0,0,q(1)));
scap1 = transformSTL(scap.faces,scap.vertices,T01*transform(0,0,0,0,0,q(2)-0.5236));
uarm1 = transformSTL(uarm.faces,uarm.vertices,T02*transform(0,0,0,0,0,q(3)+pi/2));
larm1 = transformSTL(larm.faces,larm.vertices,T03*transform(0,0,0,0,0,q(4)));
farm1 = transformSTL(farm.faces,farm.vertices,T04*transform(0,0, 0,0,0,q(5)));
hand1 = transformSTL(hand.faces,hand.vertices,T05*transform(0,0,0,0,0,q(6)));
%plot stls-----------------------------------------------------------------
plotSTL(clav1.faces,clav1.vertices,color(1),[0 0 0])
plotSTL(scap1.faces,scap1.vertices,color(2),[0 0 0])
plotSTL(uarm1.faces,uarm1.vertices,color(3),[0 0 0])
plotSTL(larm1.faces,larm1.vertices,color(4),[0 0 0])
plotSTL(farm1.faces,farm1.vertices,color(5),[0 0 0])
plotSTL(hand1.faces,hand1.vertices,color(6),[0 0 0])
title('Atlas')
end
function []=patchAtlasLeg(TG0,T01,T02,T03,T04,T05,q,leg,color)
q(3) = -q(3);
q(4) = -q(4);
q(6) = -q(6);
%Read in STL files---------------------------------------------------------
uglut = stlread('uglut.STL');
if isequal('left',leg)
    lglut = stlread('l_lglut.STL');
    uleg = stlread('l_uleg.STL');
else
    lglut = stlread('r_lglut.STL');
    uleg = stlread('r_uleg.STL');
end
lleg = stlread('lleg.STL');
talus = stlread('talus.STL');
foot = stlread('foot.STL');
%Given Configuration-------------------------------------------------------
uglut1 = transformSTL(uglut.faces,uglut.vertices,TG0*transform(0,0,0,0,0,q(1)));
lglut1 = transformSTL(lglut.faces,lglut.vertices,T01*transform(0,0,0,0,0,q(2)));
uleg1 = transformSTL(uleg.faces,uleg.vertices,T02*transform(0,0,0,0,0,q(3)));
lleg1 = transformSTL(lleg.faces,lleg.vertices,T03*transform(0,0,0,0,0,q(4)));
talus1 = transformSTL(talus.faces,talus.vertices,T04*transform(0,0,0,0,0,q(5)));
foot1 = transformSTL(foot.faces,foot.vertices,T05*transform(0,0,0,0,0,q(6)));
%plot stls-----------------------------------------------------------------
plotSTL(uglut1.faces,uglut1.vertices,color(1),[0 0 0])
plotSTL(lglut1.faces,lglut1.vertices,color(2),[0 0 0])
plotSTL(uleg1.faces,uleg1.vertices,color(3),[0 0 0])
plotSTL(lleg1.faces,lleg1.vertices,color(4),[0 0 0])
plotSTL(talus1.faces,talus1.vertices,color(5),[0 0 0])
plotSTL(foot1.faces,foot1.vertices,color(6),[0 0 0])
title('Atlas')
end
function []=patchAtlasHead(headOrigin,q,color)
q(1) = -q(1);
%Read in STL files---------------------------------------------------------
head = stlread('head_test.STL');
%Given Configuration-------------------------------------------------------
head1 = transformSTL(head.faces,head.vertices,headOrigin*transform(0,0,0,0,0,q(1)));
%plot stls-----------------------------------------------------------------
plotSTL(head1.faces,head1.vertices,color,[0 0 0])
title('Atlas')
end
function [stable]=plotCOM(LLT06,RLT06,atlasXCOM,atlasYCOM)
global RLinContact LLinContact
X = [32,64,64,42,-42,-64,-64,-32];
Y = [131.5,69.5,-107.5,-131.5,-131.5,-107.5,69.5,131.5];
%Right Leg
XYRL = RLT06(1:2,2:3)*[X;Y];
XRL = XYRL(1,:)+RLT06(1,4)+[1,0]*RLT06(1:2,2:3)*[0;48.5];%[48.5;0];
YRL = XYRL(2,:)+RLT06(2,4)-[1,0]*RLT06(1:2,2:3)*[48.5;0];%[0;48.5];
%Left Leg
XYLL = LLT06(1:2,2:3)*[X;Y];
XLL = XYLL(1,:)+LLT06(1,4)+[1,0]*LLT06(1:2,2:3)*[0;48.5];%[48.5;0];
YLL = XYLL(2,:)+LLT06(2,4)-[1,0]*LLT06(1:2,2:3)*[48.5;0];%[0;48.5];
%Plot feet and support polygon
if ((RLinContact==1) && (LLinContact==1))
    fill(XRL,YRL,'b')
    hold all
    fill(XLL,YLL,'b')
    scatter(RLT06(1,4),RLT06(2,4),'o','r')
    scatter(LLT06(1,4),LLT06(2,4),'o','r')
    Xp = [XRL(1),XRL(8),XRL(7),XRL(6),XRL(5),XRL(4),XLL(5),XLL(4),XLL(3),XLL(2),XLL(1),XLL(8),XRL(1)];
    Yp = [YRL(1),YRL(8),YRL(7),YRL(6),YRL(5),YRL(4),YLL(5),YLL(4),YLL(3),YLL(2),YLL(1),YLL(8),YRL(1)];    
elseif (RLinContact==1)
    fill(XRL,YRL,'b')
    hold all
    scatter(RLT06(1,4),RLT06(2,4),'o','r')
    Xp = XRL;
    Yp = YRL;
elseif (LLinContact==1)
    fill(XLL,YLL,'b')
    hold all
    scatter(LLT06(1,4),LLT06(2,4),'o','r')
    Xp = XLL;
    Yp = YLL;
else
    Xp = 0;
    Yp = 0;
end
plot(Xp,Yp,'r','LineWidth',2);
%Plot COM
ang=0:0.01:2*pi; 
[Xaxis] = get(gca,'XLim');
[Yaxis] = get(gca,'YLim');
r = max([(Xaxis(2)-Xaxis(1)),(Yaxis(2)-Yaxis(1))])*0.05;
xp=r*cos(ang);
yp=r*sin(ang);
if inpolygon(atlasXCOM+xp,atlasYCOM+yp,Xp,Yp)
    fill(atlasXCOM+xp,atlasYCOM+yp,'g')
    stable = 1;
else
    fill(atlasXCOM+xp,atlasYCOM+yp,'r')
    stable = 0;
end
axis equal
grid on
view([90,90])
end
function []=patchAtlasCollisionBoxes(OBB,Transformations,joint_angles,color)
        %Left Leg
        patchCube(OBB(1,:),Transformations(:,:,24),-joint_angles(21),'left',color(1))
        patchCube(OBB(2,:),Transformations(:,:,22),-joint_angles(19),'left',color(2))
        patchCube(OBB(3,:),Transformations(:,:,21),-joint_angles(18),'left',color(3))
        %Right Leg
        patchCube(OBB(4,:),Transformations(:,:,31),-joint_angles(27),'left',color(4))
        patchCube(OBB(5,:),Transformations(:,:,29),-joint_angles(25),'left',color(5))
        patchCube(OBB(6,:),Transformations(:,:,28),-joint_angles(24),'left',color(6))
        %pelvis
        patchCube(OBB(7,:),Transformations(:,:,1),0,'center',color(7))
        %Torso and pack
        patchCube(OBB(8,:),Transformations(:,:,3),-joint_angles(3),'center',color(8))
        %Left Arm
        patchCube(OBB(9,:),Transformations(:,:,6),-joint_angles(5)+1.0472,'left',color(9))
        patchCube(OBB(10,:),Transformations(:,:,8),-joint_angles(7),'left',color(10))
        patchCube(OBB(11,:),Transformations(:,:,10),-joint_angles(9),'left',color(11))
        %Right Arm
        patchCube(OBB(12,:),Transformations(:,:,13),joint_angles(11)+1.0472,'right',color(12))
        patchCube(OBB(13,:),Transformations(:,:,15),joint_angles(13),'left',color(13))
        patchCube(OBB(14,:),Transformations(:,:,17),joint_angles(15),'left',color(14))

end
%Patching Helper functions*************************************************
%patchCube-----------------------------------------------------------------
function [] = patchCube(OBB,Transformations,joint_angles,side,color)
angle = transform(0,0,0,0,0,joint_angles);
if isequal(side,'left')
    transforms = Transformations*angle*[0,0,1,0;0,1,0,0;-1,0,0,0;0,0,0,1];
elseif isequal(side,'right')
    transforms = Transformations*angle*[0,0,-1,0;0,1,0,0;1,0,0,0;0,0,0,1];
else
    transforms = Transformations*angle;
end
W = OBB(1);
H = OBB(2);
D = OBB(3);
V = [-W,-H,-D;W,-H,-D;W,-H,D;-W,-H,D;-W,H,-D;W,H,-D;W,H,D;-W,H,D];
 for i=1:8
    V(i,:)=V(i,:)*transforms(1:3,1:3)';
    V(i,:)=V(i,:)+transforms(1:3,4)'+(transforms(1:3,1:3)*[OBB(16);OBB(17);OBB(18)])';
 end
 F = [1,2,3,4;1,2,6,5;2,3,7,6;1,4,8,5;3,4,8,7;5,6,7,8];
patch('Vertices',V,'Faces',F,'FaceColor',color,'FaceAlpha',0.8)
end
%plotSTL-------------------------------------------------------------------
function [] = plotSTL(faces,vertices,faceColor,edgeColor)
STL = struct('faces',faces,'vertices',vertices);
patch(STL,'FaceColor',faceColor,'EdgeColor',edgeColor,'FaceLighting','gouraud','AmbientStrength',0.15,'EraseMode','normal');
grid on   
camlight('headlight');
material('dull');
axis('image');
end
%stlread-------------------------------------------------------------------
function varargout = stlread(file)
% STLREAD imports geometry from an STL file into MATLAB.
%    FV = STLREAD(FILENAME) imports triangular faces from the ASCII or binary
%    STL file idicated by FILENAME, and returns the patch struct FV, with fields
%    'faces' and 'vertices'.
%
%    [F,V] = STLREAD(FILENAME) returns the faces F and vertices V separately.
%
%    [F,V,N] = STLREAD(FILENAME) also returns the face normal vectors.
%
%    The faces and vertices are arranged in the format used by the PATCH plot
%    object.

% Copyright 2011 The MathWorks, Inc.

    if ~exist(file,'file')
        error(['File ''%s'' not found. If the file is not on MATLAB''s path' ...
               ', be sure to specify the full path to the file.'], file);
    end
    
    fid = fopen(file,'r');    
    if ~isempty(ferror(fid))
        error(lasterror); %#ok
    end
    
    M = fread(fid,inf,'uint8=>uint8');
    fclose(fid);
    
    [f,v,n] = stlbinary(M);
    %if( isbinary(M) ) % This may not be a reliable test
    %    [f,v,n] = stlbinary(M);
    %else
    %    [f,v,n] = stlascii(M);
    %end
    
    varargout = cell(1,nargout);
    switch nargout        
        case 2
            varargout{1} = f;
            varargout{2} = v;
        case 3
            varargout{1} = f;
            varargout{2} = v;
            varargout{3} = n;
        otherwise
            varargout{1} = struct('faces',f,'vertices',v);
    end

end
%stlread helper functions--------------------------------------------------
function [F,V,N] = stlbinary(M)

    F = [];
    V = [];
    N = [];
    
    if length(M) < 84
        error('MATLAB:stlread:incorrectFormat', ...
              'Incomplete header information in binary STL file.');
    end
    
    % Bytes 81-84 are an unsigned 32-bit integer specifying the number of faces
    % that follow.
    numFaces = typecast(M(81:84),'uint32');
    %numFaces = double(numFaces);
    if numFaces == 0
        warning('MATLAB:stlread:nodata','No data in STL file.');
        return
    end
    
    T = M(85:end);
    F = NaN(numFaces,3);
    V = NaN(3*numFaces,3);
    N = NaN(numFaces,3);
    
    numRead = 0;
    while numRead < numFaces
        % Each facet is 50 bytes
        %  - Three single precision values specifying the face normal vector
        %  - Three single precision values specifying the first vertex (XYZ)
        %  - Three single precision values specifying the second vertex (XYZ)
        %  - Three single precision values specifying the third vertex (XYZ)
        %  - Two unused bytes
        i1    = 50 * numRead + 1;
        i2    = i1 + 50 - 1;
        facet = T(i1:i2)';
        
        n  = typecast(facet(1:12),'single');
        v1 = typecast(facet(13:24),'single');
        v2 = typecast(facet(25:36),'single');
        v3 = typecast(facet(37:48),'single');
        
        n = double(n);
        v = double([v1; v2; v3]);
        
        % Figure out where to fit these new vertices, and the face, in the
        % larger F and V collections.        
        fInd  = numRead + 1;        
        vInd1 = 3 * (fInd - 1) + 1;
        vInd2 = vInd1 + 3 - 1;
        
        V(vInd1:vInd2,:) = v;
        F(fInd,:)        = vInd1:vInd2;
        N(fInd,:)        = n;
        
        numRead = numRead + 1;
    end
    
end
%transform-----------------------------------------------------------------
function [Transform] = transform(x,y,z,rx,ry,rz)

    Transform = angle2dcm(rx,ry,rz,'xyz');
    Transform(1,4) = x;
    Transform(2,4) = y;
    Transform(3,4) = z;
    Transform(4,4) = 1;
    
end
%transformSTL--------------------------------------------------------------
function [after] = transformSTL(Bfaces,Bvertices,transform)
    Avertices = zeros(length(Bvertices),3);
    for i=1:length(Bvertices)
       Avertices(i,:) = (transform(1:3,1:3)*Bvertices(i,:)'+transform(1:3,4))';
    end
    after = struct('faces',Bfaces,'vertices',Avertices);
end
%compare-------------------------------------------------------------------
function [equal] = compare(n1,n2,n_dcp)
    if (round(n1*10^n_dcp)==round(n2*10^n_dcp))
        equal = 1;
    else
        equal = 0;
    end
end
%dcm2angle-----------------------------------------------------------------
function [r1,r2,r3] = dcm2angle( dcm, varargin )
%  DCM2ANGLE Create rotation angles from direction cosine matrix.
%   [R1 R2 R3]  = DCM2ANGLE( N ) calculates the set of rotation angles,
%   R1, R2, R3, for a given direction cosine matrix, N.   N is a 3-by-3-by-M
%   matrix containing M orthogonal direction cosine matrices. R1 returns 
%   an M array of  first rotation angles.  R2 returns an M array of second
%   rotation angles.  R3 returns an M array of third rotation angles.
%   Rotation angles are output in radians.  
%
%   [R1 R2 R3] = DCM2ANGLE( N, S ) calculates the set of rotation
%   angles, R1, R2, R3, for a given direction cosine matrix, N, and a
%   specified rotation sequence, S. 
%
%   The default rotation sequence is 'ZYX' where the order of rotation
%   angles for the default rotation are R1 = Z Axis Rotation, R2 = Y Axis
%   Rotation, and R3 = X Axis Rotation. 
%
%   All rotation sequences, S, are supported: 'ZYX', 'ZYZ', 'ZXY', 'ZXZ',
%   'YXZ', 'YXY', 'YZX', 'YZY', 'XYZ', 'XYX', 'XZY', and 'XZX'.
%
%   [R1 R2 R3] = DCM2ANGLE( N, S, LIM ) calculates the set of rotation
%   angles, R1, R2, R3, for a given direction cosine matrix, N, a specified
%   rotation sequence, S, and a specified angle constraint, LIM.  LIM
%   is a string specifying either 'Default' or 'ZeroR3'. See the Limitations
%   section for full definitions of angle constraints. 
%
%   Limitations:
%
%   In general, the R1 and R3 angles lie between +/- 180 degrees and R2
%   lies either between +/- 90 degrees or between 0 and 180 degrees.  For
%   more information see the documentation. 
%
%   Examples:
%
%   Determine the rotation angles from direction cosine matrix:
%      dcm = [1 0 0; 0 1 0; 0 0 1];
%      [yaw, pitch, roll] = dcm2angle( dcm )
%
%   Determine the rotation angles from multiple direction cosine matrices:
%      dcm        = [ 1 0 0; 0 1 0; 0 0 1]; 
%      dcm(:,:,2) = [ 0.85253103550038   0.47703040785184  -0.21361840626067; ...
%                    -0.43212157513194   0.87319830445628   0.22537893734811; ...
%                     0.29404383655186  -0.09983341664683   0.95056378592206];
%      [pitch, roll, yaw] = dcm2angle( dcm, 'YXZ' )
%
%   See also ANGLE2DCM, DCM2QUAT, QUAT2DCM, QUAT2ANGLE.

%   Copyright 2000-2007 The MathWorks, Inc.
%   $Revision: 1.1.6.6 $  $Date: 2007/11/07 18:12:45 $

%   Limitations: 
%   The 'Default' limitations for the 'ZYX', 'ZXY', 'YXZ', 'YZX', 'XYZ',
%   and 'XZY' implementations generate an R2 angle that lies between +/- 90
%   degrees, and R1 and R3 angles that lie between +/- 180 degrees. 
%
%   The 'Default' limitations for the 'ZYZ', 'ZXZ', 'YXY', 'YZY', 'XYX',
%   and 'XZX' implementations generate an R2 angle that lies between 0 and
%   180 degrees, and R1 and R3 angles that lie between +/- 180 degrees. 
%
%   The 'ZeroR3' limitations for the 'ZYX', 'ZXY', 'YXZ', 'YZX', 'XYZ',
%   and 'XZY' implementations generate an R2 angle that lies between +/- 90
%   degrees, and R1 and R3 angles that lie between +/- 180 degrees.
%   However, when R2 is +/- 90 degrees, R3 is set to 0 degrees.
%
%   The 'ZeroR3' limitations for the 'ZYZ', 'ZXZ', 'YXY', 'YZY', 'XYX',
%   and 'XZX' implementations generate an R2 angle that lies between 0 and 180
%   degrees, and R1 and R3 angles that lie between +/- 180 degrees.
%   However, when R2 is 0 or +/- 180 degrees, R3 is set to 0 degrees.

error(nargchk(1, 3, nargin,'struct'));

if any(~isreal(dcm) || ~isnumeric(dcm))
    error('aero:dcm2angle:isnotreal', 'Input elements are not real numbers.');
end

if ((size(dcm,1) ~= 3) || (size(dcm,2) ~= 3))
    error('aero:dcm2angle:wrongdim','Input dimension is not 3-by-3-by-M.');
end

lim = 'default';

if nargin == 1
    type = 'zyx';
else
    if ischar( varargin{1} )
        type = varargin{1};
    else
        error('aero:dcm2angle:notchar','Rotation sequence is not a string.');
    end
    if nargin == 3
        if ischar( varargin{2} )
            lim = varargin{2};
        else
            error('aero:dcm2angle:notchar1','Angle constraint is not a string.');
        end
    end
end

switch lower( type )
    case 'zyx'
        %     [          cy*cz,          cy*sz,            -sy]
        %     [ sy*sx*cz-sz*cx, sy*sx*sz+cz*cx,          cy*sx]
        %     [ sy*cx*cz+sz*sx, sy*cx*sz-cz*sx,          cy*cx]

        [r1 r2 r3] = threeaxisrot( dcm(1,2,:), dcm(1,1,:), -dcm(1,3,:), ...
                                   dcm(2,3,:), dcm(3,3,:), ...
                                  -dcm(2,1,:), dcm(2,2,:));

    case 'zyz'
        %     [  cz2*cy*cz-sz2*sz,  cz2*cy*sz+sz2*cz,           -cz2*sy]
        %     [ -sz2*cy*cz-cz2*sz, -sz2*cy*sz+cz2*cz,            sz2*sy]
        %     [             sy*cz,             sy*sz,                cy]
        
        [r1 r2 r3] = twoaxisrot( dcm(3,2,:), dcm(3,1,:), dcm(3,3,:), ...
                                 dcm(2,3,:), -dcm(1,3,:), ...
                                -dcm(2,1,:), dcm(2,2,:));
                
    case 'zxy'
        %     [ cy*cz-sy*sx*sz, cy*sz+sy*sx*cz,         -sy*cx]
        %     [         -sz*cx,          cz*cx,             sx]
        %     [ sy*cz+cy*sx*sz, sy*sz-cy*sx*cz,          cy*cx]

        [r1 r2 r3] = threeaxisrot( -dcm(2,1,:), dcm(2,2,:), dcm(2,3,:), ...
                                   -dcm(1,3,:), dcm(3,3,:), ...
                                    dcm(1,2,:), dcm(1,1,:));

    case 'zxz'
        %     [  cz2*cz-sz2*cx*sz,  cz2*sz+sz2*cx*cz,            sz2*sx]
        %     [ -sz2*cz-cz2*cx*sz, -sz2*sz+cz2*cx*cz,            cz2*sx]
        %     [             sz*sx,            -cz*sx,                cx]

        [r1 r2 r3] = twoaxisrot( dcm(3,1,:), -dcm(3,2,:), dcm(3,3,:), ...
                                 dcm(1,3,:), dcm(2,3,:), ...
                                 dcm(1,2,:), dcm(1,1,:));

    case 'yxz'
        %     [  cy*cz+sy*sx*sz,           sz*cx, -sy*cz+cy*sx*sz]
        %     [ -cy*sz+sy*sx*cz,           cz*cx,  sy*sz+cy*sx*cz]
        %     [           sy*cx,             -sx,           cy*cx]

        [r1 r2 r3] = threeaxisrot( dcm(3,1,:), dcm(3,3,:), -dcm(3,2,:), ...
                                   dcm(1,2,:), dcm(2,2,:), ...
                                  -dcm(1,3,:), dcm(1,1,:));
       
    case 'yxy'
        %     [  cy2*cy-sy2*cx*sy,            sy2*sx, -cy2*sy-sy2*cx*cy]
        %     [             sy*sx,                cx,             cy*sx]
        %     [  sy2*cy+cy2*cx*sy,           -cy2*sx, -sy2*sy+cy2*cx*cy]
     
        [r1 r2 r3] = twoaxisrot( dcm(2,1,:), dcm(2,3,:), dcm(2,2,:), ...
                                 dcm(1,2,:), -dcm(3,2,:), ...
                                -dcm(1,3,:), dcm(1,1,:));
      
    case 'yzx'
        %     [           cy*cz,              sz,          -sy*cz]
        %     [ -sz*cx*cy+sy*sx,           cz*cx,  sy*cx*sz+cy*sx]
        %     [  cy*sx*sz+sy*cx,          -cz*sx, -sy*sx*sz+cy*cx]
        
        [r1 r2 r3] = threeaxisrot( -dcm(1,3,:), dcm(1,1,:), dcm(1,2,:), ...
                                   -dcm(3,2,:), dcm(2,2,:), ...
                                    dcm(3,1,:), dcm(3,3,:));
        
    case 'yzy'
        %     [  cy2*cz*cy-sy2*sy,            cy2*sz, -cy2*cz*sy-sy2*cy]
        %     [            -cy*sz,                cz,             sy*sz]
        %     [  sy2*cz*cy+cy2*sy,            sy2*sz, -sy2*cz*sy+cy2*cy]

        [r1 r2 r3] = twoaxisrot( dcm(2,3,:), -dcm(2,1,:), dcm(2,2,:), ...
                                 dcm(3,2,:), dcm(1,2,:), ...
                                 dcm(3,1,:), dcm(3,3,:));

    case 'xyz'
        %     [          cy*cz, sz*cx+sy*sx*cz, sz*sx-sy*cx*cz]
        %     [         -cy*sz, cz*cx-sy*sx*sz, cz*sx+sy*cx*sz]
        %     [             sy,         -cy*sx,          cy*cx]

        [r1 r2 r3] = threeaxisrot( -dcm(3,2,:), dcm(3,3,:), dcm(3,1,:), ...
                                   -dcm(2,1,:), dcm(1,1,:), ...
                                    dcm(2,3,:), dcm(2,2,:));
        
    case 'xyx'
        %     [                cy,             sy*sx,            -sy*cx]
        %     [            sx2*sy,  cx2*cx-sx2*cy*sx,  cx2*sx+sx2*cy*cx]
        %     [            cx2*sy, -sx2*cx-cx2*cy*sx, -sx2*sx+cx2*cy*cx]

        [r1 r2 r3] = twoaxisrot( dcm(1,2,:), -dcm(1,3,:), dcm(1,1,:), ...
                                 dcm(2,1,:), dcm(3,1,:), ...
                                 dcm(2,3,:), dcm(2,2,:));
        
    case 'xzy'
        %     [          cy*cz, sz*cx*cy+sy*sx, cy*sx*sz-sy*cx]
        %     [            -sz,          cz*cx,          cz*sx]
        %     [          sy*cz, sy*cx*sz-cy*sx, sy*sx*sz+cy*cx]

        [r1 r2 r3] = threeaxisrot( dcm(2,3,:), dcm(2,2,:), -dcm(2,1,:), ...
                                   dcm(3,1,:), dcm(1,1,:), ...
                                  -dcm(3,2,:), dcm(3,3,:));
        
    case 'xzx'
        %     [                cz,             sz*cx,             sz*sx]
        %     [           -cx2*sz,  cx2*cz*cx-sx2*sx,  cx2*cz*sx+sx2*cx]
        %     [            sx2*sz, -sx2*cz*cx-cx2*sx, -sx2*cz*sx+cx2*cx]

        [r1 r2 r3] = twoaxisrot( dcm(1,3,:), dcm(1,2,:), dcm(1,1,:), ...
                                 dcm(3,1,:), -dcm(2,1,:), ...
                                -dcm(3,2,:), dcm(3,3,:));

    otherwise
        error('aero:dcm2angle:unknownrotation', ...
                                    'Unknown rotation sequence, %s', type);
end

r1 = r1(:);
r2 = r2(:);
r3 = r3(:);

    function [r1 r2 r3] = threeaxisrot(r11, r12, r21, r31, r32, r11a, r12a)
        % find angles for rotations about X, Y, and Z axes
        r1 = atan2( r11, r12 );
        r2 = asin( r21 );
        r3 = atan2( r31, r32 );
        if strcmpi( lim, 'zeror3')
            for i = find(abs( r21 ) >= 1.0)
                r1(i) = atan2( r11a(i), r12a(i) );
                r2(i) = asin( r21(i) );
                r3(i) = 0;
            end
        end
    end

    function [r1 r2 r3] = twoaxisrot(r11, r12, r21, r31, r32, r11a, r12a)
        r1 = atan2( r11, r12 );
        r2 = acos( r21 );
        r3 = atan2( r31, r32 );
        if strcmpi( lim, 'zeror3')
            for i = find(abs( r21 ) >= 1.0)
                r1(i) = atan2( r11a(i), r12a(i) );
                r2(i) = acos( r21(i) );
                r3(i) = 0;
            end
        end
    end
end
%angle2dcm-----------------------------------------------------------------
function dcm = angle2dcm( r1, r2, r3, varargin )
%  ANGLE2DCM Create direction cosine matrix from rotation angles.
%   N = ANGLE2DCM( R1, R2, R3 ) calculates the direction cosine matrix, N,
%   for a given set of rotation angles, R1, R2, R3.   R1 is an M array of
%   first rotation angles.  R2 is an M array of second rotation angles.  R3
%   is an M array of third rotation angles.  N returns an 3-by-3-by-M
%   matrix containing M direction cosine matrices.  Rotation angles are
%   input in radians.  
%
%   N = ANGLE2DCM( R1, R2, R3, S ) calculates the direction cosine matrix,
%   N, for a given set of rotation angles, R1, R2, R3, and a specified
%   rotation sequence, S. 
%
%   The default rotation sequence is 'ZYX' where the order of rotation
%   angles for the default rotation are R1 = Z Axis Rotation, R2 = Y Axis
%   Rotation, and R3 = X Axis Rotation. 
%
%   All rotation sequences, S, are supported: 'ZYX', 'ZYZ', 'ZXY', 'ZXZ',
%   'YXZ', 'YXY', 'YZX', 'YZY', 'XYZ', 'XYX', 'XZY', and 'XZX'.
%
%   Examples:
%
%   Determine the direction cosine matrix from rotation angles:
%      yaw = 0.7854; 
%      pitch = 0.1; 
%      roll = 0;
%      dcm = angle2dcm( yaw, pitch, roll )
%
%   Determine the direction cosine matrix from multiple rotation angles:
%      yaw = [0.7854 0.5]; 
%      pitch = [0.1 0.3]; 
%      roll = [0 0.1];
%      dcm = angle2dcm( pitch, roll, yaw, 'YXZ' )
%
%   See also DCM2ANGLE, DCM2QUAT, QUAT2DCM, QUAT2ANGLE.

%   Copyright 2000-2007 The MathWorks, Inc.
%   $Revision: 1.1.6.5 $  $Date: 2007/08/15 17:16:07 $

error(nargchk(3, 4, nargin,'struct'));

if any(~isreal(r1) || ~isnumeric(r1))
    error('aero:angle2dcm:isnotreal1','First input element is not a real number.');
end

if any(~isreal(r2) || ~isnumeric(r2))
    error('aero:angle2dcm:isnotreal2','Second input element is not a real number.');
end

if any(~isreal(r3) || ~isnumeric(r3))
    error('aero:angle2dcm:isnotreal3','Third input element is not a real number.');
end

if (length(r1) ~= length(r2)) || (length(r1) ~= length(r3))
    error('aero:angle2dcm:wrongdim','Rotations are not all arrays of M.');
end

if nargin == 3
    type = 'zyx';
else
    if ischar( varargin{1} )
        type = varargin{1};
    else
        error('aero:angle2dcm:notchar','Rotation sequence is not a string.');
    end
end

angles = [r1(:) r2(:) r3(:)];

dcm = zeros(3,3,size(angles,1));
cang = cos( angles );
sang = sin( angles );

switch lower( type )
    case 'zyx'
        %     [          cy*cz,          cy*sz,            -sy]
        %     [ sy*sx*cz-sz*cx, sy*sx*sz+cz*cx,          cy*sx]
        %     [ sy*cx*cz+sz*sx, sy*cx*sz-cz*sx,          cy*cx]

        dcm(1,1,:) = cang(:,2).*cang(:,1);
        dcm(1,2,:) = cang(:,2).*sang(:,1);
        dcm(1,3,:) = -sang(:,2);
        dcm(2,1,:) = sang(:,3).*sang(:,2).*cang(:,1) - cang(:,3).*sang(:,1);
        dcm(2,2,:) = sang(:,3).*sang(:,2).*sang(:,1) + cang(:,3).*cang(:,1);
        dcm(2,3,:) = sang(:,3).*cang(:,2);
        dcm(3,1,:) = cang(:,3).*sang(:,2).*cang(:,1) + sang(:,3).*sang(:,1);
        dcm(3,2,:) = cang(:,3).*sang(:,2).*sang(:,1) - sang(:,3).*cang(:,1);
        dcm(3,3,:) = cang(:,3).*cang(:,2);

    case 'zyz'
        %     [  cz2*cy*cz-sz2*sz,  cz2*cy*sz+sz2*cz,           -cz2*sy]
        %     [ -sz2*cy*cz-cz2*sz, -sz2*cy*sz+cz2*cz,            sz2*sy]
        %     [             sy*cz,             sy*sz,                cy]
        
        dcm(1,1,:) = cang(:,1).*cang(:,3).*cang(:,2) - sang(:,1).*sang(:,3);
        dcm(1,2,:) = sang(:,1).*cang(:,3).*cang(:,2) + cang(:,1).*sang(:,3);
        dcm(1,3,:) = -sang(:,2).*cang(:,3);  
        dcm(2,1,:) = -cang(:,1).*cang(:,2).*sang(:,3) - sang(:,1).*cang(:,3);                
        dcm(2,2,:) = -sang(:,1).*cang(:,2).*sang(:,3) + cang(:,1).*cang(:,3);
        dcm(2,3,:) = sang(:,2).*sang(:,3);     
        dcm(3,1,:) = cang(:,1).*sang(:,2);
        dcm(3,2,:) = sang(:,1).*sang(:,2);  
        dcm(3,3,:) = cang(:,2);
                
    case 'zxy'
        %     [ cy*cz-sy*sx*sz, cy*sz+sy*sx*cz,         -sy*cx]
        %     [         -sz*cx,          cz*cx,             sx]
        %     [ sy*cz+cy*sx*sz, sy*sz-cy*sx*cz,          cy*cx]

        dcm(1,1,:) = cang(:,3).*cang(:,1) - sang(:,2).*sang(:,3).*sang(:,1);
        dcm(1,2,:) = cang(:,3).*sang(:,1) + sang(:,2).*sang(:,3).*cang(:,1);
        dcm(1,3,:) = -sang(:,3).*cang(:,2);
        dcm(2,1,:) = -cang(:,2).*sang(:,1);
        dcm(2,2,:) = cang(:,2).*cang(:,1);
        dcm(2,3,:) = sang(:,2);
        dcm(3,1,:) = sang(:,3).*cang(:,1) + sang(:,2).*cang(:,3).*sang(:,1);
        dcm(3,2,:) = sang(:,3).*sang(:,1) - sang(:,2).*cang(:,3).*cang(:,1);
        dcm(3,3,:) = cang(:,2).*cang(:,3);

    case 'zxz'
        %     [  cz2*cz-sz2*cx*sz,  cz2*sz+sz2*cx*cz,            sz2*sx]
        %     [ -sz2*cz-cz2*cx*sz, -sz2*sz+cz2*cx*cz,            cz2*sx]
        %     [             sz*sx,            -cz*sx,                cx]

        dcm(1,1,:) = -sang(:,1).*cang(:,2).*sang(:,3) + cang(:,1).*cang(:,3);
        dcm(1,2,:) = cang(:,1).*cang(:,2).*sang(:,3) + sang(:,1).*cang(:,3);                
        dcm(1,3,:) = sang(:,2).*sang(:,3);     
        dcm(2,1,:) = -sang(:,1).*cang(:,3).*cang(:,2) - cang(:,1).*sang(:,3);
        dcm(2,2,:) = cang(:,1).*cang(:,3).*cang(:,2) - sang(:,1).*sang(:,3);
        dcm(2,3,:) = sang(:,2).*cang(:,3);  
        dcm(3,1,:) = sang(:,1).*sang(:,2);  
        dcm(3,2,:) = -cang(:,1).*sang(:,2);
        dcm(3,3,:) = cang(:,2);

    case 'yxz'
        %     [  cy*cz+sy*sx*sz,           sz*cx, -sy*cz+cy*sx*sz]
        %     [ -cy*sz+sy*sx*cz,           cz*cx,  sy*sz+cy*sx*cz]
        %     [           sy*cx,             -sx,           cy*cx]

        dcm(1,1,:) = cang(:,1).*cang(:,3) + sang(:,2).*sang(:,1).*sang(:,3);
        dcm(1,2,:) = cang(:,2).*sang(:,3);
        dcm(1,3,:) = -sang(:,1).*cang(:,3) + sang(:,2).*cang(:,1).*sang(:,3);
        dcm(2,1,:) = -cang(:,1).*sang(:,3) + sang(:,2).*sang(:,1).*cang(:,3);
        dcm(2,2,:) = cang(:,2).*cang(:,3);
        dcm(2,3,:) = sang(:,1).*sang(:,3) + sang(:,2).*cang(:,1).*cang(:,3);        
        dcm(3,1,:) = sang(:,1).*cang(:,2);
        dcm(3,2,:) = -sang(:,2);
        dcm(3,3,:) = cang(:,2).*cang(:,1);

    case 'yxy'
        %     [  cy2*cy-sy2*cx*sy,            sy2*sx, -cy2*sy-sy2*cx*cy]
        %     [             sy*sx,                cx,             cy*sx]
        %     [  sy2*cy+cy2*cx*sy,           -cy2*sx, -sy2*sy+cy2*cx*cy]

        dcm(1,1,:) = -sang(:,1).*cang(:,2).*sang(:,3) + cang(:,1).*cang(:,3);
        dcm(1,2,:) = sang(:,2).*sang(:,3);     
        dcm(1,3,:) = -cang(:,1).*cang(:,2).*sang(:,3) - sang(:,1).*cang(:,3);                
        dcm(2,1,:) = sang(:,1).*sang(:,2);  
        dcm(2,2,:) = cang(:,2);
        dcm(2,3,:) = cang(:,1).*sang(:,2);
        dcm(3,1,:) = sang(:,1).*cang(:,3).*cang(:,2) + cang(:,1).*sang(:,3);
        dcm(3,2,:) = -sang(:,2).*cang(:,3);  
        dcm(3,3,:) = cang(:,1).*cang(:,3).*cang(:,2) - sang(:,1).*sang(:,3);
        
    case 'yzx'
        %     [           cy*cz,              sz,          -sy*cz]
        %     [ -sz*cx*cy+sy*sx,           cz*cx,  sy*cx*sz+cy*sx]
        %     [  cy*sx*sz+sy*cx,          -cz*sx, -sy*sx*sz+cy*cx]

        dcm(1,1,:) = cang(:,1).*cang(:,2);
        dcm(1,2,:) = sang(:,2);
        dcm(1,3,:) = -sang(:,1).*cang(:,2);
        dcm(2,1,:) = -cang(:,3).*cang(:,1).*sang(:,2) + sang(:,3).*sang(:,1);
        dcm(2,2,:) = cang(:,2).*cang(:,3);
        dcm(2,3,:) = cang(:,3).*sang(:,1).*sang(:,2) + sang(:,3).*cang(:,1);        
        dcm(3,1,:) = sang(:,3).*cang(:,1).*sang(:,2) + cang(:,3).*sang(:,1);
        dcm(3,2,:) = -sang(:,3).*cang(:,2);
        dcm(3,3,:) = -sang(:,3).*sang(:,1).*sang(:,2) + cang(:,3).*cang(:,1);
        
    case 'yzy'
        %     [  cy2*cz*cy-sy2*sy,            cy2*sz, -cy2*cz*sy-sy2*cy]
        %     [            -cy*sz,                cz,             sy*sz]
        %     [  sy2*cz*cy+cy2*sy,            sy2*sz, -sy2*cz*sy+cy2*cy]

        dcm(1,1,:) = cang(:,1).*cang(:,3).*cang(:,2) - sang(:,1).*sang(:,3);
        dcm(1,2,:) = sang(:,2).*cang(:,3);  
        dcm(1,3,:) = -sang(:,1).*cang(:,3).*cang(:,2) - cang(:,1).*sang(:,3);
        dcm(2,1,:) = -cang(:,1).*sang(:,2);
        dcm(2,2,:) = cang(:,2);
        dcm(2,3,:) = sang(:,1).*sang(:,2);  
        dcm(3,1,:) = cang(:,1).*cang(:,2).*sang(:,3) + sang(:,1).*cang(:,3);                
        dcm(3,2,:) = sang(:,2).*sang(:,3);     
        dcm(3,3,:) = -sang(:,1).*cang(:,2).*sang(:,3) + cang(:,1).*cang(:,3);

    case 'xyz'
        %     [          cy*cz, sz*cx+sy*sx*cz, sz*sx-sy*cx*cz]
        %     [         -cy*sz, cz*cx-sy*sx*sz, cz*sx+sy*cx*sz]
        %     [             sy,         -cy*sx,          cy*cx]

        dcm(1,1,:) = cang(:,2).*cang(:,3);
        dcm(1,2,:) = sang(:,1).*sang(:,2).*cang(:,3) + cang(:,1).*sang(:,3);
        dcm(1,3,:) = -cang(:,1).*sang(:,2).*cang(:,3) + sang(:,1).*sang(:,3);
        dcm(2,1,:) = -cang(:,2).*sang(:,3);
        dcm(2,2,:) = -sang(:,1).*sang(:,2).*sang(:,3) + cang(:,1).*cang(:,3);
        dcm(2,3,:) = cang(:,1).*sang(:,2).*sang(:,3) + sang(:,1).*cang(:,3);        
        dcm(3,1,:) = sang(:,2);
        dcm(3,2,:) = -sang(:,1).*cang(:,2);
        dcm(3,3,:) = cang(:,1).*cang(:,2);
        
    case 'xyx'
        %     [                cy,             sy*sx,            -sy*cx]
        %     [            sx2*sy,  cx2*cx-sx2*cy*sx,  cx2*sx+sx2*cy*cx]
        %     [            cx2*sy, -sx2*cx-cx2*cy*sx, -sx2*sx+cx2*cy*cx]

        dcm(1,1,:) = cang(:,2);
        dcm(1,2,:) = sang(:,1).*sang(:,2);     
        dcm(1,3,:) = -cang(:,1).*sang(:,2);
        dcm(2,1,:) = sang(:,2).*sang(:,3);        
        dcm(2,2,:) = -sang(:,1).*cang(:,2).*sang(:,3) + cang(:,1).*cang(:,3);
        dcm(2,3,:) = cang(:,1).*cang(:,2).*sang(:,3) + sang(:,1).*cang(:,3);                
        dcm(3,1,:) = sang(:,2).*cang(:,3);        
        dcm(3,2,:) = -sang(:,1).*cang(:,3).*cang(:,2) - cang(:,1).*sang(:,3);
        dcm(3,3,:) = cang(:,1).*cang(:,3).*cang(:,2) - sang(:,1).*sang(:,3);
        
    case 'xzy'
        %     [          cy*cz, sz*cx*cy+sy*sx, cy*sx*sz-sy*cx]
        %     [            -sz,          cz*cx,          cz*sx]
        %     [          sy*cz, sy*cx*sz-cy*sx, sy*sx*sz+cy*cx]

        dcm(1,1,:) = cang(:,3).*cang(:,2);
        dcm(1,2,:) = cang(:,1).*cang(:,3).*sang(:,2) + sang(:,1).*sang(:,3);
        dcm(1,3,:) = sang(:,1).*cang(:,3).*sang(:,2) - cang(:,1).*sang(:,3);
        dcm(2,1,:) = -sang(:,2);
        dcm(2,2,:) = cang(:,1).*cang(:,2);
        dcm(2,3,:) = sang(:,1).*cang(:,2);        
        dcm(3,1,:) = sang(:,3).*cang(:,2);
        dcm(3,2,:) = cang(:,1).*sang(:,2).*sang(:,3) - sang(:,1).*cang(:,3);                
        dcm(3,3,:) = sang(:,1).*sang(:,2).*sang(:,3) + cang(:,1).*cang(:,3);
        
    case 'xzx'
        %     [                cz,             sz*cx,             sz*sx]
        %     [           -cx2*sz,  cx2*cz*cx-sx2*sx,  cx2*cz*sx+sx2*cx]
        %     [            sx2*sz, -sx2*cz*cx-cx2*sx, -sx2*cz*sx+cx2*cx]

        dcm(1,1,:) = cang(:,2);
        dcm(1,2,:) = cang(:,1).*sang(:,2);     
        dcm(1,3,:) = sang(:,1).*sang(:,2);
        dcm(2,1,:) = -sang(:,2).*cang(:,3);        
        dcm(2,2,:) = cang(:,1).*cang(:,3).*cang(:,2) - sang(:,1).*sang(:,3);
        dcm(2,3,:) = sang(:,1).*cang(:,3).*cang(:,2) + cang(:,1).*sang(:,3);
        dcm(3,1,:) = sang(:,2).*sang(:,3);
        dcm(3,2,:) = -cang(:,1).*cang(:,2).*sang(:,3) - sang(:,1).*cang(:,3);                
        dcm(3,3,:) = -sang(:,1).*cang(:,2).*sang(:,3) + cang(:,1).*cang(:,3);

    otherwise
        error('aero:angle2dcm:unknownrotation','Unknown rotation sequence, %s', type);
end
end