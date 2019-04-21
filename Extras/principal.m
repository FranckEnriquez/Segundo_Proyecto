% scrpit principal
clear all;
close all;
clc;

%ruta='C:\Users\Riemann\Documents\MATLAB\MIA_O2013\3\TiempoReal\datos.xls';
ruta=[ pwd '\datos.xls'];
hoja='Hoja1';
[objcon,objarchivo,objlibro,objhoja]=conexion(ruta,hoja);
inicializacion;
cuadrado;

%clock=reloj(1,'cuadrado');