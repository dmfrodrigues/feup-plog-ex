/**
 * permutacao(L1,L2) is true when L2 is a permutation of L1.
 */
permutacao([], []).
permutacao(L,[H|T]) :-
    mdelete(H, L, L1),
    permutacao(L1, T).

/**
 * mdelete(X, L1, L2) removes X from L1 and returns in L2
 */
mdelete(X,[X|L],L).
mdelete(X,[H|L1],[H|L2]) :- mdelete(X, L1, L2).
