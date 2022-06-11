clc;
clear;
% Cargar todas las imagenes del Hito1 %
referenciaHito1=imread('Hito1/referenciaHito1.jpg');
imagen1Hito1=imread('Hito1/imagen1Hito1.jpg');
imagen2Hito1=imread('Hito1/imagen2Hito1.jpg');
imagen3Hito1=imread('Hito1/imagen3Hito1.jpg');
imagen4Hito1=imread('Hito1/imagen4Hito1.jpg');

% Mostramos las imagenes con imshow en una misma figura %
figure1 = figure('NumberTitle', 'off', 'Name', 'Imagenes Hito1');
subplot(2,3,1), imshow(referenciaHito1), title('Imagen de referencia');
subplot(2,3,3), imshow(imagen1Hito1);
subplot(2,3,4), imshow(imagen2Hito1);
subplot(2,3,5), imshow(imagen3Hito1);
subplot(2,3,6), imshow(imagen4Hito1);
grid on

% Calcular los descriptor de cada imagen con la funcion HOG %
hogReferencia=HOG(referenciaHito1);
hogImagen1=HOG(imagen1Hito1);
hogImagen2=HOG(imagen2Hito1);
hogImagen3=HOG(imagen3Hito1);
hogImagen4=HOG(imagen4Hito1);
hogImagenes=[hogReferencia; hogImagen1; hogImagen2; hogImagen3; hogImagen4];

% Representacion grafica de los descriptores en otra figura %
figure2 = figure('NumberTitle', 'off', 'Name', 'Grafica de los descriptores');
subplot(2,3,1), plot(hogReferencia), title('Imagen de referencia');
subplot(2,3,3), plot(hogImagen1);
subplot(2,3,4), plot(hogImagen2);
subplot(2,3,5), plot(hogImagen3);
subplot(2,3,6), plot(hogImagen4);
grid on

% Implementar la funcion de similitud de coseno %
sumaAB=[0 0 0 0]; %A*B%
sumaA=sumaAB; %A^2%
sumaB=sumaA; %B^2%
for i=1:4
    for j=1:length(hogReferencia)
        sumaAB(i) = sumaAB(i) + hogImagenes(i,j) * hogImagenes(i+1,j);
        sumaA(i) = sumaA(i) + hogImagenes(i,j)^2;
        sumaB(i) = sumaB(i) + hogImagenes(i+1,j)^2;
    end
    coseno(i) = sumaAB(i) / (sqrt(sumaA(i)*sumaB(i)));
    distancia(i) = 1-coseno(i);
end

% Obtener la distancia mas pequeña %
menorDistancia = distancia(1);
imagenMasParecida = 0;
for i=2:(length(distancia))
    if menorDistancia > distancia(i)
       menorDistancia = distancia(i);
       imagenMasParecida = i;
    end
end

% Mostrar la imagen mas parecida a la de referencia en otra figura %
figure3 = figure('NumberTitle', 'off', 'Name', 'Imagen mas parecida a la de referencia');
    switch imagenMasParecida
        case 1
            subplot(2,2,1), imshow(referenciaHito1), title('Imagen de referencia');
            subplot(2,2,2), imshow(imagen1Hito1), title('Imagen mas parecida');
        case 2
            subplot(2,2,1), imshow(referenciaHito1), title('Imagen de referencia');
            subplot(2,2,2), imshow(imagen2Hito1), title('Imagen mas parecida');
        case 3
            subplot(2,2,1), imshow(referenciaHito1), title('Imagen de referencia');
            subplot(2,2,2), imshow(imagen3Hito1), title('Imagen mas parecida');
        case 4
            subplot(2,2,1), imshow(referenciaHito1), title('Imagen de referencia');
            subplot(2,2,2), imshow(imagen4Hito1), title('Imagen mas parecida');
        otherwise
            disp('Sin coincidencias')
    end
grid on

% Recolocar las figuras % 
uistack(figure1, 'up', 2)
uistack(figure2, 'up', 1)

