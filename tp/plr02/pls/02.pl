:-
    use_module(library(clpfd)).

solve :-
    Musicos      = [Joao , Antonio, Francisco], Musicos = [1, 2, 3],
    Instrumentos = [Harpa, Violino, Piano    ], domain(Instrumentos, 1, 3), all_distinct(Instrumentos),

    Antonio #\= Pianista,
    Pianista #\= Joao,
    Joao #\= Violino,

    labeling([], Instrumentos),
    write(Instrumentos), nl.

:-
    solve.
