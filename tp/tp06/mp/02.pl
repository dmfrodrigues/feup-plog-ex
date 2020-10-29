/**
 * separa(+L, +P, -R)
 * 
 * Given a list L and the name of a predicate P or arity 1,
 * returns in R all alements but first are all elements that
 * make P true.
 */
separa(L, P, R) :-
    separa(L, P, T, F),
    append(T, F, R).

/**
 * separa(+L, +P, -T, -F)
 * 
 * Given a list L and the name of a predicate P or arity 1,
 * returns in T all elements that make P true,
 * and returns in F all elements that make P false.
 */
separa([], _, [], []).
separa([H|L], P, [H|T], F) :-
    C =.. [P, H],
    C, !,
    separa(L, P, T, F).
separa([H|L], P, T, [H|F]) :-
    separa(L, P, T, F).
