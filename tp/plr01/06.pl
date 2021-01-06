:-
    use_module(library(clpfd)).

solve(A,B,C) :-
    Vars = [A, B, C],
    domain(Vars, 1, 1000),
    A #>= B, B #>= C,
    S #= A+B+C,
    S #= A*B*C,
    labeling([], Vars),
    write(Vars).

:-
    solve(A,B,C).
