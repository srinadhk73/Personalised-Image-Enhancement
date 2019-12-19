function varargout = testguiTemplate(varargin)
% TESTGUITEMPLATE MATLAB code for testguiTemplate.fig
%      TESTGUITEMPLATE, by itself, creates a new TESTGUITEMPLATE or raises the existing
%      singleton*.
%
%      H = TESTGUITEMPLATE returns the handle to a new TESTGUITEMPLATE or the handle to
%      the existing singleton*.
%
%      TESTGUITEMPLATE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTGUITEMPLATE.M with the given input arguments.
%
%      TESTGUITEMPLATE('Property','Value',...) creates a new TESTGUITEMPLATE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before testguiTemplate_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to testguiTemplate_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help testguiTemplate

% Last Modified by GUIDE v2.5 06-Dec-2016 17:09:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @testguiTemplate_OpeningFcn, ...
    'gui_OutputFcn',  @testguiTemplate_OutputFcn, ...
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


% --- Executes just before testguiTemplate is made visible.
function testguiTemplate_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to testguiTemplate (see VARARGIN)
handles.outparams = zeros(1, 30);
handles.pageCount = 1;
[orig, cust, goog, PS] = loadImCellArrays();
handles.original = orig.images;
handles.custom = cust.images;
handles.google = goog.images;
handles.photoshop = PS.images;
axes(handles.axes1);
imshow(handles.custom{handles.pageCount}, []);
axes(handles.axes2);
imshow(handles.original{handles.pageCount}, []);
% Choose default command line output for testguiTemplate
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes testguiTemplate wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = testguiTemplate_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%our images
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.outparams(handles.pageCount) = 1;
axes(handles.axes1);
currCustom = mod(handles.pageCount, 10);
if currCustom == 0
    currCustom = 10;
end
imshow(makeBorder(handles.custom{currCustom}, 10), []);
axes(handles.axes2);
if handles.pageCount <= 10
    imshow(handles.original{handles.pageCount}, []);
elseif handles.pageCount <= 20
    imshow(handles.google{handles.pageCount - 10}, []);
else
    imshow(handles.photoshop{handles.pageCount - 20}, []);
end
guidata(hObject, handles);
checkdone(handles)

%any other images we are comparing our image to
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.outparams(handles.pageCount) = -1;
axes(handles.axes1);
currCustom = mod(handles.pageCount, 10);
if currCustom == 0
    currCustom = 10;
end
imshow(handles.custom{currCustom}, []);
axes(handles.axes2);
if handles.pageCount <= 10
    imshow(makeBorder(handles.original{handles.pageCount}, 10), []);
elseif handles.pageCount <= 20
    imshow(makeBorder(handles.google{handles.pageCount - 10}, 10), []);
else
    imshow(makeBorder(handles.photoshop{handles.pageCount - 20}, 10), []);
end
guidata(hObject, handles);
checkdone(handles)

%no preference
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.outparams(handles.pageCount) = 2;
axes(handles.axes1);
currCustom = mod(handles.pageCount, 10);
if currCustom == 0
    currCustom = 10;
end
imshow(handles.custom{currCustom}, []);
axes(handles.axes2);
if handles.pageCount <= 10
    imshow(handles.original{handles.pageCount}, []);
elseif handles.pageCount <= 20
    imshow(handles.google{handles.pageCount - 10}, []);
else
    imshow(handles.photoshop{handles.pageCount - 20}, []);
end
guidata(hObject, handles);
checkdone(handles)

%previous image
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pageCount = handles.pageCount - 1;
if handles.pageCount >= 1
    currCustom = mod(handles.pageCount, 10);
    if currCustom == 0
        currCustom = 10;
    end
    axes(handles.axes1);
    imshow(handles.custom{currCustom}, []);
    axes(handles.axes2);
    if handles.pageCount <= 10
        imshow(handles.original{handles.pageCount}, []);
    elseif handles.pageCount <= 20
        imshow(handles.google{handles.pageCount - 10}, []);
    else
        imshow(handles.photoshop{handles.pageCount - 20}, []);
    end
else
    handles.pageCount = 1;
end
guidata(hObject, handles);

%next image
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pageCount = handles.pageCount + 1;
if handles.pageCount <= 30
    currCustom = mod(handles.pageCount, 10);
    if currCustom == 0
        currCustom = 10;
    end
    axes(handles.axes1);
    imshow(handles.custom{currCustom}, []);
    axes(handles.axes2);
    if handles.pageCount <= 10
        imshow(handles.original{handles.pageCount}, []);
    elseif handles.pageCount <= 20
        imshow(handles.google{handles.pageCount - 10}, []);
    else
        imshow(handles.photoshop{handles.pageCount - 20}, []);
    end
else
    handles.pageCount = 30;
end
guidata(hObject, handles);


function [orig, cust, goog, PS] = loadImCellArrays()
orig = load('Final_Test_Images/original_images');
cust = load('Final_Test_Images/custom_images');
goog = load('Final_Test_Images/google_images');
PS = load('Final_Test_Images/photoshop_images');

function imout = makeBorder(imin, width)

imin(1:width, :, :) = 0;
imin(1:width, :, 2) = imin(1:width, :, 2) + 255;
imin(end: -1: end - width, :, :) = 0;
imin(end: -1: end - width, :, 2) = imin(end: -1: end - width, :, 2) + 255;
imin(:, 1:width, :) = 0;
imin(:, 1:width, 2) = imin(:, 1:width, 2) + 255;
imin(:, end: -1: end - width, :) = 0;
imin(:, end: -1: end - width, 2) = imin(:, end: -1: end - width, 2) + 255;
imout = imin;

function checkdone(handles)
if all(abs(handles.outparams))
    testResults = handles.outparams;
    temp = testResults(1:10);
    nums_custom(1) = sum(temp==1);
    nums_no_pref(1) = sum(temp==2);
    temp = testResults(11:20);
    nums_custom(2) = sum(temp==1);
    nums_no_pref(2) = sum(temp==2);
    temp = testResults(21:30);
    nums_custom(3) = sum(temp==1);
    nums_no_pref(3) = sum(temp==2);
    results.custom = nums_custom;
    results.noPref = nums_no_pref;
    save('testResults','results')
    close(handles.figure1)
end


