:-
    use_module(library(clpfd)),
    use_module(library(lists)).

% solve_magic_square(+N, -Solution)
% solve_magic_square(3, Solution) :- !,
%     NN is 3*3,
%     Solution = [
%         [A, B, C],
%         [D, E, F],
%         [G, H, I]
%     ],
%     Vars = [A,B,C,D,E,F,G,H,I],
%     domain(Vars, 1, NN),
%     all_distinct(Vars),
%     S #= A+B+C, S #= D+E+F, S #= G+H+I,
%     S #= A+D+G, S #= B+E+H, S #= C+F+I,
%     S #= A+E+I, S #= C+E+G,
%     labeling([], Vars).
% solve_magic_square(4, Solution) :- !,
%     NN is 4*4,
%     Solution = [
%         [A, B, C, D],
%         [E, F, G, H],
%         [I, J, K, L],
%         [M, N, O, P]
%     ],
%     Vars = [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],
%     domain(Vars, 1, NN),
%     all_distinct(Vars),
%     S #= A+B+C+D, S #= E+F+G+H, S #= I+J+K+L, S #= M+N+O+P,
%     S #= A+E+I+M, S #= B+F+J+N, S #= C+G+K+O, S #= D+H+L+P,
%     S #= A+F+K+P, S #= D+G+J+M,
%     labeling([], Vars).

solve_magic_square(N, Solution) :- !,
    NN is N*N,
    S #= (N*(N*N+1))/2,
    create_magic_square(N, Solution),
    flatten(Solution, Vars),
    domain(Vars, 1, NN),
    all_distinct(Vars),
    restrict_lines(Solution, S),
    restrict_columns(Solution, S),
    restrict_diagonals(Solution, S),
    labeling([], Vars).

create_magic_square(N, Solution) :-
    create_magic_square_cycle(1, N, Solution).

create_magic_square_cycle(I, N, []) :- I > N, !.
create_magic_square_cycle(I, N, [Line|Solution]) :-
    length(Line, N),
    I1 is I+1,
    create_magic_square_cycle(I1, N, Solution).

flatten([], []) :- !.
flatten([X|L], R) :- !,
    flatten(L, L1),
    append(X, L1, R).

restrict_lines([], _).
restrict_lines([L|Solution], S) :-
    sum(L, #=, S),
    restrict_lines(Solution, S).

restrict_columns(Solution, S) :-
    transpose(Solution, Solution1),
    restrict_lines(Solution1, S).

restrict_diagonals(Solution, S) :-
    length(Solution, N),
    get_main_diagonal(Solution, N, Diag1), sum(Diag1, #=, S),
    get_main_antidiagonal(Solution, N, Diag2), sum(Diag2, #=, S).

get_main_diagonal(Solution, N, Diag) :-
    get_main_diagonal(1, Solution, N, Diag).

get_main_diagonal(I, _, N, []) :- I > N, !.
get_main_diagonal(I, Solution, N, [X|Diag]) :-
    nth1(I, Solution, Line), nth1(I, Line, X),
    I1 is I+1,
    get_main_diagonal(I1, Solution, N, Diag).

get_main_antidiagonal(Solution, N, Diag) :-
    get_main_antidiagonal(1, Solution, N, Diag).

get_main_antidiagonal(I, _, N, []) :- I > N, !.
get_main_antidiagonal(I, Solution, N, [X|Diag]) :-
    J is N-I+1,
    nth1(I, Solution, Line), nth1(J, Line, X),
    I1 is I+1,
    get_main_antidiagonal(I1, Solution, N, Diag).

:-
    solve_magic_square(5, Solution),
    write(Solution).
