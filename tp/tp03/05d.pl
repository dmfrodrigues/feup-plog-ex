/*
 * nth_element(+N, ?L, -X)
 *
 * Evaluates to true when the N-th element of L is X.
 */
nth_element(1, [X|_], X).
nth_element(N, [_|T], X) :-
    N > 1,
    N1 is N-1,
    nth_element(N1, T, X)    
.
