% base_hechos.pl
% Hechos relacionados a factores de riesgo, sintomas y antecedentes

% Sintomas observables
sintoma(dolor_cabeza).
sintoma(zumbido_oidos).
sintoma(vision_borrosa).
sintoma(mareos).
sintoma(palpitaciones).
sintoma(cefalea_matutina).
sintoma(sudoracion_excesiva).
sintoma(fatiga_cronica).
sintoma(sensacion_opresion_pecho).
sintoma(insomnio).
sintoma(nerviosismo).
sintoma(irritabilidad).
sintoma(sangrado_nasal).
sintoma(temblores).
sintoma(confusion).
sintoma(aturdimiento).
sintoma(dificultad_concentracion).
sintoma(dolor_pecho).
sintoma(falta_aliento).
sintoma(sensacion_calor_cara).

% Factores de riesgo
factor_riesgo(obesidad, 0.75).
factor_riesgo(tabaquismo, 0.65).
factor_riesgo(sedentarismo, 0.6).
factor_riesgo(alimentacion_rica_sal, 0.7).
factor_riesgo(antecedentes_familiares, 0.8).
factor_riesgo(edad_mayor_60, 0.7).
factor_riesgo(estres_cronico, 0.55).
factor_riesgo(consumo_alcohol, 0.5).
factor_riesgo(diabetes, 0.65).
factor_riesgo(colesterol_alto, 0.6).
factor_riesgo(hipotiroidismo, 0.5).
factor_riesgo(medicacion_esteroides, 0.55).
factor_riesgo(enfermedad_renal, 0.7).
factor_riesgo(sindrome_apnea_sueno, 0.6).
factor_riesgo(socioeconomico_bajo, 0.45).
factor_riesgo(consumo_cafeina, 0.4).
factor_riesgo(embarazo, 0.5).
factor_riesgo(preeclampsia_historial, 0.7).
factor_riesgo(menopausia, 0.6).

% Probabilidad de hipertension por cada sintoma
probabilidad_hipertension_por_sintoma(dolor_cabeza, 0.6).
probabilidad_hipertension_por_sintoma(zumbido_oidos, 0.55).
probabilidad_hipertension_por_sintoma(vision_borrosa, 0.65).
probabilidad_hipertension_por_sintoma(mareos, 0.5).
probabilidad_hipertension_por_sintoma(palpitaciones, 0.45).
probabilidad_hipertension_por_sintoma(cefalea_matutina, 0.6).
probabilidad_hipertension_por_sintoma(sudoracion_excesiva, 0.4).
probabilidad_hipertension_por_sintoma(fatiga_cronica, 0.5).
probabilidad_hipertension_por_sintoma(sensacion_opresion_pecho, 0.55).
probabilidad_hipertension_por_sintoma(insomnio, 0.4).
probabilidad_hipertension_por_sintoma(nerviosismo, 0.35).
probabilidad_hipertension_por_sintoma(irritabilidad, 0.3).
probabilidad_hipertension_por_sintoma(sangrado_nasal, 0.45).
probabilidad_hipertension_por_sintoma(temblores, 0.35).
probabilidad_hipertension_por_sintoma(confusion, 0.4).
probabilidad_hipertension_por_sintoma(aturdimiento, 0.4).
probabilidad_hipertension_por_sintoma(dificultad_concentracion, 0.35).
probabilidad_hipertension_por_sintoma(dolor_pecho, 0.55).
probabilidad_hipertension_por_sintoma(falta_aliento, 0.5).
probabilidad_hipertension_por_sintoma(sensacion_calor_cara, 0.3).

% Probabilidad base
probabilidad_base_hipertension(0.2).
