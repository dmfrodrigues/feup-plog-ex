% estado_jogo(tabuleiro(1/[0,0,0,0,0,0,0,0], 2/[1,2,3,4,5,6,7,8], ..., 8/[0,0,0,0,0,0,0,0]), PecasBrancas, PecasPretas, Jogador)

% tabuleiro(numLinha, PecasNaLinha, ...)

% peca
% Tipo: peao, torre, bispo, cavalo, rainha, rei
% Jogador: b, p
peca(peao  , p, N) :- between( 1,  8, N).
peca(torre , p, N) :- between( 9, 10, N).
peca(bispo , p, N) :- between(11, 12, N).
peca(cavalo, p, N) :- between(13, 14, N).
peca(rainha, p, N) :- between(15, 15, N).
peca(rei   , p, N) :- between(16, 16, N).

peca(peao  , b, N) :- between(17, 24, N).
peca(torre , b, N) :- between(25, 26, N).
peca(bispo , b, N) :- between(27, 28, N).
peca(cavalo, b, N) :- between(29, 30, N).
peca(rainha, b, N) :- between(31, 31, N).
peca(rei   , b, N) :- between(32, 32, N).

estado_jogo(tabuleiro(1/[9, 13, 11, ...],
                      2/[1,2,3,4,5,6,7,8],...),
            [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],
            [17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32],
            p).

% JP02.b)
pecas_do_jogador(b, e(_Tabuleiro, B, _P, _), B).
pecas_do_jogador(p, e(_Tabuleiro, _B,_P, _), B).
jogador(e(_T, B, _P, Jogador), Jogador).
tabuleiro(e(Tabuleiro, _B, _P, _Jogado), Tabuleiro).

% valor_posicao(+Pos@{x/y}, -Valor)
valor_posicao(X/Y, 1  ) :- (X == 1; X == 8; Y == 1; Y == 8),!.
valor_posicao(X/Y, 1.1) :- (X == 2; X == 7; Y == 2; Y == 7),!.
% ... 

valor_peca(peao, 1).
valor_peca(torre, 10).
valor_peca(cavalo, 20).
valor_peca(bispo, 20).
valor_peca(rainha, 50).
valor_peca(rei, 0).

% utilidade(+Estado, -Valor)
utilidade(Estado, Valor) :-


    utilidade_pas_pecas(Pecas, Estado, Valor),
    !.
% utilidade_das_pecas(+Lista, +Estado, -Valor)





% utilidade_da_peca(PecaId, Estado, Valor)
% valor_peca(+Peca, -Valor)
% valor_posicao(+Pos, -Valor)
