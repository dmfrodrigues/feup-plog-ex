/*
A forma mais interessante de guardar uma matriz é guardá-la como uma lista de listas.
Dada a simetria da matriz, basta armazenar apenas um dos triângulos da matriz.
Considerando ainda o facto óbvio de que a distância entre um objeto
e si mesmo é sempre 0, não há necessidade de o guardar na matriz de distâncias.

Assim, ficamos com uma lista de listas que representa o triângulo inferior
da matriz de distâncias, excluindo a diagonal principal.

O primeiro elemento é vazio por motivos de conveniência e de regularidade na
estrutura da matriz, para as variáveis (i,j) poderem ter uma natureza simétrica
em vez de ser necessário subtrair 1 a i ou usar nth0 e nth1 ao mesmo tempo.
*/

dist(
    [
        [],
        [8],
        [8, 2],
        [7, 4, 3],
        [7, 4, 3, 1]
    ]
).

:-
    use_module(library(lists)).

distance(U, V, D) :-
    dist(Dist),
    distance(Dist, U, V, D).

distance(_, U, U, 0) :- !.
distance(Dist, U, V, D) :-
    V > U, !,
    distance(Dist, V, U, D).
distance(Dist, U, V, D) :-
    nth1(U, Dist, Line),
    nth1(V, Line, D).
