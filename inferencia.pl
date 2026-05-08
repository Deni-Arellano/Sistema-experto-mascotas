% -*- coding: utf-8 -*-
% ========================================
% MOTOR DE INFERENCIA
% ========================================
% Propósito: Determinar mascotas válidas, mascotas descartadas,
% y mostrar el resultado final de la recomendación.

% ========================================
% LÓGICA PRINCIPAL DE INFERENCIA
% ========================================

% Una mascota es recomendada si:
% 1. Existe en la base de datos de mascotas
% 2. NO ha sido descartada por ninguna regla
recomendada(Mascota) :-
    mascota(Mascota),
    \+ descartar(Mascota).

% ========================================
% PROCESO DE RECOMENDACIÓN
% ========================================

% Ejecutar el proceso de inferencia y mostrar resultados
recomendar :-
    findall(M, recomendada(M), Lista),
    mostrar_resultado(Lista).

% ========================================
% MOSTRAR RESULTADOS
% ========================================

% Caso 1: Ninguna mascota es compatible
mostrar_resultado([]) :-
    write('RESULTADO: No se recomienda ninguna mascota.'), nl,
    write('Las condiciones especificadas son muy restrictivas.'), nl,
    write('Por favor, revisa tus respuestas.'), nl.

% Caso 2: Solo una mascota es compatible
mostrar_resultado([Mascota]) :-
    write('✓ RECOMENDACIÓN: '), nl,
    write('La mascota más adecuada para ti es: '),
    format('~w~n', [Mascota]).

% Caso 3: Varias mascotas son compatibles
mostrar_resultado(Lista) :-
    length(Lista, Cantidad),
    Cantidad > 1,
    write('✓ RECOMENDACIÓN: '), nl,
    write('Las siguientes mascotas son compatibles con tus características:'), nl,
    mostrar_lista(Lista).

% ========================================
% FUNCIONES AUXILIARES DE PRESENTACIÓN
% ========================================

% Mostrar lista de mascotas con formato
mostrar_lista([]).

mostrar_lista([Mascota | Resto]) :-
    format('  • ~w~n', [Mascota]),
    mostrar_lista(Resto).

% Obtener mascotas descartadas (para debugging)
descartadas_por_usuario(ListaDescartadas) :-
    findall(M, (mascota(M), descartar(M)), ListaDescartadas).
