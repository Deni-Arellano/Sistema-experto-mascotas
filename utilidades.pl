% ========================================
% FUNCIONES AUXILIARES
% ========================================
% Propósito: Contener funciones de utilidad para el sistema.
% Validación de respuestas, separadores, etc.

% ========================================
% VALIDACIÓN DE RESPUESTAS
% ========================================

% Validar respuestas sí/no
validar_si_no(si).
validar_si_no(no).

% ========================================
% FUNCIONES DE PRESENTACIÓN
% ========================================

% Mostrar un separador de sección
separador :-
    write('========================================'), nl.

% Mostrar línea separadora simple
linea :-
    write('----------------------------------------'), nl.

% ========================================
% FUNCIÓN MEMBER (si no está disponible)
% ========================================
% Verificar si un elemento está en una lista
member(X, [X|_]).
member(X, [_|T]) :-
    member(X, T).
