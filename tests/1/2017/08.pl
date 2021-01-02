:-
    use_module(library(lists)).

:-
    reconsult('info.pl').

/**
 * averageAge(+Game, -AverageAge)
 * 
 * Determina a idade media dos jogadores que jogam o jogo Game.
 */
averageAge(Game, AverageAge) :-
    findall(
        Age,
        (
            played(Player, Game, _, _),
            player(_, Player, Age)
        ),
        Ages
    ),
    average(Ages, AverageAge).

/**
 * average(+List, -A)
 * 
 * Determina a média aritmética dos valores
 * em List, e retorna em A.
 */
average(List, A) :-
    sumlist(List, S),
    length(List, L),
    A is S/L.

/*
| ?- averageAge('5 ATG', AA).
AA = 25.5 ? ;
no

| ?- averageAge('Duas Botas', AA).
AA = 26.5 ? ;
no
*/
