rodar(L, N, R) :-
    N < 0,
    length(L, N1),
    N2 is N1+N,
    rodar(L, N2, R),
    !.
rodar(L, 0, L) :- !.
rodar([X|L], N, R) :-
    N1 is N-1,
    append(L, [X], L1),
    rodar(L1, N1, R).
