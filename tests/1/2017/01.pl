:-
    reconsult('info.pl').

/**
 * achievedALot(+Player)
 * 
 * Sucede se o jogador Player completou pelo menos 80% em algum jogo.
 */
achievedALot(Player) :-
    played(Player, _, _, N),
    N >= 80, !.

/*
| ?- achievedALot('Best Player Ever').
yes
| ?- achievedALot('Worst Player Ever').
no
*/
