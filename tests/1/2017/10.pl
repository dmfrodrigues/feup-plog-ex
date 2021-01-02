:-
    reconsult('info.pl').

/**
 * whatDoesItDo(?X)
 * 
 * Este predicado determina se o jogador Username não joga nenhum jogo
 * desadequado à sua idade (ou seja, que o jogador seja mais jovem do que
 * a idade mínima aconselhada para os jogos que joga).
 * 
 * X - Username
 * Y - Name (ignorar)
 * Z - Age
 * G - Game
 * L - Hours (ignorar)
 * M - Percentage (ignorar)
 * N - Categories (ignorar)
 * W - MinAge
 * 
 * Este cut tem a função de melhorar o desempenho, dado que a sua remoção
 * não tem efeito no resultado do predicado; se o predicado composto dentro
 * de +/1 for bem-sucedido, o predicado +/1 falha mas não há por onde efetuar
 * backtracking, dado que o username é unico. Este cut permite assim melhorar o
 * desempenho, ao informar o interpretador de que, se o predicado +/1 falhar,
 * não precisa de fazer backtracking porque não iria ser possível avaliar
 * outras soluções.
 */
whatDoesItDo(Username) :-
    player(_, Username, Age), !,
    \+(
        played(Username, Game, _, _),
        game(Game, _, MinAge),
        MinAge > Age
    ).
