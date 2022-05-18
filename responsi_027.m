function varargout = responsi_027(varargin)
% RESPONSI_027 MATLAB code for responsi_027.fig
%      RESPONSI_027, by itself, creates a new RESPONSI_027 or raises the existing
%      singleton*.
%
%      H = RESPONSI_027 returns the handle to a new RESPONSI_027 or the handle to
%      the existing singleton*.
%
%      RESPONSI_027('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSI_027.M with the given input arguments.
%
%      RESPONSI_027('Property','Value',...) creates a new RESPONSI_027 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before responsi_027_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to responsi_027_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help responsi_027

% Last Modified by GUIDE v2.5 18-May-2022 14:51:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @responsi_027_OpeningFcn, ...
                   'gui_OutputFcn',  @responsi_027_OutputFcn, ...
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


% --- Executes just before responsi_027 is made visible.
function responsi_027_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to responsi_027 (see VARARGIN)

% Choose default command line output for responsi_027
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes responsi_027 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = responsi_027_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ldata.
function ldata_Callback(hObject, eventdata, handles)
% hObject    handle to ldata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = detectImportOptions('DatasetHostelJepang.xlsx');
y = readmatrix('DatasetHostelJepang.xlsx');
set(handles.table,'data',y);


% --- Executes on button press in hasil.
function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = detectImportOptions('DatasetHostelJepang.xlsx');
y = readmatrix('DatasetHostelJepang.xlsx');
k = [1, 0, 1, 1];
w = [1, 4, 2, 3];
[m n]=size(y);

w = w./sum(w);
for j = 1 : n
    if k(j)== 0, w(j) =-1*w(j);
    end;
end;
for i = 1:m
    S(i)=prod(y(i,:).^w);
end;
V = S/sum(S);
[jepang,data] = maxk(V,'descend'); %membuat tabel perangkingan
data = transpose(num2cell(data)); %melakukan pengubahan dari data horizontal ke data vertikal 
%dan merubah array ke bentuk tabel
jepang = transpose(num2cell(jepang)); %melakukan pengubahan dari data horizontal ke data vertikal
%dan merubah array ke bentuk tabel
hasil = [data jepang]; %menggabungkan 2 kolom menjadi 1 tabel
set(handles.Table2,'Data',hasil); %menampilkan tabel perangkinga
