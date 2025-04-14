% interfaz.pl
% Entrevista medica adaptativa e inteligente para diagnostico de hipertension

:- dynamic genero/1.
:- consult('base_hechos.pl').
:- consult('motor_inferencia.pl').

% -------------------- ENTREVISTA PRINCIPAL --------------------

iniciar_entrevista :-
    reset_hechos,
    write('--- ENTREVISTA MEDICA PARA DIAGNOSTICO DE HIPERTENSION ---'), nl,
    preguntar_genero,
    preguntar_factores_generales,
    preguntar_sintomas_comunes,
    preguntar_profundizar,
    nl,
    write('Analizando respuestas...'), nl,
    evaluar(hipertension),
    mostrar_probabilidad_total,
    mostrar_resumen.

% -------------------- BLOQUES DE PREGUNTAS --------------------

preguntar_genero :-
    write('Es usted hombre o mujer? (hombre/mujer)'), nl,
    read(GeneroRaw),
    downcase_atom(GeneroRaw, Genero),
    retractall(genero(_)),
    asserta(genero(Genero)),
    (Genero == hombre -> registrar_respuesta(sexo_masculino, si); registrar_respuesta(sexo_masculino, no)).

preguntar_factores_generales :-
    hacer_pregunta(obesidad, 'Tiene obesidad? (si/no)'),
    hacer_pregunta(tabaquismo, 'Fuma con frecuencia? (si/no)'),
    hacer_pregunta(sedentarismo, 'Tiene vida sedentaria? (si/no)'),
    hacer_pregunta(alimentacion_rica_sal, 'Consume alimentos con mucha sal? (si/no)'),
    hacer_pregunta(antecedentes_familiares, 'Tiene antecedentes familiares de hipertension? (si/no)'),
    hacer_pregunta(edad_mayor_60, 'Tiene mas de 60 anios? (si/no)').

preguntar_sintomas_comunes :-
    hacer_pregunta(dolor_cabeza, 'Sufre de dolor de cabeza frecuente? (si/no)'),
    hacer_pregunta(mareos, 'Ha tenido mareos? (si/no)'),
    hacer_pregunta(vision_borrosa, 'Tiene vision borrosa? (si/no)').

preguntar_sintomas_moderados :-
    hacer_pregunta(insomnio, 'Tiene dificultad para dormir? (si/no)'),
    hacer_pregunta(zumbido_oidos, 'Tiene zumbido en los oidos? (si/no)'),
    hacer_pregunta(sudoracion_excesiva, 'Suda en exceso sin causa aparente? (si/no)'),
    hacer_pregunta(nerviosismo, 'Se siente muy nervioso con frecuencia? (si/no)'),
    hacer_pregunta(irritabilidad, 'Tiene episodios de irritabilidad? (si/no)'),
    hacer_pregunta(cefalea_matutina, 'Tiene cefalea en la manana? (si/no)'),
    hacer_pregunta(confusion, 'Ha tenido episodios de confusion? (si/no)').

preguntar_sintomas_graves :-
    hacer_pregunta(sensacion_opresion_pecho, 'Siente opresion en el pecho? (si/no)'),
    hacer_pregunta(sangrado_nasal, 'Tiene sangrados nasales frecuentes? (si/no)'),
    hacer_pregunta(temblores, 'Presenta temblores? (si/no)'),
    hacer_pregunta(aturdimiento, 'Se siente aturdido sin causa aparente? (si/no)'),
    hacer_pregunta(dificultad_concentracion, 'Le cuesta concentrarse? (si/no)'),
    hacer_pregunta(dolor_pecho, 'Siente dolor en el pecho? (si/no)'),
    hacer_pregunta(falta_aliento, 'Le falta el aliento facilmente? (si/no)'),
    hacer_pregunta(sensacion_calor_cara, 'Siente calor en el rostro repentinamente? (si/no)').

preguntar_factores_mujer :-
    hacer_pregunta(embarazo, 'Esta embarazada actualmente? (si/no)'),
    hacer_pregunta(preeclampsia_historial, 'Ha tenido preeclampsia antes? (si/no)'),
    hacer_pregunta(menopausia, 'Esta en menopausia? (si/no)').

% -------------------- ENTREVISTA ADAPTATIVA --------------------

preguntar_profundizar :-
    findall(X, (hecho(X), factor_riesgo(X, _)), Factores),
    length(Factores, NF),
    findall(S, (hecho(S), sintoma(S)), Sintomas),
    length(Sintomas, NS),
    (NF >= 2 ; NS >= 2),
    !,
    nl, write('Se han detectado signos relevantes. Continuamos con una evaluacion mas detallada...'), nl,
    preguntar_sintomas_moderados,
    preguntar_sintomas_graves,
    (genero(mujer) -> preguntar_factores_mujer ; true).

preguntar_profundizar :-
    nl, write('No se detectaron signos suficientes para profundizar. Finalizando evaluacion inicial.'), nl.

% -------------------- UTILIDADES --------------------

hacer_pregunta(Facto, Texto) :-
    write(Texto), nl,
    read(Respuesta),
    registrar_respuesta(Facto, Respuesta).

mostrar_resumen :-
    nl,
    write('--- HECHOS REGISTRADOS EN ESTA SESION ---'), nl,
    hecho(F),
    write('- '), write(F), nl,
    fail.

mostrar_resumen.

mostrar_probabilidad_total :-
    calcular_riesgo_total(P),
    write('Probabilidad total estimada de hipertension: '),
    write(P), nl.
