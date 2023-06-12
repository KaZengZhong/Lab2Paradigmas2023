
% TDA system - constructor
% Constructor de un sistema
system(Nombre, system(Nombre, Fecha, [], [])) :-
    get_time(Timestamp),
    stamp_date_time(Timestamp, DateTime, local),
    format_time(string(Fecha), '%Y-%m-%d', DateTime).

% TDA system - addDrive
% Añade una unidad al sistema
systemAddDrive(system(Nombre, Fecha, Usuarios, Unidades), Letra, NombreUnidad, Capacidad,
               system(Nombre, Fecha, Usuarios, [unidad(Letra,NombreUnidad,Capacidad)|Unidades])) :-
    string_length(Letra, 1),
    not(member(unidad(Letra, _, _), Unidades)).

% TDA system - register
% Añade un usuario al sistema
systemRegister(system(Nombre, Fecha, Usuarios, Unidades), NombreUsuario,
               system(Nombre, Fecha, [usuario(NombreUsuario)|Usuarios], Unidades)) :-
    not(member(usuario(NombreUsuario),Usuarios)).

