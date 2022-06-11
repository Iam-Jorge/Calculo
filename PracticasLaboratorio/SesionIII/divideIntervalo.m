function [aNew,bNew] = divideIntervalo(f,a,b)
% La sigueinte funcion dividira el intervalo inicial en otro que sera la 
% mitad y contiene la solucion%

m=a+b/2; % Punto medio %
fa=f(a); % Evaluo la funcion en el punto a %
fm=f(m); % Evaluo la funcion en el punto m %

if(fa*fm<0)
    aNew = a;
    bNew = m;
elseif(fa*fm>0)
    aNew = m;
    bNew = b;
else
    aNew=m;
    bNew=m;
end 

end