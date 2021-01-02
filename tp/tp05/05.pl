/*
 * unificavel(+L1, +Termo, -L2)
 * 
 * Checks which elements of L1 can be unified with Termo,
 * and returns them in L2.
 */
unificavel([], _, []).
unificavel([H|L], T, L1) :-
    \+(H = T), !,
    unificavel(L, T, L1).
unificavel([H|L], T, [H|L1]) :-
    unificavel(L, T, L1).
