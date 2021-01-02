:-
    use_module(library(lists)).

:-
    reconsult('05a.pl').

create_list(_, 0, []) :- !.
create_list(X, N, [X|L]) :- N1 is N-1, create_list(X, N1, L).

/**
 * possibilidade_reuniao(+Nomes, -Possibilidades:poss(PrimeiroDia, UltimoDia))
 * 
 * Lista de possiveis datas de uma reuniao em que participe toda a gente em Nomes. 
 */
possibilidade_reuniao(Nomes, Possibilidades) :-
    possibilidade_reuniao(Nomes, Possibilidades, 1).

/**
 * possibilidade_reuniao(Nomes, Possibilidades, Dia)
 */
possibilidade_reuniao(_, [], 32) :- !.
possibilidade_reuniao(Nomes, Possibilidades, Dia) :-                % nem toda a gente disponivel neste dia
    Dia < 32,
    length(Nomes, L),
    create_list(Dia, L, Dias),
    \+(maplist(pessoa_disponivel_no_dia, Dias, Nomes)),!,
    Dia1 is Dia+1,
    possibilidade_reuniao(Nomes, Possibilidades, Dia1).

possibilidade_reuniao(Nomes, [poss(Dia, R)|Possibilidades], Dia) :- % toda a gente disponível neste dia
    Dia < 32,
    Dia1 is Dia+1,
    possibilidade_reuniao(Nomes, [poss(Dia1,R)|Possibilidades], Dia1), !.
possibilidade_reuniao(Nomes, [poss(Dia, Dia)|Possibilidades], Dia) :- % toda a gente disponível neste dia
    Dia < 32,
    Dia1 is Dia+1,
    possibilidade_reuniao(Nomes, Possibilidades, Dia1).
