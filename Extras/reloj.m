function t=Reloj(periodo,archivo)

% Configuraci�n del reloj
% Crear reloj
t=timer('period',periodo);
t.ExecutionMode='fixedrate';
t.StartDelay=0.5;
t.timerfcn=archivo; % Modificar el nombre del archivo a correr