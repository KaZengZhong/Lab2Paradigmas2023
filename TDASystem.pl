% TDA system - constructor
% Funcion para crear un sistema
system(Nombre, Sistema) :-
    get_time(Timestamp),
    stamp_date_time(Timestamp, DateTime, local),
    format_time(atom(FechaCreacion), '%Y-%m-%d', DateTime),
    Sistema = carpeta(Nombre, FechaCreacion, []),
    assertz(Sistema).
