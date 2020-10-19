/*
 * count(+L, ?N)
 *
 * Checks if L has size N.
 */
count([], 0).
count([_|T], N) :-
    count(T, N1),
    N is N1+1.
