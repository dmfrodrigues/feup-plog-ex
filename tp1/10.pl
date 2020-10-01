comprou(joao, honda).
ano(honda, 1997).
valor(honda, 20000).

comprou(joao, uno).
ano(uno, 1998).
valor(uno, 7000).

pode_vender(P, C, A) :-
    comprou(P, C),
    ano(C, A1),
    A =< A1 + 10,
    valor(C, V),
    V < 10000.
