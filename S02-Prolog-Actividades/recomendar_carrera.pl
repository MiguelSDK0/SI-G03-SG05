:- dynamic tiene_habilidad/1, tiene_interes/1, tiene_personalidad/1, tiene_preferencia/1.

tiene_habilidad(matematicas).
tiene_habilidad(argumentacion).
tiene_habilidad(creatividad).
tiene_habilidad(liderazgo).
tiene_habilidad(pensamiento_analitico).
tiene_habilidad(biologia).

tiene_interes(tecnologia).
tiene_interes(salud).
tiene_interes(negocios).
tiene_interes(diseno).
tiene_interes(investigacion).
tiene_interes(educacion).
tiene_interes(turismo).

tiene_personalidad(meticuloso).
tiene_personalidad(empatico).
tiene_personalidad(extrovertido).
tiene_personalidad(critico).

tiene_preferencia(trabajo_en_equipo).
tiene_preferencia(autonomia).
tiene_preferencia(investigacion_laboral).
tiene_preferencia(interaccion_social).

carrera(ingenieria_sistemas) :- 
    tiene_habilidad(matematicas), 
    tiene_interes(tecnologia), 
    tiene_personalidad(critico), 
    tiene_preferencia(autonomia), !.
carrera(ingenieria_industrial) :- 
    tiene_habilidad(matematicas), 
    tiene_interes(tecnologia), 
    tiene_personalidad(pensamiento_analitico), 
    tiene_preferencia(trabajo_en_equipo), !.
carrera(medicina) :- 
    tiene_interes(salud), 
    tiene_habilidad(biologia), 
    tiene_personalidad(empatico), 
    tiene_preferencia(interaccion_social), !.
carrera(derecho) :- 
    tiene_habilidad(argumentacion), 
    tiene_interes(negocios), 
    tiene_personalidad(critico), 
    tiene_preferencia(autonomia), !.
carrera(arquitectura) :- 
    tiene_habilidad(creatividad), 
    tiene_interes(diseno), 
    tiene_personalidad(extrovertido), 
    tiene_preferencia(trabajo_en_equipo), !.
carrera(psicologia) :- 
    tiene_interes(salud), 
    tiene_personalidad(empatico), 
    tiene_interes(educacion), 
    tiene_preferencia(interaccion_social), !.
carrera(administracion) :- 
    tiene_interes(negocios), 
    tiene_personalidad(meticuloso), 
    tiene_habilidad(liderazgo), 
    tiene_preferencia(trabajo_en_equipo), !.
carrera(economia) :- 
    tiene_interes(negocios), 
    tiene_personalidad(critico), 
    tiene_habilidad(matematicas), 
    tiene_preferencia(autonomia), !.
carrera(contabilidad) :- 
    tiene_interes(negocios), 
    tiene_personalidad(meticuloso), 
    tiene_habilidad(matematicas), 
    tiene_preferencia(autonomia), !.
carrera(diseno_grafico) :- 
    tiene_habilidad(creatividad), 
    tiene_interes(diseno), 
    tiene_personalidad(extrovertido), 
    tiene_preferencia(interaccion_social), !.
carrera(marketing) :- 
    tiene_interes(negocios), 
    tiene_personalidad(extrovertido), 
    tiene_habilidad(creatividad), 
    tiene_preferencia(interaccion_social), !.
carrera(biologia) :- 
    tiene_habilidad(biologia), 
    tiene_interes(salud), 
    tiene_personalidad(empatico), 
    tiene_preferencia(trabajo_en_equipo), !.
carrera(fisica) :- 
    tiene_habilidad(matematicas), 
    tiene_interes(investigacion), 
    tiene_personalidad(critico), 
    tiene_preferencia(investigacion_laboral), !.
carrera(quimica) :- 
    tiene_habilidad(matematicas), 
    tiene_interes(investigacion), 
    tiene_personalidad(critico), 
    tiene_preferencia(investigacion_laboral), !.
carrera(educacion) :- 
    tiene_interes(educacion), 
    tiene_personalidad(empatico), 
    tiene_preferencia(interaccion_social), !.
carrera(turismo) :- 
    tiene_interes(turismo), 
    tiene_personalidad(extrovertido), 
    tiene_preferencia(interaccion_social), !.
carrera(relaciones_internacionales) :- 
    tiene_interes(negocios), 
    tiene_personalidad(extrovertido), 
    tiene_preferencia(interaccion_social), !.

preguntar(Pregunta, Fact) :- 
    write(Pregunta), nl,
    write('Responde si o no: '), nl,
    read(Resp),
    (Resp == si -> assert(Fact) ; true).

recomendar_carrera :-
    retractall(tiene_habilidad(_)),
    retractall(tiene_interes(_)),
    retractall(tiene_personalidad(_)),
    retractall(tiene_preferencia(_)),
    preguntar('Te gustan las matematicas?', tiene_habilidad(matematicas)),
    preguntar('Tienes habilidades de argumentacion?', tiene_habilidad(argumentacion)),
    preguntar('Eres una persona creativa?', tiene_habilidad(creatividad)),
    preguntar('Te gusta liderar a otros?', tiene_habilidad(liderazgo)),
    preguntar('Tienes pensamiento analitico?', tiene_habilidad(pensamiento_analitico)),
    preguntar('Te interesa la biologia?', tiene_habilidad(biologia)),
    
    preguntar('Te interesa la tecnologia?', tiene_interes(tecnologia)),
    preguntar('Te interesa la salud?', tiene_interes(salud)),
    preguntar('Te interesa el area de negocios?', tiene_interes(negocios)),
    preguntar('Te interesa el diseno?', tiene_interes(diseno)),
    preguntar('Te interesa la investigacion?', tiene_interes(investigacion)),
    preguntar('Te interesa la educacion?', tiene_interes(educacion)),
    preguntar('Te interesa el turismo?', tiene_interes(turismo)),
    
    preguntar('Eres meticuloso?', tiene_personalidad(meticuloso)),
    preguntar('Eres empatico?', tiene_personalidad(empatico)),
    preguntar('Eres extrovertido?', tiene_personalidad(extrovertido)),
    preguntar('Eres critico?', tiene_personalidad(critico)),
    
    preguntar('Prefieres trabajar en equipo?', tiene_preferencia(trabajo_en_equipo)),
    preguntar('Prefieres la autonomia?', tiene_preferencia(autonomia)),
    preguntar('Te interesa la investigacion laboral?', tiene_preferencia(investigacion_laboral)),
    preguntar('Te gusta la interaccion social?', tiene_preferencia(interaccion_social)),
    
    (carrera(Carrera) ->
         write('Te recomendamos estudiar: '), write(Carrera), nl
     ;
         write('No se encontro una carrera especifica para tu perfil.'), nl).
