%Sesion 1 ejercicio 2%
%Rotar el punto p1(1,0) un angulo alfa=pi/2

p1=[1;0]; %Vector columna para poder multiplicar%

alfa=pi/2;
%Matriz de rotacion%
rotacion=[cos(alfa) sin(alfa); -sin(alfa) cos(alfa)];

p2=rotacion*p1;