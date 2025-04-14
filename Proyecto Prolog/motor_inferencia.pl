% motor_inferencia.pl
% Motor de inferencia con encadenamiento hacia atras

:- consult('base_hechos.pl').
:- consult('base_reglas.pl').

% Predicado principal para evaluar una meta (por ejemplo, hipertension)
evaluar(Diagnostico) :-
    diagnostico(Diagnostico),
    write('Usted podria tener: '), write(Diagnostico), nl.

evaluar(_) :-
    write('No se pudo confirmar el diagnostico con suficiente evidencia.'), nl.

% Permite agregar hechos al sistema de forma dinamica (desde la interfaz)
agregar_hecho(Facto) :-
    \+ hecho(Facto),
    asserta(hecho(Facto)).

% Limpia los hechos agregados en una sesion previa (opcional)
reset_hechos :-
    retractall(hecho(_)).

% Registra hechos basados en respuestas del usuario (a ser usado desde interfaz.pl)
registrar_respuesta(Sintoma_o_Factor, si) :-
    agregar_hecho(Sintoma_o_Factor).

registrar_respuesta(_, no).

% Hechos temporales definidos dinamicamente
:- dynamic hecho/1.
