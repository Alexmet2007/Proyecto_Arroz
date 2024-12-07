%% Limpiando el espacio de trabajo
close all;
clc;
clear all;
% Leer las imágenes y almacenarlas en un array de celdas
try
    Arborio_1 = imread('Arborio_1.jpg');
    Basmati_1 = imread('Basmati_1.jpg');
    Ipsala_15 = imread('Ipsala_15.jpg');
    Jasmine_10 = imread('Jasmine_10.jpg');
    Karacadag_1 = imread('Karacadag_1.jpg');

    % Almacenar las imágenes en un array de celdas
    imageArray = {Arborio_1, Basmati_1, Ipsala_15, Jasmine_10, Karacadag_1};  
    end
% Procesar cada imagen en el array
for idx = 1:length(imageArray)
    % Imagen actual
    imagenRGB = imageArray{idx};

    % Convertir a escala de grises
    I = rgb2gray(imagenRGB);

    % Segmentación con método de Otsu - un umbral
    level = graythresh(I);
    BW_1 = imbinarize(I, level);

    % Mostrar la imagen segmentada
    figure;
    subplot(2, 1, 1), imshow(imagenRGB), title(['Imagen original', num2str(idx)]);
    subplot(2, 1, 2), imshow(BW_1), title(['Segmentación con un umbral - Imagen ', num2str(idx)]);

    % --- Operaciones morfológicas ---
    % Crear elementos estructurantes planos
    BW=uint8(BW_1)*255;
    se1 = strel('square', 5);    % Cuadrado de lado 5
    se2 = strel('line', 10, 30); % Línea de longitud 10 y ángulo 30
    se3 = strel('disk', 15);     % Disco de radio 15
    se4 = strel('ball', 15,5);     % Disco de radio 15

    % Operaciones morfológicas con se4
    D = imdilate(BW, se4); % Dilatación
    E = imerode(BW, se4);  % Erosión
    A = imopen(BW, se4);   % Apertura
    C = imclose(BW, se4);  % Cierre

    % Mostrar resultados de operaciones morfológicas
    figure;
    subplot(2, 2, 1), imshow(D), title('Dilatación');
    subplot(2, 2, 2), imshow(E), title('Erosión');
    subplot(2, 2, 3), imshow(A), title('Apertura');
    subplot(2, 2, 4), imshow(C), title('Cierre');

   
    % --- Esqueletización ---
    BW_esquel = bwmorph(C, 'skel', Inf); % Esqueletización
    figure;
    imshow(BW_esquel), title(['Esqueletización - Imagen ', num2str(idx)]);

    %% Conteo de puntas
    BW_puntas = bwmorph(BW_esquel,'endpoints',Inf);
    num_puntas(idx) = size(find(BW_puntas>0),1);
end
