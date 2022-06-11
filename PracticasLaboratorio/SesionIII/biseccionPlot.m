% Procedimiento para calcular una raíz de la función%
function [raiz] = biseccionPlot(f,a,b,epsilon)
% Funcion que aplica el metodo de la biseccion para encontrar una
% raiz(solucion) de una funcion en un intervlo [a,b] detal manera
% que la solucion dada tenga un error < epsilon%

x=a:0.1:1.2;
y=f(x);

fa=f(a);
fb=f(b);

    if(fa*fb>=0)
        disp('No se puede aplicar el metodo de la biseccion ')
    else
        while(abs(b-a)>=epsilon)
            [a,b]=divideIntervalo(f,a,b);
        end
        raiz=(a+b)/2;
    end

% Dibuja la funcion en el intervalo y la raiz aproximada %

hold on
plot(x,y);
plot(raiz,f(raiz),'o');
hold off

end

