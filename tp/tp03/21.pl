/**
 * slice(L, I1, I2, R)
 */
slice(_, 1, 0, []).
slice([X|L], 1, B, [X|R]) :-
    B1 is B-1,
    slice(L, 1, B1, R),
    !.
slice([X|L], A, B, R) :-
    A1 is A-1,
    B1 is B-1,
    slice(L, A1, B1, R).
