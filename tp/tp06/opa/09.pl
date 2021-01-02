entre(N1, N2, N1) :- N1 >= N2.
entre(N1, N2, X) :-
    N1 >= N2,
    M is N1-1,
    entre(M, N2, X).
