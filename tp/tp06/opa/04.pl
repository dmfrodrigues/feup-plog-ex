:- op(200, xfx, existe_em).
X existe_em [X|_].
X existe_em [_|L] :- X existe_em L.

:- op(100, xfx, e).
:- op(200, xfx, da).
:- op(300, xfx, concatena).
concatena [] e L da L.
concatena [H|L1] e L2 da [H|L3] :-
    concatena L1 e L2 da L.

:- op(100, xfx, a).
:- op(300, xfx, apaga).
apaga E a [E|L] da L :- !.
apaga E a [F|L] da [F|R] :-
    apaga E a L da R.
