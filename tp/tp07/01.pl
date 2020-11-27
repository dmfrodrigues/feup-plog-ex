/**
 * salto_cavalo(Quad1, Quad2)
 * 
 * .P.P.
 * P...P
 * ..H..
 * P...P
 * .P.P.
 */
salto_cavalo(X/Y, X1/Y1) :- X1 is X+2, Y1 is Y+1, 1 =< X1, X1 =< 8, 1 =< Y1, Y1 =< 8.
salto_cavalo(X/Y, X1/Y1) :- X1 is X+1, Y1 is Y+2, 1 =< X1, X1 =< 8, 1 =< Y1, Y1 =< 8.
salto_cavalo(X/Y, X1/Y1) :- X1 is X-1, Y1 is Y+2, 1 =< X1, X1 =< 8, 1 =< Y1, Y1 =< 8.
salto_cavalo(X/Y, X1/Y1) :- X1 is X-2, Y1 is Y+1, 1 =< X1, X1 =< 8, 1 =< Y1, Y1 =< 8.
salto_cavalo(X/Y, X1/Y1) :- X1 is X-2, Y1 is Y-1, 1 =< X1, X1 =< 8, 1 =< Y1, Y1 =< 8.
salto_cavalo(X/Y, X1/Y1) :- X1 is X-1, Y1 is Y-2, 1 =< X1, X1 =< 8, 1 =< Y1, Y1 =< 8.
salto_cavalo(X/Y, X1/Y1) :- X1 is X+1, Y1 is Y-2, 1 =< X1, X1 =< 8, 1 =< Y1, Y1 =< 8.
salto_cavalo(X/Y, X1/Y1) :- X1 is X+2, Y1 is Y-1, 1 =< X1, X1 =< 8, 1 =< Y1, Y1 =< 8.

trajecto_cavalo([_]).
trajecto_cavalo([Pos1, Pos2 | Traj]) :-
    salto_cavalo(Pos1, Pos2),
    trajecto_cavalo([Pos2|Traj]).

% (c) trajecto_cavalo([2/1, J1, 5/4, J3, J4x/8]).
