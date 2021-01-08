:- use_module(library(lists)).

p1(L1,L2) :-
    gen(L1,L2),
    test(L2).

gen([],[]).
gen(L1,[X|L2]) :-
    select(X,L1,L3),
    gen(L3,L2).

test([_,_]).
test([X1,X2,X3|Xs]) :-
    (X1 < X2, X2 < X3; X1 > X2, X2 > X3),
    test([X2,X3|Xs]).

% O predicado gen(+L, -P) gera uma permutação de L.
% Quando se faz backtrack a este predicado, ele retorna todas as permutações de L.
%
% O predicado test(+L) sucede se L estiver ordenada de forma
% estritamente crescente, ou estritamente decrescente
%
% O predicado p1(+L, -R) retorna em R a lista L ordenada.
% Quando se faz backtrack a este predicado,
% ele retorna L ordenado de forma estritamente crescente
% e de forma estritamente decrescente;
% o que aparece primeiro depende de qual é gerado primeiro por gen/2.
%
% A eficiência desta abordagem é muito fraca, dado que no pior caso e no caso médio são geradas
% todas as permutações de L até se encontrar a permutação que está ordenada, e por cada
% permutação avalia-se se está ordenada. Assim, a complexidade deste algoritmo é O(N!*N) que
% é muito fraco quando comparado com O(N log N) de mergesort ou quicksort, ou O(N^2) de bubblesort.
