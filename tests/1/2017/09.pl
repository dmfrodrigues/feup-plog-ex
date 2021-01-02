:-
    reconsult('info.pl').

/**
 * mostEffectivePlayers(+Game, -Players)
 * 
 * Determina o jogador ou jogadores que jogam o jogo Game com maior eficiencia.
 * O jogador mais eficiente é aquele que conseguiu alcancar uma maior
 * percentagem de conclusao do jogo num menor numero de horas.
 */
mostEffectivePlayers(Game, Players) :-
    maxEfficiency(Game, MaxEfficiency),
    playersWithEfficiency(Game, MaxEfficiency, Players).

maxEfficiency(Game, MaxEfficiency) :-
    findall(
        Efficiency,
        (
            played(_, Game, Hours, Percentage),
            Efficiency is Percentage/Hours
        ),
        Efficiencies
    ),
    max_member(MaxEfficiency, Efficiencies).

playersWithEfficiency(Game, Efficiency, Players) :-
    findall(
        Player,
        (
            played(Player, Game, Hours, Percentage),
            Efficiency =:= Percentage/Hours
        ),
        Players
    ).

/*
| ?- mostEffectivePlayers('5 ATG', BP).
BP = ['Best Player Ever'] ? ;
no

| ?- mostEffectivePlayers('Carrier Shift: Game Over', BP).
BP = ['The Player', 'A Player'] ? ;
no
*/
