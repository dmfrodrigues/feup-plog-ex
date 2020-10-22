/*
membro(X, [X|_]):- !.
membro(X, [_|Y]):- membro(X,Y).

concatena([], L, L).
concatena([X|Y], L, [X|Lista]):- concatena(Y, L, Lista).

inverte([X], [X]).
inverte([X|Y], Lista) :- inverte(Y, Lista1), concatena(Lista1, [X], Lista).
*/

:- use_module(library(lists)).

membro(X, L) :- member(X, L).

concatena(L1, L2, R) :- append(L1, L2, R).

inverte(L, R) :- reverse(L, R).
