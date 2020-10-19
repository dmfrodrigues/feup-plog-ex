produto_interno([], [], 0).
produto_interno([X1|L1], [X2|L2], N) :-
    produto_interno(L1, L2, N1),
    N is N1 + X1*X2.
