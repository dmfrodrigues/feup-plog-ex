:- reconsult('03.pl').

/**
 * flatten(L, R)
 * 
 * Flatten list L and return R
 */
flatten([], []).
flatten(X, [X]) :- atomic(X).
flatten([X|L], R) :-
    flatten(X, Y),
    flatten(L, M),
    anexar(Y, M, R).
