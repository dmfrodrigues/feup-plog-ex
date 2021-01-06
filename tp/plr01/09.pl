:-
    use_module(library(clpfd)).

no_zeros(0, X) :- !,
    (X #> 0 #=> mod(X,10) #\= 0).
no_zeros(N, X) :-
    (X #> 0 #=> mod(X,10) #\= 0),
    N1 is N-1,
    X1 #= X//10,
    no_zeros(N1, X1).

solve_zeros(A, B) :-
    domain([A], 1, 31622),
    B #= 1000000000/A,
    A*B #= 1000000000,
    no_zeros(10, A), no_zeros(10, B),
    labeling([], [A]).

:-
    solve_zeros(A, B),
    write(A), nl, write(B), nl.
