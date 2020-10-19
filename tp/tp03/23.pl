:- use_module(library(random)).

/**
 * rnd_selectN(+List, +N, -ListSel)
 */
rnd_selectN(_,0,[]).
rnd_selectN(L,N,[H|T]) :-
    N > 0,
    random_select(H,L,L2),
    N1 is N-1,
    rnd_selectN(L2,N1,T).

/**
 * rnd_select(+N, +M, -R)
 */
rnd_select(0, _, []).
rnd_select(N, M, [H|T]) :-
    N > 0,
    M1 is M+1,
    N1 is N-1,
    random(1, M1, H),
    rnd_select(N1, M, T).

/**
 * rnd_permutation(+L, -R)
 */
rnd_permutation(L, R) :-
    length(L, N),
    rnd_selectN(L, N, R).
