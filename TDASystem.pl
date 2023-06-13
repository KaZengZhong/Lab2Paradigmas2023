
% TDA system - constructor
% Constructor de un sistema
system(Nombre, system(Nombre, Fecha, nada, nada, [], [])) :-
    get_time(Timestamp),
    stamp_date_time(Timestamp, DateTime, local),
    format_time(string(Fecha), '%Y-%m-%d', DateTime).

% TDA system - addDrive
% Añade una unidad al sistema
systemAddDrive(system(Nombre, Fecha, UnidadActual, UsuarioLogueado, Usuarios, Unidades), Letra, NombreUnidad, Capacidad,
               system(Nombre, Fecha, UnidadActual, UsuarioLogueado, Usuarios, [unidad(Letra,NombreUnidad,Capacidad)|Unidades])) :-
    string_length(Letra, 1),
    not(member(unidad(Letra, _, _), Unidades)).

% TDA system - register
% Añade un usuario al sistema
systemRegister(system(Nombre, Fecha, UnidadActual, UsuarioLogueado, Usuarios, Unidades), NombreUsuario,
               system(Nombre, Fecha, UnidadActual, UsuarioLogueado, [usuario(NombreUsuario)|Usuarios], Unidades)) :-
    not(member(usuario(NombreUsuario),Usuarios)).

% TDA system - login
% Inicia sesion al sistema
systemLogin(system(Nombre, Fecha, UnidadActual, _, Usuarios, Unidades), NombreUsuario,
            system(Nombre, Fecha, UnidadActual, usuario(NombreUsuario), Usuarios, Unidades)):-
    member(usuario(NombreUsuario), Usuarios).

% TDA system - logout
% Cierra sesion
systemLogout(system(Nombre, Fecha, _, _, Usuarios, Unidades), system(Nombre, Fecha, nada, nada, Usuarios, Unidades)).

% TDA system - switch-drive
% Fija la unidad en que se esta trabajando
systemSwitchDrive(system(Nombre, Fecha, _, UsuarioLogueado, Usuarios, Unidades), Letra,
                  system(Nombre, Fecha, unidad(Letra, _, _), UsuarioLogueado, Usuarios, Unidades)) :-
    UsuarioLogueado \= none,
    member(unidad(Letra, _, _), Unidades).

