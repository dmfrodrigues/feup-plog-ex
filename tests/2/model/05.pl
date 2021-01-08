:- use_module(library(clpfd)).
:- use_module(library(lists)).

create_list_increments(0, []).
create_list_increments(N, L) :-
    N1 is N-1,
    create_list_increments(N1, L1),
    append(L1, [N], L).

process_shelf(Width, task(0, 1, 1, Width, Machine), Machine).

process_board(Idx, Width, machine(Idx, Width)).

% cut(+Shelves,+Boards,-SelectedBoards)
cut(Shelves, Boards, SelectedBoards) :-
    maplist(process_shelf, Shelves, Tasks, SelectedBoards),
    length(Boards, NBoards),
    create_list_increments(NBoards, Idx),
    maplist(process_board, Idx, Boards, Machines),
    domain(SelectedBoards, 1, NBoards),
    cumulatives(Tasks, Machines, [bound(upper)]),
    !,
    labeling([], SelectedBoards).
