:-
    reconsult('info1.pl').

/**
 * juriTimes(+Participants, +JuriMember, -Times, -Total)
 * 
 * devolve em Times o tempo de atuação de cada participante na lista Participants (pela mesma ordem)
 * até que o júri número JuriMember (de 1 a E) carregou no botão,
 * e em Total a soma desses tempos
 */
juriTimes([X], J, [T], T) :-
    performance(X, Times),
    nth1(J, Times, T).

juriTimes([X|Participants], J, [T|Times], Total) :-
    juriTimes(Participants, J, Times, Total1),
    juriTimes([X], J, [T], T),
    Total is Total1 + T.

nth1(1, [X|_], X) :- !.
nth1(N, [_|L], X) :- N1 is N-1, nth1(N1, L, X).
