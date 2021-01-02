:- use_module(library(clpfd)).
:- use_module(library(lists)).

nome2id(1, 'Joao').
nome2id(2, 'Antonio').
nome2id(3, 'Francisco').
ins2id(1, 'Piano').
ins2id(2, 'Violino').
ins2id(3, 'Harpa').

musicos(Sol) :-
    Vars = [Piano, Violino, Harpa],
    domain(Vars, 1, 3),                     % Domain
    all_distinct(Vars),
    nome2id(Joao, 'Joao'), nome2id(Antonio, 'Antonio'), nome2id(Francisco, 'Francisco'),
    Piano #\= Antonio,
    Violino #\= Joao,
    Piano #\= Joao,
    labeling([], Vars),
    maplist(nome2id, Vars, Sol).                     % Search for solutions