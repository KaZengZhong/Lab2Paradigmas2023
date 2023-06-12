
% TDA system - constructor
% Funcion para crear un sistema
system(Nombre, system(Nombre, Fecha)) :-
    get_time(Timestamp),
    stamp_date_time(Timestamp, DateTime, local),
    format_time(string(Fecha), '%Y-%m-%d', DateTime).
