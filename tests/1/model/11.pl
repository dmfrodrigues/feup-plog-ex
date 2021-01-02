impoe(X,L) :-
    length(Mid,X),
    append(L1,[X|_],L), append(_,[X|Mid],L1).

langford(N, L) :-
    N2 is N*2,
    length(L, N2),
    langford_ciclo(N, L, 1).

langford_ciclo(N, L, N) :- impoe(N, L).
langford_ciclo(N, L, X) :-
    X < N,
    impoe(X, L),
    X1 is X+1,
    langford_ciclo(N, L, X1).

