function [y] = DeriApro(f,a,h)
% Crear una funcion que nos devuelva la derivada de una funcion en un punto
y=(f(a+h)-f(a))/h;
end