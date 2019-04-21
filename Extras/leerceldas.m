function [valor,rngObj]=leerceldas(exlSheet1,rango)
% esta función realizá la lectura del rango de celdas que se especifiquen
% en la varibale rango
rngObj = exlSheet1.Range(rango);
valor=rngObj.Value;
if (size(valor,1)> 1)||(size(valor,2)> 1)
    valor=reshape([valor{:,:}],size(valor));
end