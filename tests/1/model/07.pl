:-
    reconsult('info1.pl').

/**
 * juriFans(juriFansList)
 * 
 * obtém uma lista contendo, para cada participante,
 * a lista dos elementos do júri que não carregaram no botão ao longo da sua atuação
 */
juriFans(JuriFansList) :-
    findall(P-J, (performance(P, T), timesToFans(1, T, J)), JuriFansList).

timesToFans(_, [], []) :- !.
timesToFans(Idx, [120|Times], [Idx|Fans]) :- !,
    Idx1 is Idx+1,
    timesToFans(Idx1, Times, Fans).
timesToFans(Idx, [_|Times], Fans) :-
    Idx1 is Idx+1,
    timesToFans(Idx1, Times, Fans).
