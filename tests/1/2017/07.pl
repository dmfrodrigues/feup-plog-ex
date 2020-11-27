:-
    reconsult('info.pl').

/**
 * ageRange(+MinAge, +MaxAge, -Players)
 * 
 * Devolve em Players a lista dos nomes dos jogadores
 * com idade compreendida entre MinAge e MaxAge (limites inclusivos).
 */
ageRange(MinAge, MaxAge, Players) :-
    findall(
        Player,
        (
            player(Player, _, Age),
            MinAge =< Age, Age =< MaxAge
        ),
        Players
    ).

/*
| ?- ageRange(12, 16, P).
P = ['Manny', 'Jonny'] ? ;
no

| ?- ageRange(24, 34, P).
P = ['Danny', 'Annie', 'Harry'] ? ;
no
*/
