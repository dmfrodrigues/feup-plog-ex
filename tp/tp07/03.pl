between(L, R, X) :-
    ground(X),!,
    L =< X, X =< R.
between(L, R, L) :- L =< R.
between(L, R, X) :- L =< R, L1 is L+1, between(L1, R, X).

vence([X], X, []).
vence(L, X, L1) :-
    joga(L, X, L1),
    \+(vence(L1, _, _)).

joga(L, X, L1) :-
    append(Lleft, [X|Lright], L),
    append(Lleft, Lright, L1).
joga(L, Y, L1) :-
    append(Lleft, [X|Lright], L),
    X1 is X-1,
    between(1, X1, Y),
    Z is X-Y,
    append(Lleft, [Z|Lright], L1).
