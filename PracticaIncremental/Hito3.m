clc;
clear;
% Cargar las imagenes del Hito3 %
asteroideHito3=imread('Hito3/asteroideHito3.jpg');
referenciaHito3=imread('Hito3/referenciaHito3.jpg');

% Mosaico de la imagen del asteroide %
[alto, ancho]=size(asteroideHito3);
[altoRef, anchoRef]=size(referenciaHito3);
particion = altoRef;
nBloquesVerticales = floor(alto/particion);
nBloquesHorizonales = floor(ancho/particion);

hogReferenciaHito3=HOG(referenciaHito3);
hogMosaico=zeros(nBloquesVerticales*nBloquesHorizonales+1,length(hogReferenciaHito3));
Index = 1;

prompt = 'SaltoX (Eje X): ';
x = input(prompt);
prompt = 'SaltoY (Eje Y): ';
y = input(prompt);

distancia = "";
imagenSeleccionada=referenciaHito3;
for fila=1:+particion:nBloquesVerticales*particion
    for columna=1:+particion:nBloquesHorizonales*particion
      
    ultimaFila = fila + particion - 1;
    ultimaColumna = columna + particion - 1;

    temp = asteroideHito3(fila:ultimaFila,columna:ultimaColumna,:);
    temp2 = transpose(temp);
    hogTemp=HOG(temp2);

    imagenSeleccionada = asteroideHito3(x:x+altoRef,y:y+altoRef,:);
    hogImagenSeleccionada=HOG(imagenSeleccionada);
    hogImagenes=[hogReferenciaHito3; hogImagenSeleccionada];

    for i=1:length(hogTemp)
        hogMosaico(Index,i)=hogTemp(1,i);
    end
    Index = Index + 1;
    
    end
end

% Implementar la funcion de similitud de coseno %
sumaAB=[0 0 0 0]; %A*B%
sumaA=sumaAB; %A^2%
sumaB=sumaA; %B^2%
for i=1:2
    for j=1:length(hogReferenciaHito3)
        sumaAB(i) = sumaAB(i) + hogImagenes(1,j) * hogImagenes(2,j);
        sumaA(i) = sumaA(i) + hogImagenes(1,j)^2;
        sumaB(i) = sumaB(i) + hogImagenes(2,j)^2;
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

disp("La semejanza de la zona seleccionada respecto a la imagen de referencia es: " + menorDistancia);

if x+500 <= alto || y+500 <= ancho
    figure2 = figure('NumberTitle', 'off', 'Name', "El indice de semejanza de la zona seleccionada es: " + menorDistancia);
        imshow(asteroideHito3)
        hold on;
        plot(x, y, 'or', 'LineWidth', 2, 'MarkerSize', 5);
        plot(x, y+500, 'or', 'LineWidth', 2, 'MarkerSize', 5);
        plot(x+500, y, 'or', 'LineWidth', 2, 'MarkerSize', 5);
        plot(x+500, y+500, 'or', 'LineWidth', 2, 'MarkerSize', 5);
        x=[x x x+500 x+500 x];
        y=[y y+500 y+500 y y];
        plot(x,y,'r+-','LineWidth',2);
    grid on
else
    disp("Error: Las dimensiones de la imagen son: " + alto + "x" + ancho);
end
