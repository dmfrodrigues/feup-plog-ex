/**
 * disponibilidade(+Nome, -Lista:disp(PrimeiroDia, UltimoDia))
 */
disponibilidade(pedro, [disp(2,4), disp(12,20), disp(25,28)]).

/**
 * disponivel_no_dia(+Dia, +Lista:disp(PrimeiroDia, UltimoDia))
 * 
 * Verifica se a lista de disponibilidades inclui o dia Dia
 */
disponivel_no_dia(Dia, [disp(L, R)|_]) :- L =< Dia, Dia =< R, !.
disponivel_no_dia(Dia, [_|L]) :- disponivel_no_dia(Dia, L).

/**
 * pessoa_disponivel_no_dia(+Dia, +Pessoa)
 * 
 * Verifica se Pessoa se encontra disponivel no dia Dia.
 */
pessoa_disponivel_no_dia(Dia, Pessoa) :-
    disponibilidade(Pessoa, Disponibilidade),
    disponivel_no_dia(Dia, Disponibilidade).

/**
 * disponiveis_no_dia(+Dia, -Pessoas)
 */
disponiveis_no_dia(Dia, Pessoas) :-
    findall(Pessoa, pessoa_disponivel_no_dia(Dia, Pessoa), Pessoas).
