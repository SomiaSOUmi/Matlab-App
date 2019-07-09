function varargout = RGB(varargin)
% RGB MATLAB code for RGB.fig
%      RGB, by itself, creates a new RGB or raises the existing
%      singleton*.
%
%      H = RGB returns the handle to a new RGB or the handle to
%      the existing singleton*.
%
%      RGB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGB.M with the given input arguments.
%
%      RGB('Property','Value',...) creates a new RGB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RGB_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RGB_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RGB

% Last Modified by GUIDE v2.5 06-Sep-2018 01:11:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RGB_OpeningFcn, ...
                   'gui_OutputFcn',  @RGB_OutputFcn, ...
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


% --- Executes just before RGB is made visible.
function RGB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RGB (see VARARGIN)
        handles.colors = 'colors.jpg' ; 
        handles.trucks = 'trucks.jpg' ; 
        handles.umbrellas = 'umbrellas.jpg' ; 
        
        handles.currentImg = handles.colors ; 
% Choose default command line output for RGB
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RGB wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RGB_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String') ;
val = get (hObject, 'Value') ; 

switch str{val} 
    case 'colors'
        handles.currentImg  = handles.colors;
    case 'trucks'
        handles.currentImg  = handles.trucks;
    case 'umbrellas'
        handles.currentImg  = handles.umbrellas;
end 
guidata (hObject,handles)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i = imread (handles.currentImg) ; 
axes(handles.axes4) ; 
imshow(i,[])

%redChannel = i(:, :, 1);
redChannel  = i - ( i(:, :, 3)+ i(:, :, 2))  ; 
axes(handles.axes1) ; 
imshow(redChannel,[])

%greenChannel = i(:, :, 2);
greenChannel = i - ( i(:, :, 3)+ i(:, :, 1)) ;
axes(handles.axes2) ; 
imshow(greenChannel,[])


axes(handles.axes3) ; 
%blueChannel = i(:, :, 3);
blueChannel = i - ( i(:, :, 2)+ i(:, :, 1)) ;
imshow(blueChannel,[])


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
