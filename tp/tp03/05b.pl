:- reconsult('03.pl').

/*
 * membro(?X, -L)
 *
 * Evaluates to true when X is in list L.
 * Can be implemented using anexar/3 because we can assume
 * we are annexing some list to another list starting with X.
 */
membro(X, L) :- anexar(_, [X|_], L).
