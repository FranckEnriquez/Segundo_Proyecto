
celdas=['B' num2str(j) ':C' num2str(j) ];
[valor,objsesion]=leerceldas(objhoja,celdas);
celdas=['D' num2str(j) ':D' num2str(j) ];
escribirceldas(objhoja,[],celdas,valor(1,2)^2);
valor=[valor valor(1,2)^2];
disp(valor)
j=j+1;