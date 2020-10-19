:- reconsult('05a.pl'). % membro(X, L)

/*
 * delete_duplicates(L, R)
 *
 * Deletes duplicates from L and returns R.
 */
delete_duplicates([], []).
delete_duplicates([X|L], R) :-
    delete_duplicates(L, R),
    membro(X, R),
    !.
delete_duplicates([X|L], [X|R]) :-
    delete_duplicates(L, R).
