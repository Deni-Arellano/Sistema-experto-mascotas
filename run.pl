% ========================================
% ARCHIVO DE EJECUCIÓN AUTOMÁTICA
% ========================================
% Carga todos los módulos e inicia automáticamente

:- initialization(main_init).

main_init :-
    consult('mascotas.pl'),
    consult('respuestas.pl'),
    consult('preguntas.pl'),
    consult('reglas.pl'),
    consult('inferencia.pl'),
    consult('utilidades.pl'),
    inicio,
    halt.
