%     Métodos Inteligencia Artificial 
%         ITESO Primavera 2019
%
%     Francisco Javier Enriquez Muñoz
%       Abraham Rodríguez Vázquez
%    Axel Francisco Munguía Quintero
%
% Segundo proyecto: "Smart Moving Averages" 
%--------------------------------------------------------------------------
% Función auxiliar para descargar una sola vez y guardar localmente
%   los datos diarios de cierre ajustado y volumen de los indices
%       Erostoxx, Jones Americano e Ibex 35 como archivo .mat
%--------------------------------------------------------------------------
function DescargarDatos()

    % Obtener fecha de hoy en formato de tipo "23" corresponde a 'mm/dd/yyyy'
    hoy = datestr(date,23);

    % Obtener la fecha de hace dos años en formato serial 
    % (número de dias desde el 0 de enero del 2000)
    inicio = datestr(datenum(date)-(365*2),23);

    % Obtener fecha de hace 20 dias correspondiente al 1 de abril 
    fin = datestr(datenum(date)-20,23);

    % Obtener los precios de cierre del ultimo año del precio de Eurostoxx
    Datos_EURO = RequestYahoo('STOXX50E',inicio,fin,'d','history');
    precio_EURO = Datos_EURO.AdjClose; 
    volumen_EURO = Datos_EURO.Volume;

    % Obtener datos de Dow Jones
    Datos_DOW = RequestYahoo('DJI',inicio,fin,'d','history');
    precio_DOW = Datos_DOW.AdjClose; 
    volumen_DOW = Datos_DOW.Volume;

    % Obtener datos de IBEX
    Datos_IBEX = RequestYahoo('IBEX',inicio,fin,'d','history');
    precio_IBEX = Datos_EURO.AdjClose; 
    volumen_IBEX = Datos_EURO.Volume;

    % Guardar localmente los datos de precios como archivo .mat
    save('Datos_global');

end

