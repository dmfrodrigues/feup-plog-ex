:- reconsult('03.pl').

inverter([], []).
inverter([X|L], R) :-
    inverter(L, R1),
    anexar(R1, [X], R).

% palindroma(L) :- inverter(L, L).
palindroma([]).
palindroma([_]).
palindroma([X|L]) :-
    anexar(L1, [X], L),
    palindroma(L1).
