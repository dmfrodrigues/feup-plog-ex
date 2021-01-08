:-
    use_module(library(clpfd)).

solve_me :-
    Desportos = [PingPong, Futebol, Andebol, Rugby, Tenis, Voleibol], Desportos = [1, 2, 3, 4, 5, 6],
    Amigos    = [Claudio , David , Domingos , Francisco , Marcelo , Paulo ], Amigos = [1, 2, 3, 4, 5, 6],
    DAmigos   = [DClaudio, DDavid, DDomingos, DFrancisco, DMarcelo, DPaulo], domain(DAmigos, 1, 6), all_distinct(DAmigos),
    
    DMarcelo #\= Tenis,

    DFrancisco #\= Voleibol,
    DPaulo     #\= Voleibol,

    DDomingos #\= Rugby,

    DClaudio   #\= Andebol, DClaudio   #\= Rugby,
    DFrancisco #\= Andebol, DFrancisco #\= Rugby,

    DDavid #\= Futebol,

    labeling([], DAmigos), !,

    write(DAmigos),nl,

    true.

:-
    solve_me.
