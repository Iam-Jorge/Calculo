%Practica de los pinos%

%Cargamos lo datos del fichero xls%
datos=xlsread('EvolucionPinosMichigan.xls');

%t Instante done se mide el porcentaje de pinos%
%P1 y P2 porcentaje de pinos P1%

t=datos(:,2);
P1=datos(:,3);
P2=datos(:,4);
% Multiplicamos por 100 para que nos de el tanto por cien%
P3=Implicita(t,0.05,0.2,0.534)*100;
P4=Implicita(t,0.005,0.1,0.534)*100;
P5=Implicita(t,0.05,0.1,0.534)*100;

hold on
plot(t,P1,'g o-')
% plot(t,P2,'r *-')
plot(t,P3,'*--b')
plot(t,P4,'s--m')
plot(t,P5,'d--k')
xlabel('Tiempo')
ylabel('Porcentaje de pinos')

figure
    plot(t,P2,'r *-')
grid on
