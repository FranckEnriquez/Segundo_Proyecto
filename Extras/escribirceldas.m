function escribirceldas(exlSheet1,sesion,rango,valor)
% esta funci�n realiz� la escritura del rango de celdas que se especifiquen
% en la varibale rango
if isempty(sesion)
rngObj = exlSheet1.Range(rango);
rngObj.Value=valor;
else
    sesion.Value=valor;
end