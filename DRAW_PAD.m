function varargout = DRAW_PAD(varargin)
% DRAW_PAD MATLAB code for DRAW_PAD.fig
%      DRAW_PAD, by itself, creates a new DRAW_PAD or raises the existing
%      singleton*.
%
%      H = DRAW_PAD returns the handle to a new DRAW_PAD or the handle to
%      the existing singleton*.
%
%      DRAW_PAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRAW_PAD.M with the given input arguments.
%
%      DRAW_PAD('Property','Value',...) creates a new DRAW_PAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DRAW_PAD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DRAW_PAD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DRAW_PAD

% Last Modified by GUIDE v2.5 01-Oct-2018 23:30:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DRAW_PAD_OpeningFcn, ...
                   'gui_OutputFcn',  @DRAW_PAD_OutputFcn, ...
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


% --- Executes just before DRAW_PAD is made visible.
function DRAW_PAD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DRAW_PAD (see VARARGIN)

% Choose default command line output for DRAW_PAD
handles.output = hObject;

% Sets axis to allow drawing
axes(handles.axes1);  % Assuming you want axes1 to be the one you draw in.
% User signs name here.
hFH = imfreehand();
% Get the xy coordinates of where they drew.
xy = hFH.getPosition
% get rid of imfreehand remnant.
delete(hFH);
% Overlay what they drew onto the image.
hold on; % Keep image, and direction of y axis.
xCoordinates = xy(:, 1);
yCoordinates = xy(:, 2);
plot(xCoordinates, yCoordinates, 'ro-', 'LineWidth', 2);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DRAW_PAD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DRAW_PAD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in done_button.
function done_button_Callback(hObject, eventdata, handles)
% hObject    handle to done_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of done_button
