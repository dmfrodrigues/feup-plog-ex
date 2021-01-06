:-
    use_module(library(clpfd)).

solve_turkey(A,B) :-
    Vars = [A, B],
    domain([A], 1, 9),
    domain([B], 0, 9),
    Value #= A*1000 + 6*100 + 7*10 + B*1,
    Price #= Value//72,
    Price*72 #= Value,
    labeling([], Vars).

:-
    solve_turkey(A,B),
    write(A), nl, write(B), nl.
