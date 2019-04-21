function t=Reloj(periodo,archivo)

% Configuración del reloj
% Crear reloj
t=timer('period',periodo);
t.ExecutionMode='fixedrate';
t.StartDelay=0.5;
t.timerfcn=archivo; % Modificar el nombre del archivo a correr