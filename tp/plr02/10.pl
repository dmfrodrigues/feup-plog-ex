:-
    use_module(library(clpfd)).

solve_me(R) :-
    Vars = [A, B, C, AB, AC, BC, ABC], domain(Vars, 0, 135),

    ABC #= 30,

    C+AC+BC+ABC #= 65,
    A+AB+AC+ABC #= 130,
    B+AB+BC+ABC #= 135,

    A+B+C+AB+AC+BC+ABC #= 200,

    labeling([], Vars), !,

    R is A+B+C,

    true.

:-
    solve_me(Lugar),
    write(Lugar), nl.
