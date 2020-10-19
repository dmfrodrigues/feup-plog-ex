:- reconsult('03.pl').

/*
 * before(X, Y, L)
 *
 * Checks if X appears before Y in L.
 */
before(X, Y, L) :-
    anexar(_, [X|L1], L ), % L1 is the list after X
    anexar(_, [Y|_ ], L1). % Check if L1 contains Y
