/*
 * membro(X, L) is true when X is in list L.
 */
membro(X, [X|_]).
membro(X, [_|T]) :- membro(X, T).
