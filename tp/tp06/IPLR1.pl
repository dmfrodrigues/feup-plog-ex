:- use_module(library(clpfd)).
:- use_module(library(lists)).

magicN(N, Vars) :-
    ground(N),
    N > 2,
    % dicas: sum/3, all_distinct/1, domain
    D is N*N, % Maximum
    %board
    length(Linhas, N),
    maplist(same_length(Linhas), Linhas),
    transpose(Linhas, Colunas),
    
