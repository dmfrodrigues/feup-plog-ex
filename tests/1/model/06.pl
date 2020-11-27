:-
    reconsult('info1.pl').

/**
 * nSuccessfulParticipants(-T)
 * 
 * determina quantos participantes não tiveram qualquer clique no botão durante a sua atuação
 */
nSuccessfulParticipants(T) :-
    findall(P, performance(P, [120,120,120,120]), L),
    length(L, T).
