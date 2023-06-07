% TDA system - constructor
% Funcion para crear un sistema
system(Nombre, Sistema) :-
    get_time(Timestamp),
    stamp_date_time(Timestamp, DateTime, local),
    format_time(atom(FechaCreacion), '%Y-%m-%d', DateTime),
    Sistema = carpeta(Nombre, FechaCreacion, []),
    assertz(Sistema).

:- dynamic unidad/4.
% Añade una unidad al sistema
systemAddDrive(Sistema, NombreUnidad, Etiqueta, Capacidad, NuevoSistema) :-
    not(unidad(NombreUnidad, _, _, _)),
    assertz(unidad(NombreUnidad, Etiqueta, Capacidad, [])),
    retract(Sistema),
    Sistema = carpeta(Nombre, FechaCreacion, Contenidos),
    NuevoSistema = carpeta(Nombre, FechaCreacion, [NombreUnidad|Contenidos]),
    assertz(NuevoSistema).
