function [exl,exlFile,exlWkbk,exlSheet1] = conexion (ruta,hoja)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Función que realiza conexión de Excel con Matlab, Matlab tiene el control
% del archivo de excel, por lo que es necesario que el usuario no cierre el
% documento de excel hasta que matlab lo deje usar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



exl=actxserver('excel.application');
exl.Visible=1;
exlWkbk=exl.Workbooks;

% ACTUALIZAR LA RUTA DEL ARCHIVO CREADO, HOJA A LEER Y RANGO DE CELDAS A
% LEER

exlFile=exlWkbk.Open(ruta);
%exlFile=exlWkbk.Open('C:\Users\Riemann\Documents\MATLAB\MIA_O2013\3\TiempoReal\BIMBO.xls');
exlSheet1=exlFile.Sheets.Item(hoja);
%dat_range='E12:E12';
%rngObj = exlSheet1.Range(dat_range);
%valor=rngObj.Value;