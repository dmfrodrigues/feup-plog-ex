:-
    reconsult('02a.pl').

valor(estado(Tabuleiro), V) :- valor(Tabuleiro, 1/1, V).

valor(_, 8/9, 0) :- !.
valor([_|Tabuleiro], I/9, V) :- I1 is I+1, valor(Tabuleiro, I1/1, V).
valor([[0|Linha]|Tabuleiro], I/J, V) :- !,
    J1 is J+1,
    valor([Linha|Tabuleiro], I/J1, V).
valor([[Peca|Linha]|Tabuleiro], I/J, V) :-
    J1 is J+1,
    valor([Linha|Tabuleiro], I/J1, V1),
    peca(PecaTipo, Jogador, Peca), 
    valor_peca(PecaTipo, Jogador, I/J, V2),
    V is V1+V2.

valor_peca(Tipo, Jogador, Pos, Valor) :-
    valor_tipo_peca(Tipo, V1),
    valor_pos_peca(Pos, V2),
    (Jogador = b -> Valor is V1*V2 ; Valor is -V1*V2).

valor_tipo_peca(peao  , 1).
valor_tipo_peca(cavalo, 3).
valor_tipo_peca(bispo , 3).
valor_tipo_peca(rei   , 4).
valor_tipo_peca(torre , 5).
valor_tipo_peca(rainha, 9).

valor_pos_peca(I/J, V) :- V is 7-(min(abs(I-4), abs(I-5))+min(abs(J-4), abs(J-5))).

:-
    estado_inicial(Estado),
    valor(Estado, V),
    write(V), nl.
