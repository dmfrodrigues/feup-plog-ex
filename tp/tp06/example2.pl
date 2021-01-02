:- use_module(library(clpfd)).
:- use_module(library(lists)).

quadrante([], [], []).
quadrante([N1,N2,N3|Ns1], [N4, N5, N6|Ns2], [N7, N8, N9|Ns3]) :- ???.

sudoku(Linhas) :-
    length(Linhas, 9),                      % Board
    maplist(same_length(Linhas), Linhas),   % list with 9 lists with 9 vars
    Linhas = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
    transpose(Linhas, Colunas),
    append(Linhas, Vars),                   % Variables
    domain(Vars, 1, 9),                     % Domain
    maplist(all_distinct, Linhas),          % Restrictions
    maplist(all_distinct, Colunas),
    quadrante(As, Bs, Cs),
    quadrante(Ds, Es, Fs),
    quadrante(Gs, Hs, Is),
    labeling([], Vars),                     % Search for solutions
    maplist(pprint_row, Linhas).
