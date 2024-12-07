%% 
% Script para CLASIFICACION CON REDES NEURONALES ARTIFICIALES
% Electiva: Procesamiento Digital de Imágenes
% 
%% Limpiar el espacio de trabajo
close all;
clc;
clear all;
%% Configuración inicial
addpath('/MATLAB Drive/Sesion3/');

%% Leer datos, descriptores
matr_descrip = xlsread('image_features1.xlsx'); %Contiene descriptores en la tabla, xlsread carga sólo los valores numéricos de la primera pestaña
ss = size(matr_descrip); %tamaño de la matriz, en este caso de 250x
size(matr_descrip)
%% 
g=0;
for i = 1:50:ss(1) %Cada 50 posiciones del vector se toman las 25 primeras muestras de cada clase (con esto se dejan 2 para la prueba)
   k=0;
    for j=1:25 
    area(j+g) = matr_descrip(i+k,1);
    perim(j+g) = matr_descrip(i+k,2);
    circ(j+g) = matr_descrip(i+k,4);
    eccen(j+g) = matr_descrip(i+k,5);
    puntas(j+g) = matr_descrip(i+k,6);
    ejeMen(j+g) = matr_descrip(i+k,8);
    ejeMay(j+g) = matr_descrip(i+k,7);
    k=k+1;
    end
    g=g+25;
end

%% Configuración y ejecución del clasificador
% 1.1 Configuración input
%X = [area; perim; orien; circ; ejeMen; ejeMay]'; %Datos de entrenamiento
X = [area; perim; circ; eccen; puntas; ejeMen;ejeMay]'; %Datos de entrenamiento

% 1.2 Configuración target
T = repmat([1 2 3 4 5],25,1); %Se crea una matriz con las etiquetas posibles para las muestras (2 filas,  columnas)
target = T(:); %Se serializa T, Vector objetivo para la clasif supervisada
%target = target';

% 2: Configuración de la red neuronal
disp('Configuring Neural Network...');
trainFcn = 'trainlm';                              % Levenberg-Marquardt
hiddenLayerSize = [7 15 5];                        %if I need more layers then I should write: [10,12,...,9]
net = fitnet(hiddenLayerSize,trainFcn);
% net.layers{1}.transferFcn='logsig';                %tansig by default, but I can put another
% net.layers{2}.transferFcn='tansig';   
% net.layers{3}.transferFcn='purelin';  
% net.trainParam.goal = 0.1;
% net.trainParam.epochs = 500;
%net = init(net);                                  %initializing the network with previous configurations
% view(net)                                          % para visualizar la red final 
[net, tr] = train(net,X',target');               %training

%% Validación del modelo sobre muestras de prueba (las que no se usaron durante el entrenamiento)
% Se toman las 2 segundas muestras de cada clase
g=0;
for i = 26:50:ss(1) %Cada 50 posiciones del vector se toman las 25 primeras muestras de cada clase (con esto se dejan 2 para la prueba)
   k=0;
    for j=1:25 
    area(j+g) = matr_descrip(i+k,1);
    perim(j+g) = matr_descrip(i+k,2);
    circ(j+g) = matr_descrip(i+k,4);
    eccen(j+g) = matr_descrip(i+k,5);
    puntas(j+g) = matr_descrip(i+k,6);
    ejeMen(j+g) = matr_descrip(i+k,8);
    ejeMay(j+g) = matr_descrip(i+k,7);
    k=k+1;
    end  
    g=g+25;
end

%X_v = [area; perim; orien; circ; ejeMen; ejeMay]'; %Datos de entrenamiento %Datos de prueba
X_v = [area; perim; circ; eccen; puntas; ejeMen;ejeMay]';

%Respuesta del clasificador
outputs = round(net(X_v'));
outputs % para presentar en pantalla un vector fila con los resultados (como responde)
target' %... y compararlo con el objetivo (como debería responder)

% Evaluación del desempeño: Es mejor si se acerca a 100
%performance = perform(net, target', outputs)
eval = sum(outputs==target')/length(target)*100 

%save ANN_model89 net % guardar modelo clasificador