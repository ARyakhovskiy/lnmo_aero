function varargout = Airfoil_designer_ui(varargin)
% AIRFOIL_DESIGNER_UI MATLAB code for Airfoil_designer_ui.fig
%      AIRFOIL_DESIGNER_UI, by itself, creates a new AIRFOIL_DESIGNER_UI or raises the existing
%      singleton*.
%
%      H = AIRFOIL_DESIGNER_UI returns the handle to a new AIRFOIL_DESIGNER_UI or the handle to
%      the existing singleton*.
%
%      AIRFOIL_DESIGNER_UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AIRFOIL_DESIGNER_UI.M with the given input arguments.
%
%      AIRFOIL_DESIGNER_UI('Property','Value',...) creates a new AIRFOIL_DESIGNER_UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Airfoil_designer_ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Airfoil_designer_ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Airfoil_designer_ui

% Last Modified by GUIDE v2.5 17-Dec-2018 12:02:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Airfoil_designer_ui_OpeningFcn, ...
                   'gui_OutputFcn',  @Airfoil_designer_ui_OutputFcn, ...
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


% --- Executes just before Airfoil_designer_ui is made visible.
function Airfoil_designer_ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Airfoil_designer_ui (see VARARGIN)

% Choose default command line output for Airfoil_designer_ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Airfoil_designer_ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Airfoil_designer_ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bthPlotAirfoil.
function bthPlotAirfoil_Callback(hObject, eventdata, handles)
% hObject    handle to bthPlotAirfoil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla
NACA_number = get(handles.editNacaNumber, 'String');
M = str2double(NACA_number(1));
P = str2double(NACA_number(2));
XX = str2double(NACA_number(3:4));
[x_u, x_l, y_u, y_l] = naca_generator(M, P, XX);
hold on
grid on
%set(gca,'DataAspectRatio',[1 1 1])
axis([-0.1*max(x_u)+min(x_u) 1.1*max(x_u) -0.2*max(x_u) 0.2*max(x_u)]);
plot(x_u, y_u, 'b-', 'Linewidth', 2);
plot(x_l, y_l, 'b-', 'Linewidth', 2);



% --- Executes on selection change in popupmenuAirfoilType.
function popupmenuAirfoilType_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuAirfoilType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuAirfoilType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuAirfoilType


% --- Executes during object creation, after setting all properties.
function popupmenuAirfoilType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuAirfoilType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editNacaNumber_Callback(hObject, eventdata, handles)
% hObject    handle to editNacaNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNacaNumber as text
%        str2double(get(hObject,'String')) returns contents of editNacaNumber as a double


% --- Executes during object creation, after setting all properties.
function editNacaNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNacaNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
