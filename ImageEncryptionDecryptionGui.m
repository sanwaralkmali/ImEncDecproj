function varargout = ImageEncryptionDecryptionGui(varargin)
% Edit the above text to modify the response to help ImageEncryptionDecryptionGui

% Last Modified by GUIDE v2.5 11-Dec-2018 13:17:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageEncryptionDecryptionGui_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageEncryptionDecryptionGui_OutputFcn, ...
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


% --- Executes just before ImageEncryptionDecryptionGui is made visible.
function ImageEncryptionDecryptionGui_OpeningFcn(hObject, eventdata, handles, varargin)


% Choose default command line output for ImageEncryptionDecryptionGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageEncryptionDecryptionGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageEncryptionDecryptionGui_OutputFcn(hObject, eventdata, handles) 


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in uploadBu.

function uploadBu_Callback(hObject, eventdata, handles)

global Img;
global key;
global y;    % just to change the Mode of Process from Encryption to Decryption 
y=0;


 %upload Image that is one of the chosen extentions
[filename pathname] = uigetfile('*.jpg;*.jpeg;*.png','Read Images of this Type');

image = strcat(pathname, filename);

Img = imread(image);

[n m k] = size(Img)

axes(handles.OriginalImage)

imshow(Img); % show The Original Image

cla(handles.EncryptedImage,'reset'); % when Upload new Image Clear the EncryptedImage axes  

key =key_generate(n*m);   %where Key is generated 

guidata(hObject, handles);



% --- Executes on button press in EncryptBu.
function EncryptBu_Callback(hObject, eventdata, handles)

global Img ;
global EncImg; 
global key;  % global to be shared in all function
global DecImg;
global y;  

if (mod(y,2) == 0)
    EncImg = imageProcess(Img,key);  % process the Original Iamge 
    axes(handles.EncryptedImage)
    imshow(EncImg);	% Show the Encrypted Image using the public key
    guidata(hObject, handles);
    hObject.String='Decrypt';
    y = y + 1

else
    DecImg = imageProcess(EncImg,key);   % process the Encrypted Image 
    axes(handles.EncryptedImage);
    imshow(DecImg);			     % show the Decrypted Image 
    guidata(hObject, handles);
    hObject.String='Encrypt';
    y=y+1; 

    
end


