/*
 * membro(?X, -L)
 *
 * Evaluates to true when X is in list L.
 */
membro(X, [X|_]) :- (ground(X)->!:true).
membro(X, [_|T]) :- membro(X, T).
