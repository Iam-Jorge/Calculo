% Practica de las ballenas

% Tenemos dos vectores, vector tiempo (t) y vector poblacion (p)
% 1. Construyamos el vector ttiempo (t) de manera recursiva
inct=0.25;
n=25/inct;
t(1)=2013;
for i=1:n
    t(i+1)=t(i)+inct
end
% 2. Construyamos el vector poblacion (p)
% El vector p dependera de la politaca de pesca utilizada
% En todos los casos la t.natalidad y t.mortalidad son iguales

N=2485/22500; % T.Natalidad
Mn=1125/22500; % T.Mortalidad

% Calculamos la poblacion de ballenas
% Politica I (pescar 0 ballenas en todos los instantes)
P1(1)=22500;
for i=1:n
    Mp(i)=0;
    P1(i+1)=P1(i)+((N-Mn)*P1(i)-Mp(i))*inct
end
% Politica II (pescar 3000 ejemplares)
P2(1)=22500;
for i=1:n
    Mp(i)=3000;
    P2(i+1)=P2(i)+((N-Mn)*P2(i)-Mp(i))*inct
end
% Politica III (pescar 10% de los ejemplares existentes)
P3(1)=22500;
for i=1:n
    Mp(i)=0.1*P3(i);
    P3(i+1)=P3(i)+((N-Mn)*P3(i)-Mp(i))*inct
end
% Politica IV (Maximo entre el 10% y 2000 de los ejemplares)
P4(1)=22500;
for i=1:n
    Mp(i)=max(0.1*P4(i),2000);
    P4(i+1)=P4(i)+((N-Mn)*P4(i)-Mp(i))*inct
end
hold on % todas la graficas aparecen en la misma figura
    a1 = plot(t,P1, 'r'); p1 = "Politica I";
    a2 = plot(t,P2, 'b'); p2 = "Politica II";
    a3 = plot(t,P3, 'k'); p3 = "Politica III";
    a4 = plot(t,P4, 'g'); p4 = "Politica IV";
    legend([a1,a2,a3,a4], [p1,p2,p3,p4]);
    title('Evolucion ballenas')
    xlabel('Tiempo')
    ylabel('Ballenas')
hold off

