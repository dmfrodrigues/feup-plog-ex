:-
    use_module(library(clpfd)),
    use_module(library(lists)).

create_matrix(1, C, [L]) :- !, length(L, C).
create_matrix(R, C, [L|M]) :-
    length(L, C),
    R1 is R-1,
    create_matrix(R1, C, M).

flatten([], []).
flatten([X|L], R) :- !,
    flatten(L, L1),
    append(X, L1, R).

constrain_lines([], []).
constrain_lines([X|L], [R|M]) :-
    sum(R, #=, X),
    constrain_lines(L, M).

constrain_columns(L, M) :-
    transpose(M, MT),
    constrain_lines(L, MT).

solve_me(Lx, Ly, M) :-
    length(Lx, Nx),
    length(Ly, Ny),

    create_matrix(Ny, Nx, M),
    flatten(M, Mflat), domain(Mflat, 0, 1),
    
    constrain_lines(Ly, M),
    constrain_columns(Lx, M),

    labeling([], Mflat).

write_line([]).
write_line([0|L]) :- format("  ", []), write_line(L).
write_line([1|L]) :- format("* ", []), write_line(L).

write_matrix([]).
write_matrix([L|M]) :-
    write_line(L), nl,
    write_matrix(M).

:-
    Lx = [0,0,7,1,6,3,4,5,2,7,0,0],
    Ly = [0,0,8,2,6,4,5,3,7,0,0],
    solve_me(Lx, Ly, M),
    write_matrix(M), nl.
