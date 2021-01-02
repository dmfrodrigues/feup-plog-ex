:-
    reconsult('info.pl').

/**
 * updatePlayer(+Player, +Game, +Hours, +Percentage)
 * 
 * Atualiza a base de conhecimento relativamente ao número de horas
 * que o jogador Player jogou o jogo Game.
 */
updatePlayer(Player, Game, Hours, Percentage) :-
    played(Player, Game, OldHours, OldPercentage),
    NewHours is OldHours + Hours,
    NewPercentage is OldPercentage + Percentage,
    retract(played(Player, Game, _, _)),
    assert(played(Player, Game, NewHours, NewPercentage)).

/*
| ?- played('Best Player Ever', 'Duas Botas', Hours, Percent).
Hours = 33,
Percent = 22 ? ;
no

| ?- updatePlayer('Best Player Ever', 'Duas Botas', 5, 12).
yes

| ?- played('Best Player Ever', 'Duas Botas', Hours, Percent).
Hours = 38,
Percent = 34 ? ;
no
*/
