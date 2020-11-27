/*
predX(IdadeLimite, Participantes, Performances) retorna em Performances os nomes das performances realizadas por pessoas em Participantes com idade inferior ou igual a IdadeLimite.


O cut utilizado é verde, dado que cada expressão de predX faz a verificação dos seus requisitos, e não depende do backtracking de outras expressões para poder assumir que os seus próprios requisitos são cumpridos. Isto porque:

- A 1ª expressão verifica que o 2º argumento não é uma lista vazia e que I=<Q;

- A 2ª expressão verifica que o 2º argumento não é uma lista vazia e que I > Q;

- A 3ª expressão verifica que o 2º argumento é uma lista vazia.

Em suma, o cut é verde porque não afeta o conjunto de soluções possíveis, dado que cada expressão de predX faz toda a verificação que necessita para ser aplicada de forma correta.
*/

:-
    reconsult('info1.pl').

predX(Q,[R|Rs],[P|Ps]) :-
    participant(R,I,P), I=<Q,
    predX(Q,Rs,Ps).
predX(Q,[R|Rs],Ps) :-
    participant(R,I,_), I>Q,
    predX(Q,Rs,Ps).
predX(_,[],[]).
