:-
    reconsult('info.pl').

/**
 * fewHours(+Player, -Games)
 * 
 * Devolve em Games a lista de jogos nos quais
 * o jogador Player investiu menos de 10h a jogar.
 */
fewHours(Player, Games) :- fewHours(Player, [], Games).

/**
 * fewHours(+Player, +Visited, -Games)
 * 
 * Devolve em Games a lista de jogos nos quais
 * o jogador Player investiu menos de 10h a jogar,
 * e que nao estejam em Visited.
 */
fewHours(Player, Visited, []) :-
    \+(fewHoursGame(Player, Visited, _)), !.
fewHours(Player, Visited, [Game|Games]) :-
    fewHoursGame(Player, Visited, Game),
    fewHours(Player, [Game|Visited], Games).

fewHoursGame(Player, Visited, Game) :-
    played(Player, Game, Hours, _),
    Hours < 10,
    \+(member(Game, Visited)).

/*
| ?- fewHours('Best Player Ever', G).
G = ['5 ATG'] ? ;
no

| ?- fewHours('Worst Player Ever', G).
G = [] ? ;
no
*/
