:- reconsult('03.pl').

/*
 * delete_one(X, L, R)
 *
 * Removes an occurence of X from L, returning R.
 */
delete_one(X, L, R) :-
    anexar(A, [X|B], L),
    anexar(A, B, R)
.
