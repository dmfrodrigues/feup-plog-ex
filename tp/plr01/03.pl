:-
    use_module(library(clpfd)).

% solve_n_queens(4, Solution) :-
%     Solution = [A, B, C, D],
%     domain(Solution, 1, 4),
%     all_distinct(Solution),
%     A-B #\= 1, A-B #\= -1, A-C #\= 2, A-C #\= -2, A-D #\= 3, A-D #\= -3,
%     B-C #\= 1, B-C #\= -1, B-D #\= 2, B-D #\= -2,
%     C-D #\= 1, C-D #\= -1,
%     labeling([], Solution).

solve_n_queens(N, Solution) :-
    length(Solution, N),
    domain(Solution, 1, N),
    all_distinct(Solution),
    restrict_diag(Solution),
    labeling([], Solution).

restrict_diag([]).
restrict_diag([X|Solution]) :-
    restrict_diag_cycle(1, X, Solution),
    restrict_diag(Solution).

restrict_diag_cycle(_, _, []).
restrict_diag_cycle(I, X, [X1|Solution]) :-
    X-X1 #\= I,
    X-X1 #\= -I,
    I1 is I+1,
    restrict_diag_cycle(I1, X, Solution).

:-
    solve_n_queens(8, Solution),
    write(Solution).
