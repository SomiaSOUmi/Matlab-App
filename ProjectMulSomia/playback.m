function varargout = playback(varargin)
% PLAYBACK MATLAB code for playback.fig
%      PLAYBACK, by itself, creates a new PLAYBACK or raises the existing
%      singleton*.
%
%      H = PLAYBACK returns the handle to a new PLAYBACK or the handle to
%      the existing singleton*.
%
%      PLAYBACK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLAYBACK.M with the given input arguments.
%
%      PLAYBACK('Property','Value',...) creates a new PLAYBACK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before playback_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to playback_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help playback

% Last Modified by GUIDE v2.5 14-Sep-2018 00:51:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @playback_OpeningFcn, ...
                   'gui_OutputFcn',  @playback_OutputFcn, ...
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


% --- Executes just before playback is made visible.
function playback_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to playback (see VARARGIN)
axes(handles.axes1) ; 
implay('video.mp4') ; 
% Choose default command line output for playback
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes playback wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = playback_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
