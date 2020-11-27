:- use_module(library(lists)).

:-
    reconsult('01.pl').

eligibleOutcome(Id,Perf,TT) :-
    performance(Id,Times),
    madeItThrough(Id),
    participant(Id,_,Perf),
    sumlist(Times,TT).

/**
 * nextPhase(+N, -Participants)
 * 
 * obtém a lista com os tempos totais, números e atuações dos N melhores participantes,
 * que passarão portanto à próxima fase.
 * Se não houver pelo menos N participantes a passar, o predicado deve falhar.
 */
nextPhase(N, ParticipantsSlice) :-
    setof(TT-Id-Perf, eligibleOutcome(Id, Perf, TT), Participants),
    keysort(Participants, ParticipantsSorted),
    reverse(ParticipantsSorted, ParticipantsSortedReverse),
    slice(ParticipantsSortedReverse, 0, N, ParticipantsSlice).

slice(_, 0, 0, []) :- !.
slice([X|L], 0, Right, [X|R]) :- !, Right1 is Right-1, slice(L, 0, Right1, R).
slice([_|L], Left, Right, R) :-
    Left1 is Left-1,
    Right1 is Right-1,
    slice(L, Left1, Right1, R).
