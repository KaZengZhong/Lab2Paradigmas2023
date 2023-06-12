
% TDA system - constructor
% Predicado constructor de un sistema
system(Nombre, system(Nombre, Fecha, [])) :-
    get_time(Timestamp),
    stamp_date_time(Timestamp, DateTime, local),
    format_time(string(Fecha), '%Y-%m-%d', DateTime).

% TDA system - addDrive
% Predicado añadidor de una unidad al sistema
systemAddDrive(system(Nombre, Fecha, Unidades), Letra, NombreUnidad, Capacidad,
               system(Nombre, Fecha, [unidad(Letra,NombreUnidad,Capacidad)|Unidades])) :-
               string_length(Letra, 1),
               not(member(unidad(Letra, _, _), Unidades)).
