functor2(T, F, A) :-
    T =.. [F|Args],
    length(Args, A).

arg2(N, Term, Arg) :-
    Term =.. [_|Args],
    is_arg_pos(Arg, N, Args).

is_arg_pos(Arg, 1, [Arg|_]).
is_arg_pos(Arg, N, [  _|L]) :-
    N > 1,
    N1 is N-1,
    is_arg_pos(Arg, N1, L).
