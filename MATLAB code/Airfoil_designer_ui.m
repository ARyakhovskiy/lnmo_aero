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

% Last Modified by GUIDE v2.5 27-Jan-2019 23:59:52

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
%NACA_number = get(handles.editNacaNumber, 'String');
%M = str2double(NACA_number(1));
%P = str2double(NACA_number(2));
%XX = str2double(NACA_number(3:4));
%[x_u, x_l, y_u, y_l] = naca_generator(M, P, XX);
B = get(handles.sliderB, 'Value');%1.8761;
T = get(handles.sliderT, 'Value');%0.1138;
P = get(handles.sliderP, 'Value');%3.041;
C = get(handles.sliderC, 'Value');%0.03869;
E = get(handles.sliderE, 'Value');%0.8510;
R = get(handles.sliderR, 'Value');%0.0;
n = str2double(get(handles.editPanelsNum, 'String'));%0.0;n = 100;
%n = 100;
%forming the geometry
global nodesX;
global nodesY;
[nodesX, nodesY] = shapeEq(B, T, P, C, E, R, n);
plot(nodesX, nodesY, 'b-', 'Linewidth', 2, 'Parent', handles.axesFoilShape);
axes(handles.axesFoilShape);
hold on
grid on
%set(gca,'DataAspectRatio',[1 1 1])
axis([-0.1*max(nodesX)+min(nodesX) 1.1*max(nodesX) -0.2*max(nodesX) 0.2*max(nodesX)]);
%plot(x_u, y_u, 'b-', 'Linewidth', 2, 'Parent', handles.axesFoilShape);
%plot(x_l, y_l, 'b-', 'Linewidth', 2, 'Parent', handles.axesFoilShape);



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


% --- Executes on button press in pushbuttonPanelize.
function pushbuttonPanelize_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonPanelize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nodesX;
global nodesY;
global panels;
panels = panelize(nodesX, nodesY);
msgbox(num2str(size(panels(1).angle)));

%f = figure;
%t = uitable('ColumnName', {'a', 'b', 'c', 'd'});
%set(t, 'Data', panels.angle);
%drawnow;



function editPanelsNum_Callback(hObject, eventdata, handles)
% hObject    handle to editPanelsNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPanelsNum as text
%        str2double(get(hObject,'String')) returns contents of editPanelsNum as a double


% --- Executes during object creation, after setting all properties.
function editPanelsNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPanelsNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenuPanelizationMethod.
function popupmenuPanelizationMethod_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuPanelizationMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuPanelizationMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuPanelizationMethod


% --- Executes during object creation, after setting all properties.
function popupmenuPanelizationMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuPanelizationMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function airfoilSlider_Callback(hObject, eventdata, handles)
% hObject    handle to airfoilSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function airfoilSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to airfoilSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenuFoilParameter.
function popupmenuFoilParameter_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuFoilParameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuFoilParameter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuFoilParameter


% --- Executes during object creation, after setting all properties.
function popupmenuFoilParameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuFoilParameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderB_Callback(hObject, eventdata, handles)
% hObject    handle to sliderB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bthPlotAirfoil_Callback(handles.axesFoilShape, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderT_Callback(hObject, eventdata, handles)
% hObject    handle to sliderT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
bthPlotAirfoil_Callback(handles.axesFoilShape, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function sliderT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderP_Callback(hObject, eventdata, handles)
% hObject    handle to sliderP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
bthPlotAirfoil_Callback(handles.axesFoilShape, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function sliderP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderC_Callback(hObject, eventdata, handles)
% hObject    handle to sliderC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
bthPlotAirfoil_Callback(handles.axesFoilShape, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function sliderC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderE_Callback(hObject, eventdata, handles)
% hObject    handle to sliderE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
bthPlotAirfoil_Callback(handles.axesFoilShape, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function sliderE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderR_Callback(hObject, eventdata, handles)
% hObject    handle to sliderR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
bthPlotAirfoil_Callback(handles.axesFoilShape, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function sliderR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editAngleOfAttack_Callback(hObject, eventdata, handles)
% hObject    handle to editAngleOfAttack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAngleOfAttack as text
%        str2double(get(hObject,'String')) returns contents of editAngleOfAttack as a double


% --- Executes during object creation, after setting all properties.
function editAngleOfAttack_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAngleOfAttack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editVelocity_Callback(hObject, eventdata, handles)
% hObject    handle to editVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editVelocity as text
%        str2double(get(hObject,'String')) returns contents of editVelocity as a double


% --- Executes during object creation, after setting all properties.
function editVelocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenuTargetFunction.
function popupmenuTargetFunction_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuTargetFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuTargetFunction contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuTargetFunction


% --- Executes during object creation, after setting all properties.
function popupmenuTargetFunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuTargetFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonCalculate.
function pushbuttonCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panels
[A, b] = panelMethodCoeffs(panels, 0.0);
msgbox(num2str(size(A)));
f = figure;
t = uitable();
drawnow;
set(t, 'Data', b)
