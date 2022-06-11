%Sesion 1 ejercicio 4%
%RDibujar un hexagono%

p1=[0;1]; %Vector columna para poder multiplicar%

alfa=pi/3;
%Matriz de rotacion%
rotacion=[cos(alfa) sin(alfa); -sin(alfa) cos(alfa)];

p2=rotacion*p1;
p3=rotacion*p2;
p4=rotacion*p3;
p5=rotacion*p4;
p6=rotacion*p5;

x=[p1(1) p2(1) p3(1) p4(1) p5(1) p6(1) p1(1)];
y=[p1(2) p2(2) p3(2) p4(2) p5(2) p6(2) p1(2)];

plot(x,y,'r+-','LineWidth',7);  