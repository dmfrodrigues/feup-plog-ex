/*
 * delete_all(X, L, R)
 *
 * Removes an occurence of X from L1, returning L2.
 */
delete_all(_, [], []).
delete_all(X, [X|L],    R ) :- delete_all(X, L, R), !.
delete_all(X, [Y|L], [Y|R]) :- delete_all(X, L, R).
