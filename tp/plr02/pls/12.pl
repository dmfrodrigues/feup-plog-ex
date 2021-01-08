:-
    use_module(library(clpfd)).

solve_me(Vars) :-
    Vars = [
        HCI, HCF, HDI, HDF,
        LCI, LCF, LDI, LDF
    ],

    domain(Vars, 0, 1000),

    HCI+HCF+HDI+HDF #= 52, HCI+HDI #= 27,
    HDI+HDF+LDI+LDF #= 34, HDF #= 3,
    HCI+HDI+LCI+LDI #= 46, HCI+LCI #= 23,
    LCF+LDF #= 20,
    LCI+LCF #= 31,

    sum(Vars, #=, Total),

    labeling([], Vars), !,

    write(Vars), nl,
    write(Total), nl,

    true.

:-
    solve_me(_).
