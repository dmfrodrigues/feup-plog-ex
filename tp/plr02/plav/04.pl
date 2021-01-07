:-
    use_module(library(clpfd)).

restrict_increasing([_]).
restrict_increasing([A,B|L]) :- A #< B, restrict_increasing([B|L]).

add_differences(_, [], []).
add_differences(X, [Y|L], [Z|Diff]) :- Z #= Y-X, add_differences(X, L, Diff).

get_differences([_], []).
get_differences([X|Ruler], Diffs) :-
    add_differences(X, Ruler, D1),
    get_differences(Ruler, D2),
    append(D1, D2, Diffs).

solve_me(N, Ruler) :-
    length(Ruler, N),
    Ruler = [0|_],
    domain(Ruler, 0, 10000),

    restrict_increasing(Ruler),
    get_differences(Ruler, Diffs), all_distinct(Diffs),

    element(N, Ruler, Value),

    labeling([minimize(Value)], Ruler).

:-
    N = 4,
    solve_me(N, Ruler),
    write(Ruler), nl.
