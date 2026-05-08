hacer_preguntas :-
    separador,
    write('NIVEL 1: RESTRICCIONES CRÍTICAS'), nl,
    separador,
    preguntar_alergias,
    preguntar_espacio,
    preguntar_ninos,
    preguntar_otras_mascotas,
    nl,
    separador,
    write('NIVEL 2: CAPACIDAD DE CUIDADO'), nl,
    separador,
    preguntar_tiempo,
    preguntar_presupuesto,
    preguntar_experiencia,
    preguntar_limpieza,
    preguntar_responsabilidad,
    nl,
    separador,
    write('NIVEL 3: ESTILO DE CONVIVENCIA'), nl,
    separador,
    preguntar_actividad,
    preguntar_convivencia,
    nl,
    separador,
    write('NIVEL 4: PREFERENCIAS SECUNDARIAS'), nl,
    separador,
    preguntar_ruido,
    preguntar_veterinario,
    preguntar_mascota_sola,
    preguntar_interaccion,
    preguntar_independencia,
    preguntar_olores.


% NIVEL 1: RESTRICCIONES CRÍTICAS

% 1.1 Alergias
preguntar_alergias :-
    write('¿Alguien en casa tiene alergia al pelo o plumas?'), nl,
    write('Responde: si / no'), nl,
    read(Respuesta),
    (validar_si_no(Respuesta) ->
        guardar_respuesta(alergias, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_alergias
    ), nl.

% 1.2 Espacio en casa
preguntar_espacio :-
    write('¿Qué nivel de espacio tienes disponible para una mascota?'), nl,
    write('Responde: bajo / medio / alto'), nl,
    read(Respuesta),
    (member(Respuesta, [bajo, medio, alto]) ->
        guardar_respuesta(espacio, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_espacio
    ), nl.

% 1.3 Niños en casa
preguntar_ninos :-
    write('¿Hay niños en casa?'), nl,
    write('Responde: si / no'), nl,
    read(Respuesta),
    (validar_si_no(Respuesta) ->
        guardar_respuesta(ninos, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_ninos
    ), nl.

% 1.4 Otras mascotas
preguntar_otras_mascotas :-
    write('¿Ya tienes otras mascotas en casa?'), nl,
    write('Responde: si / no'), nl,
    read(Respuesta),
    (validar_si_no(Respuesta) ->
        guardar_respuesta(otras_mascotas, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_otras_mascotas
    ), nl.


% NIVEL 2: CAPACIDAD DE CUIDADO


% 2.1 Tiempo disponible
preguntar_tiempo :-
    write('¿Cuánto tiempo puedes dedicar diariamente a una mascota?'), nl,
    write('Responde: poco / moderado / mucho'), nl,
    read(Respuesta),
    (member(Respuesta, [poco, moderado, mucho]) ->
        guardar_respuesta(tiempo, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_tiempo
    ), nl.

% 2.2 Presupuesto
preguntar_presupuesto :-
    write('¿Cuál es tu presupuesto mensual para mantener una mascota?'), nl,
    write('Responde: bajo / medio / alto'), nl,
    read(Respuesta),
    (member(Respuesta, [bajo, medio, alto]) ->
        guardar_respuesta(presupuesto, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_presupuesto
    ), nl.

% 2.3 Experiencia previa
preguntar_experiencia :-
    write('¿Has tenido mascotas antes?'), nl,
    write('Responde: si / no'), nl,
    read(Respuesta),
    (validar_si_no(Respuesta) ->
        guardar_respuesta(experiencia, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_experiencia
    ), nl.

% 2.4 Limpieza y mantenimiento
preguntar_limpieza :-
    write('¿Te molesta limpiar constantemente el espacio de la mascota?'), nl,
    write('Responde: si / no'), nl,
    read(Respuesta),
    (validar_si_no(Respuesta) ->
        guardar_respuesta(limpieza, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_limpieza
    ), nl.

% 2.5 Responsabilidad a largo plazo
preguntar_responsabilidad :-
    write('¿Estás dispuesto a cuidar una mascota por varios años?'), nl,
    write('Responde: si / no'), nl,
    read(Respuesta),
    (validar_si_no(Respuesta) ->
        guardar_respuesta(responsabilidad, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_responsabilidad
    ), nl.


% NIVEL 3: ESTILO DE CONVIVENCIA

% 3.1 Nivel de actividad
preguntar_actividad :-
    write('¿Eres una persona activa?'), nl,
    write('Responde: si / no'), nl,
    read(Respuesta),
    (validar_si_no(Respuesta) ->
        guardar_respuesta(actividad, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_actividad
    ), nl.

% 3.2 Tipo de convivencia deseada
preguntar_convivencia :-
    write('¿Qué tipo de convivencia deseas con tu mascota?'), nl,
    write('Responde: mucha / moderada / observacion'), nl,
    read(Respuesta),
    (member(Respuesta, [mucha, moderada, observacion]) ->
        guardar_respuesta(convivencia, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_convivencia
    ), nl.


% NIVEL 4: PREFERENCIAS SECUNDARIAS


% 4.1 Tolerancia al ruido
preguntar_ruido :-
    write('¿Te molesta que tu mascota haga ruido frecuentemente?'), nl,
    write('Responde: si / no'), nl,
    read(Respuesta),
    (validar_si_no(Respuesta) ->
        guardar_respuesta(ruido, Respuesta)
    ;
        write('Respuesta inválida. Intenta de nuevo.'), nl,
        preguntar_ruido
    ), nl.
