:- use_module(library(clpfd)).
:- use_module(library(lists)).

check_magic_sequence(Seq, -1) :- !.
check_magic_sequence(Seq, I) :- element(N, Seq, I), count(I, Seq, #=, N), I1 is I-1, check_magic_sequence(Seq, I1).

magic_sequence(N, Seq) :-
    length(Seq, N),
    N1 is N-1,
    domain(Seq, 0, N1),
    check_magic_sequence(Seq, N1),
    labeling([], Seq).
