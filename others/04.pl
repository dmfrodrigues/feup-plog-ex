functor(T, F, A) :-
    T =.. [F|Args],
    length(Args, A).
