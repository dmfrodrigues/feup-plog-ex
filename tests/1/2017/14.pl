:-
    reconsult('13.pl').

/**
 * distance/4
 * 
 * recebe nos dois primeiros argumentos o nome de dois objetos,
 * recebe um dendograma no terceiro argumento
 * e devolve no quarto argumento a distancia entre os dois objetos dados.
 *
 * Assuma que os objetos existem sempre no dendograma.
 */
distance(U, V, node(_, Left, _), D) :-
    distance_down(U, Left, _),
    distance_down(V, Left, _), !,
    distance(U, V, Left, D).
distance(U, V, node(_, _, Right), D) :-
    distance_down(U, Right, _),
    distance_down(V, Right, _), !,
    distance(U, V, Right, D).
distance(U, V, Node, D) :-
    distance_down(U, Node, D1),
    distance_down(V, Node, D2),
    D is max(D1, D2).

distance_down(U, U, 0) :- !.
distance_down(U, node(_, Left, _), D) :-
    distance_down(U, Left, D1),
    D is D1+1.
distance_down(U, node(_, _, Right), D) :-
    distance_down(U, Right, D1),
    D is D1+1.

/*
| ?- distance(brasil, niger, DendogramaFigura2, Distancia).
Distancia = 4 ? ;
no
*/
