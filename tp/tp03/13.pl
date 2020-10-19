lista_ate(0, []).
lista_ate(N, [N|L]) :-
    N1 is N-1,
    lista_ate(N1, L).

lista_entre(N1, N1, [N1]).
lista_entre(N1, N2, [N2|L]) :-
    N3 is N2-1,
    lista_entre(N1, N3, L).

soma_lista([], 0).
soma_lista([X|L], S) :-
    soma_lista(L, S1),
    S is S1+X.

par(N) :- N mod 2 =:= 0.

lista_pares(0, [0]).
lista_pares(X, [X|L]) :-
    par(X),
    X1 is X-2,
    lista_pares(X1, L),
    !.
lista_pares(X, L) :-
    X1 is X-1,
    lista_pares(X1, L).

lista_impares(1, [1]).
lista_impares(X, [X|L]) :-
    \+par(X),
    X1 is X-2,
    lista_impares(X1, L),
    !.
lista_impares(X, L) :-
    X1 is X-1,
    lista_impares(X1, L).
