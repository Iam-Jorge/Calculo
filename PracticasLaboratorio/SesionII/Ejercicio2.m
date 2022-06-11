% Mostrar de 1 en 1 los elementos de una matriz
A=[1,2,3;4,5,6];
for i=1:size(A,1) % size(A,1) tamaño filas
    for j=1:size(A,2) % size(A,2) tamaño columnas
        disp(A(i,j));
    end
end
A(i,j) % ultimo elemento