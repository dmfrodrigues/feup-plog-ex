f(X, Y) :- Y is X*X.
duplica(X, Y) :- Y is 2*X.

map([], _, []).
map([H|T],F,[H1|T1]) :-
    map(T, F, T1),
    C=..[F, H, H1],
    C.
