:- reconsult('06b.pl').

/*
 * delete_all_list(LX, L, R)
 *
 * Removes an occurence of elements of LX from L, returning R.
 */
delete_all_list([], L, L).
delete_all_list([X|LX], L, R) :-
    delete_all_list(LX, L, R1),
    delete_all(X, R1, R)
.
