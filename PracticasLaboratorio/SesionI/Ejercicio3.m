%Sesion 1 ejercicio 3%

%Rotar el cuadrado del ejercicio 1 un angulo de pi/4%

p1=[1;1];
p2=[1;-1];
p3=[-1;-1];
p4=[-1;1];

alfa=pi/4;
rotacion=[cos(alfa) sin(alfa); -sin(alfa) cos(alfa)];

p1New=rotacion*p1;
p2New=rotacion*p2;
p3New=rotacion*p3;
p4New=rotacion*p4;

x=[p1New(1) p2New(1) p3New(1) p4New(1) p1New(1)];
y=[p1New(2) p2New(2) p3New(2) p4New(2) p1New(2)];

plot(x,y,'r+-','LineWidth',7);  