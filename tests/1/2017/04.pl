:-
    reconsult('info.pl').

/**
 * listGamesOfCategory(+Cat)
 * 
 * Imprime na consola os titulos de todos os jogos que se enquadram na categoria Cat,
 * indicando ainda a idade minima recomendada para cada jogo.
 * Note que o predicado sucede sempre.
 */
listGamesOfCategory(Cat) :-
    listGamesOfCategory(Cat, []).

/**
 * listGamesOfCategory(Cat, Visited)
 * 
 * O mesmo que listGamesOfCategory/1, mas só imprime
 * os jogos que ainda não estiverem em Visited.
 */
listGamesOfCategory(Cat, Visited) :-
    \+(newGame(Cat, Visited, _)), !.
listGamesOfCategory(Cat, Visited) :-
    newGame(Cat, Visited, Game),
    printGame(Game),
    listGamesOfCategory(Cat, [Game|Visited]).

newGame(Cat, Visited, Game) :-
    game(Game, Categories, _),
    member(Cat, Categories),
    \+(member(Game, Visited)).

printGame(Game) :-
    game(Game, _, MinAge),
    write(Game),format(" (~d)~n",[MinAge]).

/*
| ?- listGamesOfCategory(multiplayer).
5 ATG (18)
Carrier Shift: Game Over (16)
yes
| ?- listGamesOfCategory(simulation).
yes
*/
