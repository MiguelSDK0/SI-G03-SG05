% base_reglas.pl
% Reglas que relacionan hechos con la probabilidad de hipertension

% Reglas individuales que asignan probabilidad a cada factor de riesgo declarado por el usuario
riesgo_por_factor(Factor, P) :- factor_riesgo(Factor, P), hecho(Factor).

% Reglas individuales que asignan probabilidad a cada sintoma reportado
riesgo_por_sintoma(Sintoma, P) :- probabilidad_hipertension_por_sintoma(Sintoma, P), hecho(Sintoma).

% Reglas combinadas que elevan el riesgo si se presentan ciertos grupos de factores/sintomas juntos
riesgo_combinado(alto) :- hecho(obesidad), hecho(antecedentes_familiares), hecho(sedentarismo).
riesgo_combinado(moderado) :- hecho(tabaquismo), hecho(colesterol_alto).
riesgo_combinado(moderado) :- hecho(edad_mayor_60), hecho(menopausia).
riesgo_combinado(alto) :- hecho(hipotiroidismo), hecho(enfermedad_renal).
riesgo_combinado(alto) :- hecho(preeclampsia_historial), hecho(embarazo).
riesgo_combinado(moderado) :- hecho(estres_cronico), hecho(insomnio).
riesgo_combinado(alto) :- hecho(sindrome_apnea_sueno), hecho(sedentarismo), hecho(fatiga_cronica).
riesgo_combinado(moderado) :- hecho(sexo_masculino), hecho(consumo_alcohol), hecho(tabaquismo).
riesgo_combinado(alto) :- hecho(obesidad), hecho(alimentacion_rica_sal), hecho(consumo_cafeina).
riesgo_combinado(moderado) :- hecho(dolor_cabeza), hecho(mareos), hecho(vision_borrosa).

% Cálculo final de probabilidad usando fórmula bayesiana simplificada con ajustes por evidencia combinada
calcular_riesgo_total(PFinal) :-
    probabilidad_base_hipertension(Base),                   % Valor base inicial
    findall(P, riesgo_por_factor(_, P), PFs),               % Lista de probabilidades por factores
    findall(P, riesgo_por_sintoma(_, P), PSs),              % Lista de probabilidades por sintomas
    append(PFs, PSs, Todos),                                % Unir todas las evidencias
    riesgo_combinado_extra(PComb),                          % Obtener peso por combinaciones

    producto_lista(Todos, PEvidencia),                      % Producto de las evidencias positivas
    maplist(complemento, Todos, Complementos),              % Calcular complementos: 1 - P
    producto_lista(Complementos, PNegEvidencia),            % Producto de evidencias negativas

    Pnum is Base * PEvidencia * (1 + PComb),                % Numerador de Bayes (ajustado)
    Pden is Pnum + ((1 - Base) * PNegEvidencia),            % Denominador completo
    (Pden =:= 0 -> PFinal = 0 ; PFinal is Pnum / Pden).     % Evitar división por cero

% Asignar peso extra por combinaciones de alto o moderado riesgo
riesgo_combinado_extra(0.3) :- riesgo_combinado(alto), !.
riesgo_combinado_extra(0.15) :- riesgo_combinado(moderado), !.
riesgo_combinado_extra(0).

% Confirmar diagnóstico si la probabilidad final supera el umbral establecido
diagnostico(hipertension) :-
    calcular_riesgo_total(P),
    P >= 0.6.

% Función auxiliar: suma una lista de valores
sumar_lista([], 0).
sumar_lista([H|T], S) :- sumar_lista(T, R), S is H + R.

% Verifica si un hecho está presente (usado como comodín por el motor)
condicion(F) :- hecho(F).

% Función auxiliar: producto de una lista de probabilidades
producto_lista([], 1).
producto_lista([H|T], P) :-
    producto_lista(T, R),
    P is H * R.

% Función auxiliar: calcula el complemento (1 - valor)
complemento(X, C) :- C is 1 - X.
