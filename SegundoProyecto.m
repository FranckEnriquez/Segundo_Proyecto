%     M�todos Inteligencia Artificial 
%         ITESO Primavera 2019
%
%     Francisco Javier Enriquez Mu�oz
%       Abraham Rodr�guez V�zquez
%    Axel Francisco Mungu�a Quintero
%
% Segundo proyecto: "Smart Moving Averages" 
%--------------------------------------------------------------------------
%                   Script principal del proyecto
%--------------------------------------------------------------------------
% Ejecutar una sola vez la funcion DescargarDatos.m
%DescargarDatos();

% Cargar dataset guardado localmente 
load('Datos_global.mat');

%% Parte 1: Preprocesado de datos

% Par�metros
Ventana_MA_Mayor = 20; % Dias para calcular ventana de medias m�viles con reacci�n lenta
Ventana_MA_Menor = 3; % Dias para calcular ventana de medias m�viles con reacci�n r�pida
numDatos = length(Datos_EURO); % N�mero de datos de precios

% Inicializar vectores para medias moviles de precios de cierre ajustados
MA_EURO_slow = zeros(numDatos,1);
MA_DOW_slow = zeros(numDatos,1);
MA_IBEX_slow = zeros(numDatos,1);

% Computar medias m�viles lentas
for i = 0:numDatos - Ventana_MA_Mayor

    MA_EURO_slow(Ventana_MA_Mayor + i) = mean(precio_EURO(i+1:Ventana_MA_Mayor+i));
    MA_DOW_slow(Ventana_MA_Mayor + i) = mean(precio_DOW(i+1:Ventana_MA_Mayor+i));
    MA_IBEX_slow(Ventana_MA_Mayor + i) = mean(precio_IBEX(i+1:Ventana_MA_Mayor+i));
    
end

% Inicializar vectores para medias moviles de precios de cierre ajustados
MA_EURO_fast = zeros(numDatos,1);
MA_DOW_fast = zeros(numDatos,1);
MA_IBEX_fast = zeros(numDatos,1);

% Computar medias m�viles r�pidas
for i = 0:numDatos - Ventana_MA_Menor

    MA_EURO_fast(Ventana_MA_Menor + i) = mean(precio_EURO(i+1:Ventana_MA_Menor+i));
    MA_DOW_fast(Ventana_MA_Menor + i) = mean(precio_DOW(i+1:Ventana_MA_Menor+i));
    MA_IBEX_fast(Ventana_MA_Menor + i) = mean(precio_IBEX(i+1:Ventana_MA_Menor+i));
    
end

% Generar se�ales de compra y venta cuando ambas medias moviles se cruzan 
Dif_EURO = MA_EURO_slow - MA_EURO_fast;
Dif_DOW = MA_DOW_slow - MA_DOW_fast;
Dif_IBEX = MA_IBEX_slow - MA_IBEX_fast;

% Encontrar cuando se cruzan las medias moviles
cruce_EURO = Dif_EURO == 0;
cruce_DOW = Dif_DOW == 0;
cruce_IBEX = Dif_IBEX == 0;

% Inicializar vectores de se�ales por default HOLD [0]
signal_EURO = zeros(numDatos,1);
signal_DOW = zeros(numDatos,1);
signal_IBEX = zeros(numDatos,1);

% El tipo de se�al de compra [1] o venta [-1] en el cruce lo da el signo
% de la pendiente de la media movil r�pida en el punto de cruce
signal_desplazada = [cruce_EURO(2:end);0];
signal_EURO(cruce_EURO) = sign(MA_EURO_fast(cruce_EURO) - MA_EURO_fast(signal_desplazada));

signal_desplazada = [cruce_DOW(2:end);0];
signal_DOW(cruce_DOW) = sign(MA_DOW_fast(cruce_DOW) - MA_DOW_fast(signal_desplazada));

signal_desplazada = [cruce_IBEX(2:end);0];
signal_IBEX(cruce_IBEX) = sign(MA_IBEX_fast(cruce_EURO) - MA_IBEX_fast(signal_desplazada));

