:- reconsult('03.pl').

duplicar([], []).
duplicar([X|L], [X,X|R]) :- duplicar(L, R).

duplicarN([], _, []).
duplicarN(_, 0, []).
duplicarN([X], N, [X|L]) :-
    N1 is N-1,
    duplicarN([X], N1, L),
    !.
duplicarN([X|L], N, R) :-
    duplicarN([X], N, R1),
    duplicarN( L , N, R2),
    anexar(R1, R2, R).
