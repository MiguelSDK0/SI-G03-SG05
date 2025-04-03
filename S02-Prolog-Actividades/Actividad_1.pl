padre(rafael, dario).
padre(dario, miguel).
padre(dario, jonahtan).
padre(rafael, juan).
padre(juan, jean).
padre(daniel, alejandra).
padre(daniel, sebastian).
madre(juana, maria).
madre(maria, miguel).
madre(maria, jonahtan).
madre(juana, haydee).
madre(haydee, sebastian).
madre(haydee, alejandra).
madre(juana, efrain).

hermano(X, Y) :- padre(P, X), padre(P, Y), X \= Y.
hermana(X, Y) :- madre(M, X), madre(M, Y), X \= Y.
abuelo(X, Y) :- padre(X, P), padre(P, Y).
abuela(X, Y) :- madre(X, P), madre(P, Y).
tio(X, Y) :- hermano(X, P), padre(P, Y); hermana(X, P), madre(P, Y).
primo(X, Y) :- madre(M1, X), madre(M2, Y), hermana(M1, M2); padre(P1, X), padre(P2, Y), hermano(P1, P2) ,X \= Y.
