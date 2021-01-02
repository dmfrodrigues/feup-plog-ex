between(L, R, X) :-
    ground(X),
    L =< X, X =< R.

/**
 * estado(tabuleiro)
 */

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

estado_inicial(
    estado(
        [
            [25, 29, 27, 31, 32, 28, 30, 26],
            [17, 18, 19, 20, 21, 22, 23, 24],
            [ 0,  0,  0,  0,  0,  0,  0,  0],
            [ 0,  0,  0,  0,  0,  0,  0,  0],
            [ 0,  0,  0,  0,  0,  0,  0,  0],
            [ 0,  0,  0,  0,  0,  0,  0,  0],
            [ 1,  2,  3,  4,  5,  6,  7,  8],
            [ 9, 13, 11, 15, 16, 12, 14, 10]
        ]
    )
).
