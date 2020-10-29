se(X) :- X.
entao(X,Y) :-
    X,
    Y. % mas ignorar o resultado de Y
senao(Y,_) :- Y,!.
senao(_,Z) :- Z.

/**
 * Solution in exercises document:
 * se X entao Y senao Z
 * se(X) entao Y senao Z
 * se(X) entao senao(Y,Z)
 * entao(se(X),senao(Y,Z))
 */

:- op(300,xfx,entao).
:- op(500,fx,se).
:- op(400,xfx,senao).

/*
 * Correct priorities:
 * se X entao Y senao Z
 * se entao(X, Y) senao Z
 * se senao(entao(X,Y),Z)
 * se(senao(entao(X,Y),Z))
 */
