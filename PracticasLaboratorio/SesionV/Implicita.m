function [P] = Implicita(t,a,k,P0)
% Vamos a crear una funcion que nos devuelva el vector P cuyas componentes 
% nos indican la proporcion de pinos en cada instante de acuerdo a mi 
% modelo (resolucion de la EDO en cada instante)

% Variables de entrada %
% El vector tiempo%
% constante a %
% constante k %
% P0 proporcion inicial para calcular C%

% Variables de salida%
% Vector P cuyas componentes nos indican la proporcion %
% de pinos en cada instante de acuerd a mi modelo %

% Calculamos la solucion implicita %
C=1/k*(log(abs(a*P0-k))-log(abs(P0)));
% Calcular el vector P en funcion de las varibles de entrada%

n = length(t);
for i=1:n
    f=@(P) 1/k*(log(abs(a*P-k))-log(abs(P)))-C-t(i);

    P(i)=fzero(f,0.5) 
    % P(i) son proporciones por tanto las componentes de %
    % P(i) estaran entre 0-1 %
end

