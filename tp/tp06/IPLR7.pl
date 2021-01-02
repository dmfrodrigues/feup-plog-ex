:- use_module(library(clpfd)).
:- use_module(library(lists)).

peru(X, Z) :-
    domain([X,Z], 0, 9),                     % Domain
    X #> 0,
    N #= 1000*X + 67*10 + Z,
    N rem 72 #= 0,
    labeling([], [X,Z]).                     % Search for solutions