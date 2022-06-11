function [B] = Msumf(A,i,j,lambda)
%Funcion que suma a la fila i la j multiplicada por lambda%
%A=[1 0 -1;1 1 1;2 0 -2]%
% i=3
% j=1
% lambda=-2
B=A;
B(i,:) = B(i,:) + lambda * B(j,:);
end