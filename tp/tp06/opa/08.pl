se(X) :- X.
entao(X, Y) :- X, Y.
senao(X, Y) :- X,!.
senao(X, Y) :- Y.
:=(X,Y) :- X is Y.

:- op(999, fx, se).
:- op(998, xfx, senao).
:- op(997, xfx, entao).
:- op(990, xfy, :=).

/*
:- se X entao Y senao Z.
:- se(X entao Y senao Z).
:- se(senao(X entao Y,Z).
:- se(senao(entao(X,Y),Z).
*/
