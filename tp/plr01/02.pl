:-
    use_module(library(clpfd)).

flatten([], []) :- !.
flatten([X|L], R) :- !,
    flatten(L, L1),
    append(X, L1, R).

solve :-
    Cor = [Red, Yel, Blu, Gre, Whi],
    Nac = [Eng, Spa, Nor, Ukr, Por],
    Beb = [Ora, Tea, Cof, Mil, Wat],
    Cig = [Mar, Che, Win, Luk, SGL],
    Ani = [Dog, Fox, Igu, Hor, Zeb],
    flatten([Cor, Nac, Beb, Cig, Ani], Vars),
    domain(Vars, 1, 5),
    all_distinct(Cor),
    all_distinct(Nac),
    all_distinct(Beb),
    all_distinct(Cig),
    all_distinct(Ani),
    Eng #= Red,
    Spa #= Dog,
    Nor #= 1,
    Yel #= Mar,
    abs(Che-Fox) #= 1,
    abs(Nor-Blu) #= 1,
    Win #= Igu,
    Luk #= Ora,
    Ukr #= Tea,
    Por #= SGL,
    abs(Mar-Hor) #= 1,
    Gre #= Cof,
    Gre #= Whi+1,
    Mil #= 3,
    labeling([], Vars),
    format("Zeb=~d~n", [Zeb]),
    format("Wat=~d~n", [Wat]).

:-
    solve.
