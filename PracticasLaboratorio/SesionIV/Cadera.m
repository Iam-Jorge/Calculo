% Practica de operacion de cadera.
% Cargamos los datos de un fichero excel y los almacenamos
% en un vector que llamamos T y cuyas componetes nos 
% indican el dia del fallecimiento DEL paciente.

T=xlsread('datosmortalidad.xls');

% Dibujamos la funcion de distribucion empirica
F=[];
n = length(T);
for i=1:n
    F(i)=i/248;
end

subplot(2,2,1)
plot(T,F,'LineWidth', 2)
title(" Funcion de distribucion empirica ")
legend()

% Construimos el vector funcion de densidad
fd=[];
for i=2:n-1
    fd(i)=(F(i+1)-F(i-1))/(T(i+1)-T(i-1));
end
% Definir la primera y la ultima componente
fd(1)=(F(2)-F(1))/(T(2)-T(1));
fd(n)=(F(n)-F(n-1))/(T(n)-T(n-1));

subplot(2,2,3)
plot(T,fd,'LineWidth', 1)
title(" Funcion de densidad ")

% Funcion de densidad con orden de alisamiento 3
% Bajamos los picos
fd3=[];
for i=2:n-1
    fd3(i)=(fd(i-1)+fd(i)+fd(i+1))/3;
end
fd3(1)=(fd(i)+fd(i+1))/2;
fd3(n)=(fd(i-1)+fd(i))/2;
subplot(2,2,2)
plot(T,fd3,'LineWidth', 1)
title(" Funcion de densidad con alisamiento 3")

% Funcion de densidad con orden de alisamiento 5
fd5=[];
for i=3:n-2
    fd5(i)=(fd(i-2)+fd(i-1)+fd(i)+fd(i+1)+fd(i+2))/5;
end
fd5(1)=fd3(1);
fd5(2)=(fd(i-1)+fd(i)+fd(i+1)+fd(i+2))/4;
fd5(n-1)=(fd(i-2)+fd(i-1)+fd(i)+fd(i+1))/4;
fd5(n)=fd3(n);
subplot(2,2,4)
plot(T,fd5,'LineWidth', 1)
title(" Funcion de densidad con alisamiento 5")

% Ponemos la grafica de fd5 en una figura aparte
figure
plot(T,fd5);
title(" Funcion de densidad con alisamiento 5")
xlabel("Tiempo")
grid on
