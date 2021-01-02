/**
 * 1. Variable and domains
 * 2. Restrictions
 * 3. Search for solutions
 */

:- use_module(library(clpfd)).

resolve(X, Y) :-
    Vars = [X,Y],
    domain(Vars, 1, 99),
    all_distinct(Vars),
    X-3 #= Y+5,
    labeling([], Vars).
