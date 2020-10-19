dropN(L, N, R) :-
    I1 is N-1,
    dropN(L, N, I1, R).

/**
 * dropN(+L, +N, +I, -R)
 * 
 * Drop one in every N values;
 * if I=0, drop the leftmost, otherwise decrement I.
 */
dropN([], _, _, []).
dropN([_X|L], N, 0, R) :-
    I1 is N-1,
    dropN(L, N, I1, R),
    !.
dropN([X|L], N, I, [X|R]) :-
    I1 is I-1,
    dropN(L, N, I1, R).
