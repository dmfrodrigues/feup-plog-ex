:-
    reconsult('info.pl').

/**
 * timePlayingGames(+Player, +Games, -ListOfTimes, -SumTimes)
 * 
 * Determina o numero total de horas que o jogador Player investiu
 * a jogar cada um dos jogos indicados na lista Games,
 * retornando em ListOfTimes os tempos de cada um dos jogos na ordem respetiva,
 * e em SumTimes o numero total de horas.
 */
timePlayingGames(Player, [Game], [Time], Time) :-
    played(Player, Game, Time, _), !.
timePlayingGames(_, [_], [0], 0) :- !.
timePlayingGames(Player, [Game|Games], [Time|ListOfTimes], NewSumTimes) :-
    timePlayingGames(Player, Games, ListOfTimes, SumTimes),
    timePlayingGames(Player, [Game], [Time], Time),
    NewSumTimes is SumTimes+Time.

/*
| ?- timePlayingGames('Best Player Ever', ['5 ATG', 'Duas Botas'], LT, ST).
LT = [3, 33],
ST = 36 ? ;
no
| ?- timePlayingGames('Worst Player Ever', ['Duas Botas'], LT, ST).
LT = [0],
ST = 0 ? ;
no
*/
