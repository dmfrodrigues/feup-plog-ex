:-
    reconsult('info1.pl').

/**
 * allPerfs
 * 
 * imprime na consola os números dos participantes que já atuaram,
 * juntamente com o nome da sua atuação e lista de tempos
 */
allPerfs :- allPerfs([]).

allPerfs(Visited) :-
    idNotIn(Visited, Id),!,
    printPerf(Id),
    allPerfs([Id|Visited]).
allPerfs(_).

printPerf(Id) :-
    participant(Id, _, Performance),
    performance(Id, Times),
    write(Id),format(":",[]),write(Performance),format(":",[]),write(Times),nl.

idNotIn(Visited, Id) :-
    performance(Id,_),
    \+(member(Id, Visited)).
