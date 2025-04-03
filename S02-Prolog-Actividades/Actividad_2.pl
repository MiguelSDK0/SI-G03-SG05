horoscopo(aries, 21, 3, 19, 4).
horoscopo(tauro, 20, 4, 20, 5).
horoscopo(geminis, 21, 5, 20, 6).
horoscopo(cancer, 21, 6, 22, 7).
horoscopo(leo, 23, 7, 22, 8).
horoscopo(virgo, 23, 8, 22, 9).
horoscopo(libra, 23, 9, 22, 10).
horoscopo(escorpio, 23, 10, 21, 11).
horoscopo(sagitario, 22, 11, 21, 12).
horoscopo(capricornio, 22, 12, 19, 1).
horoscopo(acuario, 20, 1, 18, 2).
horoscopo(piscis, 19, 2, 20, 3).

signo(Dia, Mes, Signo) :- horoscopo(Signo, D1, M1, D2, M2), ( (Mes = M1, Dia >= D1); (Mes = M2, Dia =< D2); (Mes > M1, Mes < M2)).

signo(Dia, Mes, capricornio) :-(Mes = 12, Dia >= 22); (Mes = 1, Dia =< 19).
