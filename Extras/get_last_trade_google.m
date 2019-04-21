%Funcion que descarga las cotizaciones historicas de Google Finance.
%
%El dato devuelto es el precio publicado desde el ticker de google finance
%
%Ejemplo: 
%[last_trade]=get_last_trade_google('BMV:CEMEXCPO');
function [last_trade]=get_last_trade_google(subyacente)
    
%     %Tratamiento de las fechas
%     startDate = datenum(sDate);
%     endDate = datenum(eDate);
%     startDate = datestr(startDate,23);
%     monthStartDate = num2str(round(str2double(startDate(1:2))-1));
%     endDate = datestr(endDate,23);
%     monthEndDate = num2str(round(str2double(endDate(1:2))-1));
    
    %Construyo la URL de Yahoo Finance de la descarga del fichero CSV
%     urlstr = ['https://es-us.finanzas.yahoo.com/q?s=',subyacente];
%     urlstr = ['https://es-us.finanzas.yahoo.com/quote/' subyacente '?ltr=1'];
    urlstr = ['https://www.google.com/finance?q=' subyacente];
    data = urlread(urlstr);

    % Busco las cadenas 
%     lugar=strfind(data,'data-reactid="241"');
    lugar=strfind(data,'/finance?q=');
    %selecciono la cadena donde esta el precio
    cadena=data(lugar(3):lugar(3)+100);
    % busco los caracteres ,
    ind1 = strfind(cadena,',p:"');
    ind2 = strfind(cadena,',cid:');
    precio=cadena(ind1+4:ind2-2);
    last_trade=str2double(precio);
    ndigits=size(last_trade,2);
    last_tradetemp=0;
    for ctemp=0:ndigits-1
        last_tradetemp=last_tradetemp+last_trade(ndigits-ctemp)*10^(3*ctemp);
    end
    last_trade=last_tradetemp;
end
