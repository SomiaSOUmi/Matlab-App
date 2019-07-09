function varargout = Log(varargin)
% LOG MATLAB code for Log.fig
%      LOG, by itself, creates a new LOG or raises the existing
%      singleton*.
%
%      H = LOG returns the handle to a new LOG or the handle to
%      the existing singleton*.
%
%      LOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOG.M with the given input arguments.
%
%      LOG('Property','Value',...) creates a new LOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Log_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Log_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Log

% Last Modified by GUIDE v2.5 13-Sep-2018 12:01:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Log_OpeningFcn, ...
                   'gui_OutputFcn',  @Log_OutputFcn, ...
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


% --- Executes just before Log is made visible.
function Log_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Log (see VARARGIN)

        handles.beans = 'beans.jpg' ; 
        handles.colors = 'colors.jpg' ; 
        handles.trucks = 'trucks.jpg' ; 
        handles.umbrellas = 'umbrellas.jpg' ; 
        
        handles.currentImg  = handles.trucks;
% Choose default command line output for Log
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Log wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Log_OutputFcn(hObject, eventdata, handles) 
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
    case 'beans'
        handles.currentImg = handles.beans ; 
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
f=imread(handles.currentImg);

g=rgb2gray(f);
%z = g ; 
c=1; 
[M,N]=size(g);
        for x = 1:M
            for y = 1:N
                m=double(g(x,y));
                z(x,y)=c.*log10(1+m); 
            end
        end
        
        
axes(handles.axes1) ; 
imshow(f)

axes(handles.axes2) ; 
imshow(z,[])

axes(handles.axes3) ; 
imshow(g,[])
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
