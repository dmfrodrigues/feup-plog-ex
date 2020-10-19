
/**
 * insertion_sort(L, R)
 * 
 * Sort list L and return R
 */

insertion_sort([], []).
insertion_sort([X|L1], R) :-
    insertion_sort(L1, R1),
    i_s_insert(X, R1, R).

/**
 * insert_ordered(X, L, R)
 * 
 * Inserts X in sorted list L, returns R
 */
i_s_insert(X, [], [X]).
i_s_insert(X, [Y|L], [X,Y|L]) :- X =< Y, !.
i_s_insert(X, [Y|L], [Y|R]) :- i_s_insert(X, L, R).
