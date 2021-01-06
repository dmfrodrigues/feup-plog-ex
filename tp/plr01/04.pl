:-
    use_module(library(clpfd)).

flatten([], []) :- !.
flatten([X|L], R) :- !,
    flatten(L, L1),
    append(X, L1, R).

constrain_first_digit([]).
constrain_first_digit([X|L]) :- ground(X), !, constrain_first_digit(L).
constrain_first_digit([X|_]) :- X #\= 0.

get_val(L, Val) :-
    get_val(L, Val, 0).
get_val([], X, X).
get_val([X|L], Val, Acc) :-
    Acc1 #= 10*Acc + X,
    get_val(L, Val, Acc1).

delete_duplicate_vars([], []).
delete_duplicate_vars([X|Vars], VarsPurged) :- is_duplicate_var(X, Vars), !, delete_duplicate_vars(Vars, VarsPurged).
delete_duplicate_vars([X|Vars], VarsPurged) :- ground(X), !, delete_duplicate_vars(Vars, VarsPurged).
delete_duplicate_vars([X|Vars], [X|VarsPurged]) :- delete_duplicate_vars(Vars, VarsPurged).

is_duplicate_var(X, [Y|Vars]) :- X == Y.
is_duplicate_var(X, [_|Vars]) :- is_duplicate_var(X, Vars).

solve(A, B, C) :-
    flatten([A,B,C], Vars),
    delete_duplicate_vars(Vars, VarsPurged),
    domain(VarsPurged, 0, 9),
    all_different(VarsPurged),
    constrain_first_digit(A),
    constrain_first_digit(B),
    constrain_first_digit(C),
    get_val(A, Aval),
    get_val(B, Bval),
    get_val(C, Cval),
    Aval+Bval #= Cval,
    labeling([], VarsPurged).

test1 :-
    A1 = [0,S,E,N,D],
    A2 = [0,M,O,R,E],
    A3 = [M,O,N,E,Y],
    solve(A1, A2, A3),
    write(A1),nl,write(A2),nl,write(A3),nl.
test2 :-
    A1 = [D,O,N,A,L,D],
    A2 = [G,E,R,A,L,D],
    A3 = [R,O,B,E,R,T],
    solve(A1, A2, A3),
    write(A1),nl,write(A2),nl,write(A3),nl.
test3 :-
    A1 = [0,C,R,O,S,S],
    A2 = [0,R,O,A,D,S],
    A3 = [D,A,N,G,E,R],
    solve(A1, A2, A3),
    write(A1),nl,write(A2),nl,write(A3),nl.


:-
    test1,
    test2,
    test3.
