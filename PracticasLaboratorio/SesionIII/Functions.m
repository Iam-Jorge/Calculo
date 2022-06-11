% Una función en Matlab es un procedimiento de cálculo por el que a partir% 
% de unos argumentos de entrada se obtienen otros de salida.%

% El nombre de la funcion debe ser el mismo que el archivo guardado%
% Nombres sin espacios mayus...%
% Las funciones se pueden llamar desde:
    % Command windows ejemplo: [a,b]=SM(3,4) llamada a una funcion con
    % varias salidas
    % Un script
    % Desde otra funcion%

%function [Args salida] = nombreFuncion(Args entrada)%
% Detalles sobre la funcion%
% Lineas de sentencia%
%end%

function [outputArg1,outputArg2] = Functions(inputArg1,inputArg2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

% Las funciones anónimas %
% Nos permiten definir una función simple sin necesidad de crearla y 
% guardarla en un fichero .m. Se pueden definir :
    % En la ventana de comandos
    % En un fichero script 
    % Dentro de otra función

% Sintaxis: variableSalida=@(Args entrada)expresion
% Ejemplo declaracion: f=@(x)(x^2+2*x+5) %
% Ejemplo llamada f(0.5)











