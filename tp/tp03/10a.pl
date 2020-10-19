/**
 * sorted(+L)
 * 
 * True if L is sorted
 */

sorted([]).
sorted([X]) :- integer(X).
sorted([H1,H2|T]) :-
    H1 =< H2,
    sorted([H2|T]).
