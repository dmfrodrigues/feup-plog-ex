slice(_, 0, 0, []) :-
    !.
slice([X|List], 0, R, [X|Ret]) :-
    !,
    R1 is R-1,
    slice(List, 0, R1, Ret).
slice([_|List], L, R, Ret) :-
    L1 is L-1,
    R1 is R-1,
    slice(List, L1, R1, Ret).

ligacao(1, 2).
ligacao(1, 3).
ligacao(2, 4).
ligacao(3, 4).
ligacao(3, 6).
ligacao(4, 6).
ligacao(5, 6).

adj(U, V) :- ligacao(U, V).
adj(U, V) :- ligacao(V, U).

/**
 * caminho(+Inicio, +Fim, -Lista)
 */
caminho(Inicio, Fim, Lista) :- caminho(Inicio, Fim, [], Lista).

/**
 * caminho(+Inicio, +Fim, +Visitados, -Lista)
 */
caminho(D, D, _, [D]).
caminho(U, D, Visitados, [U|Lista]) :-
    \+(member(U, Visitados)),
    adj(U, V),
    caminho(V, D, [U|Visitados], Lista).

ciclos(No, Comp, Lista) :-
    findall(
        Ciclo,
        (
            caminho(No, No, Ciclo1),
            length(Ciclo1, L1),
            L is L1-1,
            L < Comp,
            L >= 3,
            slice(Ciclo1, 0, L, Ciclo)
        ),
        Lista
    ).
