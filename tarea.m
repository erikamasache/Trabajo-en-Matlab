function varargout = tarea(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tarea_OpeningFcn, ...
                   'gui_OutputFcn',  @tarea_OutputFcn, ...
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
function tarea_OpeningFcn(hObject, eventdata, handles, varargin)
% carga la imagen de fondo
axes(handles.graf1);
a=imread('fondo.jpg');
image(a);
% desactiva botones y cajas de texto
set(handles.txt_entradas,'Enable','off');
set(handles.txt_salidas,'Enable','off');
set(handles.menu_Entrenamiento,'Enable','off');
set(handles.txt_capas,'Enable','off');
set(handles.botonNeurona,'Enable','off');
set(handles.text1,'Enable','off');
set(handles.text2,'Enable','off');
set(handles.text3,'Enable','off');
set(handles.text6,'Enable','off');
set(handles.botonMostrarNeurona,'Enable','off');
set(handles.botonClasificar,'Enable','off');
set(handles.edit10,'Enable','off');
set(handles.edit11,'Enable','off');
        set(handles.text9,'Enable','off');
        set(handles.text10,'Enable','off');
%         set(handles.botonLimpiar,'Enable','off');

% handles.menu_Funcion = 'traingdx';
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = tarea_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function menu_Funcion_Callback(hObject, eventdata, handles)

%obtiene el valor de la funcion (tansig y logsig)
valorF=get(handles.menu_Funcion,'Value');
global ValorFuncion
switch valorF
    case 1
        errfig = errordlg('Opción no válida', 'Error de opcion');          
    case 2
        ValorFuncion='logsig';
        set(handles.menu_Entrenamiento,'Enable','on');
        set(handles.text6,'Enable','on');
        guidata(hObject,handles);
    case 3
        ValorFuncion='tansig'; 
        set(handles.menu_Entrenamiento,'Enable','on');
        set(handles.text6,'Enable','on');
        guidata(hObject,handles);
end


function menu_Funcion_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function botonNeurona_Callback(hObject, eventdata, handles)
numCapas =str2num(get(handles.txt_capas,'String'));
% Obtiene las neuronas por cada capa
global ValorFuncion   % se crean variables' valor 
global vector_capas
vector_capas=[];
global vector_func_por_capa
vector_func_por_capa={};
%ciclo para agregar neuronas a al numero de capas
for n=1:1:numCapas
    
     if n == numCapas
        n_e=str2num(get(handles.txt_entradas,'String'));
        fila=n_e(:,1);
        num_e=size(fila);
        num_e
        num_entradas=num_e(1);
        vector_capas(n)=num_entradas;
        vector_func_por_capa(n)={ValorFuncion};
    else
    texto_1='Numero de neuronas para la capa ';
    texto_2=num2str(n);
    texto_completo = [texto_1 texto_2];
    prompt = {texto_completo};
    dlg_title = 'Numero de neuronas por capa';
    answer = inputdlg(prompt,dlg_title);
    vector_capas=[vector_capas str2num(answer{1,1})];
    vector_func_por_capa(n)={ValorFuncion};
    end
    
end
display(vector_func_por_capa);
display(vector_capas);

function menu_Entrenamiento_Callback(hObject, eventdata, handles)
% Obtiene el entrenamiento
valorE=get(handles.menu_Entrenamiento,'Value');
global ValorEntrenamiento
% recorre el vector de otra 
switch valorE  
    case 1
        % muestra el mensaje de error
        errfig = errordlg('Opción no válida', 'Error de opcion'); 
    case 2
        ValorEntrenamiento='traingdx';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 3
        ValorEntrenamiento='trainlm'; 
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');        
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 4
        ValorEntrenamiento='traingdx';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 5
        ValorEntrenamiento='trainlm';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 6
        ValorEntrenamiento='trainbfg';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 7
        ValorEntrenamiento='trainbr';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 8
        ValorEntrenamiento='traincgb';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 9
        ValorEntrenamiento='traincgf';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 10
        ValorEntrenamiento='traincgp';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 11
        ValorEntrenamiento='traingd';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 12
        ValorEntrenamiento='traingda';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');        
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 13
        ValorEntrenamiento='traingdm';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
        
    case 14
        ValorEntrenamiento='trainoss';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');        
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 15
        ValorEntrenamiento='trainrp';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 16
        ValorEntrenamiento='trainscg';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 17
        ValorEntrenamiento='trainb';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 18
        ValorEntrenamiento='trainc';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
    case 19
        ValorEntrenamiento='trainr';
        set(handles.txt_entradas,'Enable','on');
        set(handles.txt_salidas,'Enable','on');
        set(handles.txt_capas,'Enable','on');
        set(handles.botonNeurona,'Enable','on');
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
        set(handles.botonMostrarNeurona,'Enable','on');
        set(handles.botonClasificar,'Enable','on');
        set(handles.edit10,'Enable','on');
        set(handles.edit11,'Enable','on');
        set(handles.text9,'Enable','on');
        set(handles.text10,'Enable','on');
end
function menu_Entrenamiento_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function botonClasificar_Callback(hObject, eventdata, handles)
refreshdata

% Obtencion de entradas
P=get(handles.txt_entradas,'String');
T=get(handles.txt_salidas,'String');
EC=get(handles.edit10,'String');
ER=get(handles.edit11,'String');

a = size(T);

error=0;
for i=1:a(1)
    for j=1:a(2)
        display(T(i,j));
%         if (isnan(str2double(T(i,j)))==1)
%             error=1;
%         end
%         if (isnan(str2double(P(i,j)))==1)
%             error=1;
%         end
%         if (isnan(str2double(EC(i,j)))==1)
%             error=1;
%         end
%         if (isnan(str2double(ER(i,j)))==1)
%             error=1;
%         end
    end
end

if(error==1)
    errfig = errordlg('Datos Incorrectos', 'Error de opcion'); 
else
    P=str2num(get(handles.txt_entradas,'String'));
    T=str2num(get(handles.txt_salidas,'String'));
    EC=str2num(get(handles.edit10,'String'));
    ER=str2double(get(handles.edit11,'String'));
    global ValorEntrenamiento
    global vector_func_por_capa
    global vector_capas
    %
    %crea la neurona=
    net = newff(minmax(P),vector_capas,vector_func_por_capa,ValorEntrenamiento);
    net.trainParam.epochs =EC;
    net.trainParam.goal = ER;
    % net = train(net, P, T);
    Y=sim(net, P);
    axes(handles.axes3);
    % presenta la grafica
    plot(P,T,P,Y,'o');
    % view(net);
    handles.net_guardada = net;
    guidata(hObject,handles);
end

function botonMostrarNeurona_Callback(hObject, eventdata, handles)
a=handles.net_guardada;
view(a);

function txt_entradas_Callback(hObject, eventdata, handles)
function txt_entradas_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txt_salidas_Callback(hObject, eventdata, handles)
function txt_salidas_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txt_capas_Callback(hObject, eventdata, handles)
function txt_capas_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_Callback(hObject, eventdata, handles)
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
function edit11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in botonLimpiar.
function botonLimpiar_Callback(hObject, eventdata, handles)
set(handles.txt_entradas,'Enable','on');
        a='';
        set(handles.txt_entradas,'String',a);
        set(handles.txt_salidas,'String',a);
        set(handles.txt_capas,'String',a);
        set(handles.botonNeurona,'Enable','off');
        set(handles.botonMostrarNeurona,'Enable','off');
        set(handles.botonClasificar,'Enable','off');
        set(handles.edit10,'String',a);
        set(handles.edit11,'String',a);
        set(handles.text1,'Enable','on');
        set(handles.text2,'Enable','on');
        set(handles.text3,'Enable','on');
        set(handles.text6,'Enable','on');
% hObject    handle to botonLimpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
