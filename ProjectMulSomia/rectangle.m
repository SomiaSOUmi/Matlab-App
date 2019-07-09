function varargout = rectangle(varargin)
% RECTANGLE MATLAB code for rectangle.fig
%      RECTANGLE, by itself, creates a new RECTANGLE or raises the existing
%      singleton*.
%
%      H = RECTANGLE returns the handle to a new RECTANGLE or the handle to
%      the existing singleton*.
%
%      RECTANGLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECTANGLE.M with the given input arguments.
%
%      RECTANGLE('Property','Value',...) creates a new RECTANGLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rectangle_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rectangle_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rectangle

% Last Modified by GUIDE v2.5 09-Sep-2018 22:59:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rectangle_OpeningFcn, ...
                   'gui_OutputFcn',  @rectangle_OutputFcn, ...
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


% --- Executes just before rectangle is made visible.
function rectangle_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rectangle (see VARARGIN)
 handles.colors = 'colors.jpg' ; 
        handles.trucks = 'trucks.jpg' ; 
        handles.umbrellas = 'umbrellas.jpg' ; 
        
        handles.currentImg = handles.colors ; 
% Choose default command line output for rectangle
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rectangle wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rectangle_OutputFcn(hObject, eventdata, handles) 
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
J = imcrop(handles.currentImg,[75 68 130 112]);
axes(handles.axes1) ; 
imshow(J,[]) 

I = J ; 
I(:,:,1) = 0 ; 
axes(handles.axes2) ; 
imshow(I,[]) 
