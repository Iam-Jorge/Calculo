% Dibujar la grafica del la funcion y=|x| en [-1,1]

x=-1:0.1:1;
y=[]; % y es un vector, definamos sus componentes

for i=1:length(x)
    if x(i)>=0
        y(i)=x(i);
    else
        y(i)=-x(i);
    end
end

plot(x,y,'r * -');