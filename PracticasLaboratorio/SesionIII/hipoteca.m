function [H] = hipoteca(C,i,n)
%Esta función calcula la tabla de amortización de una hipoteca%
H=C*(i*(i+1)^n)/((i+1)^n-1);
end