%% Limpiando el espacio de trabajo
close all;
clc;
clear all;
%% Configuracion inicial
read_path = '/MATLAB Drive/Train_data';
files = dir(read_path);
num_images = length(files) - 2;
features = cell(num_images, 5);
names = cell(num_images, 1)

for f = 3:length(files)
    file_2_read = strcat(files(f).folder, '/', files(f).name)
    names{f - 2} = files(f).name; % Almacena el nombre del archivo
    imagenRGB = imread(file_2_read); % Lee la imagen
    grayImage = rgb2gray(imagenRGB); % Convierte la imagen a esacala de grises
    thresh = graythresh(grayImage); % Calcula el umbral de binarizacion óptimo
    binh = imbinarize(grayImage, thresh); %Binariza cada imagen
    % --- Operaciones morfológicas ---
    % Crear elementos estructurantes planos
    BW=uint8(binh)*255;
    se4 = strel('ball', 15,5);     % Disco de radio 15

    % Operaciones morfológicas con se4
    C = imclose(BW, se4);  % Cierre
    % --- Esqueletización ---
    BW_esquel = bwmorph(C, 'skel', Inf); % Esqueletización
    %% Conteo de puntas
    BW_puntas = bwmorph(BW_esquel,'endpoints',Inf);
    num_puntas = size(find(BW_puntas>0),1);
    [I_label, num] = bwlabel(binh, 8); % Etiqueta cada región de la imagen para calcular las caracteristicas
    I_cdes = regionprops(I_label, 'Area', 'Perimeter', 'Orientation', 'Circularity', 'Eccentricity', 'MajorAxisLength', 'MinorAxisLength');
    features{f - 2, 1} = I_cdes.Area;
    features{f - 2, 2} = I_cdes.Perimeter;
    features{f - 2, 3} = I_cdes.Orientation;
    features{f - 2, 4} = I_cdes.Circularity;
    features{f - 2, 5} = I_cdes.Eccentricity;
    features{f - 2, 6} = num_puntas;
    features{f - 2, 7} = I_cdes.MajorAxisLength;
    features{f - 2, 8} = I_cdes.MinorAxisLength;

    
end

% Crear tabla para exportar
headers = {'FileName', 'Area', 'Perimeter', 'Orientation', 'Circularity', 'Eccentricity', 'Num_puntas', 'MajorAxisLength', 'MinorAxisLength'};
data_table = cell2table([names, features], 'VariableNames', headers);

% Exportar a Excel
output_file = 'image_features1.xlsx'; % Nombre del archivo de salida
writetable(data_table, output_file);

disp(['Características exportadas exitosamente a ', output_file]);
