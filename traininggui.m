function varargout = traininggui(varargin)
% TRAININGGUI MATLAB code for traininggui.fig
%      TRAININGGUI, by itself, creates a new TRAININGGUI or raises the existing
%      singleton*.
%
%      H = TRAININGGUI returns the handle to a new TRAININGGUI or the handle to
%      the existing singleton*.
%
%      TRAININGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAININGGUI.M with the given input arguments.
%
%      TRAININGGUI('Property','Value',...) creates a new TRAININGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before traininggui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to traininggui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help traininggui

% Last Modified by GUIDE v2.5 03-Dec-2016 17:27:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @traininggui_OpeningFcn, ...
    'gui_OutputFcn',  @traininggui_OutputFcn, ...
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


% --- Executes just before traininggui is made visible.
function traininggui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to traininggui (see VARARGIN)
handles.outparams = zeros(20, 4);
handles.clicked = zeros(1,20);
handles.pageCount = 1;
textLabel = sprintf('Training Image: %s', int2str(handles.pageCount));
set(handles.text4, 'String', textLabel);
temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
displayIms(handles, testSet, 0);

% Choose default command line output for traininggui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes traininggui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = traininggui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.outparams;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%next test set button
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.pageCount = handles.pageCount + 1;

if handles.pageCount <= 20
    temp = loadImsAndParams(handles.pageCount);
    testSet = temp.training_images;
    displayIms(handles, testSet, 0);
else
    handles.pageCount = 20;
end
textLabel = sprintf('Training Image: %s', int2str(handles.pageCount));
set(handles.text4, 'String', textLabel);
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pageCount = handles.pageCount - 1;
if handles.pageCount >= 1
    temp = loadImsAndParams(handles.pageCount);
    testSet = temp.training_images;
    displayIms(handles, testSet, 0);
else
    handles.pageCount = 1;
end
textLabel = sprintf('Training Image: %s', int2str(handles.pageCount));
set(handles.text4, 'String', textLabel);
guidata(hObject,handles);


%axes 2
% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
axes(handles.axes2);
imshow(makeBorder(testSet.images{1},10), []);
displayIms(handles, testSet, 1);
handles.outparams(handles.pageCount, :) = testSet.params{1};
handles.clicked(handles.pageCount) = 1;
guidata(hObject,handles);


%axes 3
% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
axes(handles.axes3);
imshow(makeBorder(testSet.images{2},10), []);
displayIms(handles, testSet, 2);
handles.outparams(handles.pageCount, :) = testSet.params{2};
handles.clicked(handles.pageCount) = 1;
guidata(hObject,handles);

%axes 4
% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
axes(handles.axes4);
imshow(makeBorder(testSet.images{3},10), []);
displayIms(handles, testSet, 3);
handles.outparams(handles.pageCount, :) = testSet.params{3};
handles.clicked(handles.pageCount) = 1;
guidata(hObject,handles);

%axes 5
% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
axes(handles.axes5);
imshow(makeBorder(testSet.images{4},10), []);
displayIms(handles, testSet, 4);
handles.outparams(handles.pageCount, :) = testSet.params{4};
handles.clicked(handles.pageCount) = 1;
guidata(hObject,handles);

%axes 6
% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
axes(handles.axes6);
imshow(makeBorder(testSet.images{5},10), []);
displayIms(handles, testSet, 5);
handles.outparams(handles.pageCount, :) = testSet.params{5};
handles.clicked(handles.pageCount) = 1;
guidata(hObject,handles);

%axes 7
% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
axes(handles.axes7);
imshow(makeBorder(testSet.images{6},10), []);
displayIms(handles, testSet, 6);
handles.outparams(handles.pageCount, :) = testSet.params{6};
handles.clicked(handles.pageCount) = 1;
guidata(hObject,handles);

%axes 8
% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
axes(handles.axes8);
imshow(makeBorder(testSet.images{7},10), []);
displayIms(handles, testSet, 7);
handles.outparams(handles.pageCount, :) = testSet.params{7};
handles.clicked(handles.pageCount) = 1;
guidata(hObject,handles);

%axes 9
% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
axes(handles.axes9);
imshow(makeBorder(testSet.images{8},10), []);
displayIms(handles, testSet, 8);
handles.outparams(handles.pageCount, :) = testSet.params{8};
handles.clicked(handles.pageCount) = 1;
guidata(hObject,handles);


%axes 10
% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp = loadImsAndParams(handles.pageCount);
testSet = temp.training_images;
axes(handles.axes10);
imshow(makeBorder(testSet.images{9},10), []);
displayIms(handles, testSet, 9);
handles.outparams(handles.pageCount, :) = testSet.params{9};
handles.clicked(handles.pageCount) = 1;
guidata(hObject,handles);

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if all(handles.clicked)
    userParams = handles.outparams;
    save('userParams','userParams')
    close(handles.figure1)
end

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pages = 1:20;
pagesNotSelected = pages(~handles.clicked);
if isempty(pagesNotSelected)
    'You have selected all preferences. You may press finish training!'
else
    'Please select images from pages:'
     pagesNotSelected
end

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

function struct = loadImsAndParams(currentPage)
struct = load(['resized_Training_Sets_7_5/training_data_' int2str(currentPage)]);

function displayIms(handles, testSet, noDisp)
if noDisp ~= 1
    axes(handles.axes2);
    imshow(testSet.images{1}, []);
end

if noDisp ~= 2
    axes(handles.axes3);
    imshow(testSet.images{2}, []);
end

if noDisp ~= 3
    axes(handles.axes4);
    imshow(testSet.images{3}, []);
end

if noDisp ~= 4
    axes(handles.axes5);
    imshow(testSet.images{4}, []);
end

if noDisp ~= 5
    axes(handles.axes6);
    imshow(testSet.images{5}, []);
end

if noDisp ~= 6
    axes(handles.axes7);
    imshow(testSet.images{6}, []);
end

if noDisp ~= 7
    axes(handles.axes8);
    imshow(testSet.images{7}, []);
end

if noDisp ~= 8
    axes(handles.axes9);
    imshow(testSet.images{8}, []);
end

if noDisp ~= 9
    axes(handles.axes10);
    imshow(testSet.images{9}, []);
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
