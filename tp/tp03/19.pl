runlength(L, R) :-
    runlength(L, z, 0, R).

/**
 * 
 */
runlength([], _, 0, []).
runlength([X|L], X, N, R) :- % first of L is X
    runlength(L, X, N1, R),
    N is N1+1,
    !.
runlength([Y|L], _X, 0, R) :- % first of L is not X
    runlength([Y|L], Y, N1, R1),
    append([[N1,Y]], R1, R).




runlength_modificado(L, R) :-
    runlength_modificado(L, z, 0, R).

runlength_modificado([], _, 0, []).
runlength_modificado([X|L], X, N, R) :- % first of L is X
    runlength_modificado(L, X, N1, R),
    N is N1+1,
    !.
runlength_modificado([Y|L], _X, 0, R) :- % first of L is not X
    runlength_modificado([Y|L], Y, 1, R1),
    append([Y], R1, R).
runlength_modificado([Y|L], _X, 0, R) :- % first of L is not X
    runlength_modificado([Y|L], Y, N1, R1),
    append([[N1,Y]], R1, R).



