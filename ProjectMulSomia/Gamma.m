function varargout = Gamma(varargin)
% GAMMA MATLAB code for Gamma.fig
%      GAMMA, by itself, creates a new GAMMA or raises the existing
%      singleton*.
%
%      H = GAMMA returns the handle to a new GAMMA or the handle to
%      the existing singleton*.
%
%      GAMMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAMMA.M with the given input arguments.
%
%      GAMMA('Property','Value',...) creates a new GAMMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gamma_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gamma_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gamma

% Last Modified by GUIDE v2.5 13-Sep-2018 12:26:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gamma_OpeningFcn, ...
                   'gui_OutputFcn',  @Gamma_OutputFcn, ...
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


% --- Executes just before Gamma is made visible.
function Gamma_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gamma (see VARARGIN)
       
        handles.beans = 'beans.jpg' ; 
        handles.colors = 'colors.jpg' ; 
        handles.trucks = 'trucks.jpg' ; 
        handles.umbrellas = 'umbrellas.jpg' ; 
        
        handles.currentImg  = handles.trucks;
% Choose default command line output for Gamma
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gamma wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gamma_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
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
    case 'beans'
        handles.currentImg = handles.beans ; 

end 
guidata (hObject,handles)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
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
f=imread(handles.currentImg);

G=rgb2gray(f);
%z = g ; 
c=1; 
g = 3; 
[M,N]=size(G);
        for x = 1:M
            for y = 1:N
                m=double(G(x,y));
                z(x,y)=c.*m^g; 
            end
        end
axes(handles.axes4) ; 
imshow(f)

axes(handles.axes6) ; 
imshow(G,[])

axes(handles.axes5) ; 
imshow(z,[])



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
