:- consult('mascotas.pl').
:- consult('respuestas.pl').
:- consult('preguntas.pl').
:- consult('reglas.pl').
:- consult('inferencia.pl').
:- consult('utilidades.pl').


inicio :-
    write('========================================'), nl,
    write('SISTEMA EXPERTO DE RECOMENDACIÓN DE MASCOTAS'), nl,
    write('========================================'), nl, nl,
    limpiar_respuestas,
    hacer_preguntas,
    nl,
    recomendar,
    nl,
    write('========================================'), nl,
    write('¿Deseas realizar otra consulta? (si/no)'), nl,
    read(Opcion),
    (Opcion = si -> inicio ; write('Gracias por usar el sistema.'), nl, halt).
