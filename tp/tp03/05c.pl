:- reconsult('03.pl').

/*
 * last(+L, -X)
 *
 * Evaluates to true when X is the last element in list L.
 */
last(L, X) :- anexar(_, [X], L).
