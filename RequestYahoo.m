%     Métodos Inteligencia Artificial 
%         ITESO Primavera 2019
%
%     Francisco Javier Enriquez Muñoz
%       Abraham Rodríguez Vázquez
%    Axel Francisco Munguía Quintero
%
% Segundo proyecto: "Smart Moving Averages" 
%--------------------------------------------------------------------------
%        Función auxiliar para generar request GET a servidores
%            de yahoo finance para obtener precios de activos
%--------------------------------------------------------------------------
% Parametros:
%   *Frecuencia: 'd' = daily, 'w'=weekly, 'm'= monthly  
%   * Tipo_dato: 'history' = historical prices, 'div' = dividends, 'split' = stock splits
%   * Activo: Simbolo del activo como string, e.g. 'BTC'
%   * Fecha_Inicio: Inicio de los datos en formato datestr() e.g. '2017-07-04'
%   * Fecha_Fin: Tope de los datos en mismo formato anterior
% Salidas:
%   * Response: Datos solicitados en tipo structura
function Response = RequestYahoo(Activo, Fecha_Inicio, Fecha_Fin, Frecuencia, Tipo_dato)
   
    % Convertir a formato de fecha UNIX
    t = datetime(Fecha_Inicio);
    Fecha_Inicio = posixtime(t);
    t = datetime(Fecha_Fin);
    Fecha_Fin = posixtime(t);

    % Armar URL de request
    url = ['https://query1.finance.yahoo.com/v7/finance/download/',Activo,'?period1=',num2str(Fecha_Inicio),'&period2=',num2str(Fecha_Fin),'&interval=1',Frecuencia,'&events=',Tipo_dato,'&crumb=WoTu8cwg8VU'];

    % Enviar request y recibir response
    Response = webwrite(url,'api_key');

end