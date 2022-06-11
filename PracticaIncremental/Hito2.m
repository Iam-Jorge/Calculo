clc;
clear;
% Cargar las imagenes del Hito2 %
asteroideHito2=imread('Hito2/asteroideHito2.jpg');
referenciaHito2=imread('Hito2/referenciaHito2.jpg');

% Mosaico de la imagen del asteroide %
[alto, ancho]=size(asteroideHito2);
[altoRef, anchoRef]=size(referenciaHito2);
particion = altoRef;
nBloquesVerticales = floor(alto/particion);
nBloquesHorizonales = floor(ancho/particion);

hogReferenciaHito2=HOG(referenciaHito2);
hogMosaico=zeros(nBloquesVerticales*nBloquesHorizonales+1,length(hogReferenciaHito2));
Index = 1;

for fila=1:+particion:nBloquesVerticales*particion
    for columna=1:+particion:nBloquesHorizonales*particion
      
    ultimaFila = fila + particion - 1;
    ultimaColumna = columna + particion - 1;

    temp = asteroideHito2(fila:ultimaFila,columna:ultimaColumna,:);
    subplot(nBloquesVerticales,nBloquesHorizonales,Index);
    imshow(temp);
    temp2 = transpose(temp);
    hogTemp=HOG(temp2);

    for i=1:length(hogTemp)
        hogMosaico(Index,i)=hogTemp(1,i);
    end
    Index = Index + 1;
    
    end
end

% Imagen temporal %
imagenTemporal=asteroideHito2;

% Sustituir el vertice superior izquierdo del asteroide por la imagen de referencia %
figure1 = figure('NumberTitle', 'off', 'Name', 'Sustituir el vertice superior izquierdo del asteroide por la imagen de referencia');
for i=1:size(referenciaHito2,1)
    for j=1:size(referenciaHito2,2)
        imagenTemporal(i,j)=referenciaHito2(i,j);
    end
end
% Mostramos la imagen %
imshow(imagenTemporal);
grid on

% Implementar la funcion de similitud de coseno %
for i=1:Index-1
sumaAB=0; %A*B%
sumaA=sumaAB; %A^2%
sumaB=sumaA; %B^2%
    for j=1:size(hogMosaico,2)
        sumaAB=sumaAB+hogMosaico(i,j)*hogReferenciaHito2(1,j);
        sumaA=sumaA+hogMosaico(i,j)^2;
        sumaB=sumaB+hogMosaico(i,j)^2;
    end
    coseno(i)=sumaAB/(sqrt(sumaA)*sqrt(sumaB));
    distancia(i)=1-coseno(i);
end

% Obtener la distancia mas pequeña %
menorDistancia = distancia(1);
posicionMasParecida = 0;
for i=2:(length(distancia))
    if menorDistancia > distancia(i)
       menorDistancia = distancia(i);
       posicionMasParecida = i;
    end
end

% Posicion del mosaico en la que se encuentra la zona con mayor similitud %
mosaico=zeros(nBloquesVerticales,nBloquesHorizonales);
filaMosaico=0;
columnaMosaico=0;
posicion=1;
for fila=1:size(mosaico,1)
    for columna=1:size(mosaico,2)
        if (posicion==posicionMasParecida)
            filaMosaico=fila-1;
            columnaMosaico=columna; 
            break;
        end
        posicion=posicion+1;
    end
end

% Figura en la que se remarca la zona con mayor similitud %
figure2 = figure('NumberTitle', 'off', 'Name', 'Particion del mosaico mas parecida a la imagen de referencia');
    imshow(asteroideHito2)
    hold on;
    plot(columnaMosaico*200, filaMosaico*200, 'or', 'LineWidth', 2, 'MarkerSize', 5);
    plot(columnaMosaico*200, filaMosaico*200-200, 'or', 'LineWidth', 2, 'MarkerSize', 5);
    plot(columnaMosaico*200-200, filaMosaico*200, 'or', 'LineWidth', 2, 'MarkerSize', 5);
    plot(columnaMosaico*200-200, filaMosaico*200-200, 'or', 'LineWidth', 2, 'MarkerSize', 5);
    x=[columnaMosaico*200 columnaMosaico*200 columnaMosaico*200-200 columnaMosaico*200-200 columnaMosaico*200];
    y=[filaMosaico*200 filaMosaico*200-200 filaMosaico*200-200 filaMosaico*200 filaMosaico*200];
    plot(x,y,'r+-','LineWidth',2);
grid on

uistack(figure1, 'up', 1)
uistack(figure2, 'down', 1)

