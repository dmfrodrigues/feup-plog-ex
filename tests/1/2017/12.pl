:-
    reconsult('11.pl').

/**
 * areClose(+DistMax, +Dist, -Ret)
 * 
 * Recebe como primeiro argumento uma distancia maxima,
 * como segundo argumento uma matriz de distancias
 * e instancia o terceiro argumento com a lista de pares de objetos
 * que estao a uma distancia igual ou inferir à distancia dada no primeiro argumento.
 * A lista resultante nao deve ter pares simetricos.
 */
areClose(DistMax, Dist, Ret) :-
    length(Dist, L),
    findall(
        U/V,
        (
            between(1, L, U),
            between(1, L, V),
            U > V,
            distance(Dist, U, V, D),
            D =< DistMax
        ),
        Ret
    ).

between(L, R, L) :- L =< R.
between(L, R, X) :-
    L =< R,
    L1 is L+1,
    between(L1, R, X).


/*
| ?- areClose(3, MatDist, Pares).
Pares = [3/2, 4/3, 5/3, 5/4] ? ;
no
*/
