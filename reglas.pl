% ========================================
% REGLAS DE DESCARTE - BASE DE CONOCIMIENTO
% ========================================
% Propósito: Contener todas las reglas que eliminan mascotas
% incompatibles según las respuestas del usuario.
% El sistema funciona descartando opciones, no seleccionando directamente.

% ========================================
% NIVEL 1: RESTRICCIONES CRÍTICAS
% ========================================

% --- 1.1 ALERGIAS ---
% Si hay alergia al pelo o plumas, descartar mascotas peludas/con plumas
descartar(perro) :-
    respuesta(alergias, si).

descartar(gato) :-
    respuesta(alergias, si).

descartar(conejo) :-
    respuesta(alergias, si).

descartar(ave) :-
    respuesta(alergias, si).

% --- 1.2 ESPACIO EN CASA ---
% Espacio bajo: descartar perro
descartar(perro) :-
    respuesta(espacio, bajo).

% Espacio bajo: aceptar solo pez, hamster, tortuga, gato
% (implícito: se descartan conejo y ave en espacio bajo)
descartar(conejo) :-
    respuesta(espacio, bajo).

descartar(ave) :-
    respuesta(espacio, bajo).

% Espacio medio: solo se permiten gato, conejo, ave, perro pequeño
% Se descartan pez y tortuga (no necesitan espacio medio, pero podemos permitirlos)

% --- 1.3 NIÑOS EN CASA ---
% Si hay niños, se evitan mascotas delicadas (hamster, tortuga, pez)
% pero se priorizan perro, gato, conejo
% No descartamos directamente, pero indicamos preferencia

% --- 1.4 OTRAS MASCOTAS EN CASA ---
% Si hay otras mascotas, evitar territoriales
descartar(perro) :-
    respuesta(otras_mascotas, si).

descartar(gato) :-
    respuesta(otras_mascotas, si).

% ========================================
% NIVEL 2: CAPACIDAD DE CUIDADO
% ========================================

% --- 2.1 TIEMPO DISPONIBLE ---
% Poco tiempo: descartar perro, conejo, hamster
descartar(perro) :-
    respuesta(tiempo, poco).

descartar(conejo) :-
    respuesta(tiempo, poco).

descartar(hamster) :-
    respuesta(tiempo, poco).

% Tiempo moderado: se permiten gato, conejo, ave
% (perro requiere mucho tiempo)

% Mucho tiempo: se permiten todas (perro, gato, conejo)

% --- 2.2 PRESUPUESTO ---
% Presupuesto bajo: solo pez, hamster, tortuga
descartar(perro) :-
    respuesta(presupuesto, bajo).

descartar(gato) :-
    respuesta(presupuesto, bajo).

descartar(conejo) :-
    respuesta(presupuesto, bajo).

descartar(ave) :-
    respuesta(presupuesto, bajo).

% Presupuesto medio: se permiten gato, conejo, ave
descartar(perro) :-
    respuesta(presupuesto, medio).

% --- 2.3 EXPERIENCIA PREVIA ---
% Sin experiencia: priorizar gato, pez, tortuga, hamster
% Con experiencia: se permiten perro, conejo, ave
descartar(perro) :-
    respuesta(experiencia, no).

descartar(conejo) :-
    respuesta(experiencia, no).

descartar(ave) :-
    respuesta(experiencia, no).

% --- 2.4 LIMPIEZA Y MANTENIMIENTO ---
% Si molesta limpiar: descartar conejo y perro
descartar(conejo) :-
    respuesta(limpieza, si).

descartar(perro) :-
    respuesta(limpieza, si).

descartar(hamster) :-
    respuesta(limpieza, si).

% --- 2.5 RESPONSABILIDAD A LARGO PLAZO ---
% Si no está dispuesto: solo pez, hamster
descartar(perro) :-
    respuesta(responsabilidad, no).

descartar(gato) :-
    respuesta(responsabilidad, no).

descartar(conejo) :-
    respuesta(responsabilidad, no).

descartar(tortuga) :-
    respuesta(responsabilidad, no).

descartar(ave) :-
    respuesta(responsabilidad, no).

% ========================================
% NIVEL 3: ESTILO DE CONVIVENCIA
% ========================================

% --- 3.1 NIVEL DE ACTIVIDAD ---
% Persona activa: priorizar perro, conejo
% Persona poco activa: priorizar gato, pez, tortuga

% --- 3.2 TIPO DE CONVIVENCIA ---
% Mucha convivencia: se priorizan perro, gato
% Convivencia moderada: se priorizan conejo, hamster
% Observación: se priorizan pez, tortuga

% ========================================
% NIVEL 4: PREFERENCIAS SECUNDARIAS
% ========================================

% --- 4.1 TOLERANCIA AL RUIDO ---
% Si molesta el ruido: descartar ave
descartar(ave) :-
    respuesta(ruido, si).
