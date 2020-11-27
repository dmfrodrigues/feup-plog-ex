:-
    reconsult('info.pl').

/**
 * isAgeAppropriate(+Name, +Game)
 * 
 * Sucede se Game é um jogo adequado à idade da pessoa Name.
 */
isAgeAppropriate(Name, Game) :-
    player(Name, _, Age),
    game(Game, _, MinAge),
    Age >= MinAge.

/*
| ?- isAgeAppropriate('Danny', '5 ATG').
yes
| ?- isAgeAppropriate('Manny', '5 ATG').
no
*/
