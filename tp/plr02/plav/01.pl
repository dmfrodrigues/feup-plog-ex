:-
    use_module(library(clpfd)).

restrict_cycle(I, _) :- I < 0, !.
restrict_cycle(I, Seq) :-
    I2 is I+1,
    element(I2, Seq, Xi),
    count(I, Seq, #=, Xi),
    I1 is I-1,
    restrict_cycle(I1, Seq).

solve_me(N, Seq) :-
    N1 is N-1,
    length(Seq, N), domain(Seq, 0, N1),

    restrict_cycle(N1, Seq),

    labeling([], Seq), !,

    true.

:-
    N = 20,
    solve_me(N, Seq),
    write(Seq), nl.
