:-
    reconsult('info1.pl').

/**
 * madeItThrough(+Participant)
 * 
 * sucede se Participant é um participante que já atuou
 * e em cuja atuação pelo menos um elemento do júri não carregou no botão
 */

madeItThrough(Participant) :-
    performance(Participant, Buttons),
    member(120, Buttons).
