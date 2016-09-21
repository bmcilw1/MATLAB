function varargout = BrianMcIlwainGui(varargin)
% BRIANMCILWAINGUI MATLAB code for BrianMcIlwainGui.fig
%      BRIANMCILWAINGUI, by itself, creates a new BRIANMCILWAINGUI or raises the existing
%      singleton*.
%
%      H = BRIANMCILWAINGUI returns the handle to a new BRIANMCILWAINGUI or the handle to
%      the existing singleton*.
%
%      BRIANMCILWAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BRIANMCILWAINGUI.M with the given input arguments.
%
%      BRIANMCILWAINGUI('Property','Value',...) creates a new BRIANMCILWAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BrianMcIlwainGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BrianMcIlwainGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BrianMcIlwainGui

% Last Modified by GUIDE v2.5 26-Apr-2016 14:11:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BrianMcIlwainGui_OpeningFcn, ...
                   'gui_OutputFcn',  @BrianMcIlwainGui_OutputFcn, ...
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


% --- Executes just before BrianMcIlwainGui is made visible.
function BrianMcIlwainGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BrianMcIlwainGui (see VARARGIN)

% Choose default command line output for BrianMcIlwainGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BrianMcIlwainGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BrianMcIlwainGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t=0:.01:10;
T_sin=get(handles.T,'string');
T_sin=str2double(T_sin);
w=(2*pi)/T_sin;
y=sin(w*t);
axes(handles.mySin);
plot(t,y);
n=.1*randn(size(y));
axes(handles.myNoisySin);
plot(t,y+n);


function T_Callback(hObject, eventdata, handles)
% hObject    handle to T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T as text
%        str2double(get(hObject,'String')) returns contents of T as a double


% --- Executes during object creation, after setting all properties.
function T_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
