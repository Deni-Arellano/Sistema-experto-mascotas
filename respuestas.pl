% ========================================
% MANEJO DE RESPUESTAS DEL USUARIO
% ========================================
% Propósito: Almacenar y gestionar respuestas dinámicamente.
% Las respuestas se guardan para ser consultadas por las reglas.

% Declarar respuesta como predicado dinámico
:- dynamic respuesta/2.

% Limpiar todas las respuestas anteriores
limpiar_respuestas :-
    retractall(respuesta(_, _)).

% Almacenar una respuesta
guardar_respuesta(Pregunta, Valor) :-
    assert(respuesta(Pregunta, Valor)).
