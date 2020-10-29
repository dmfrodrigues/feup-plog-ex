ligacao(porto, gaia).
ligacao(porto, braga).
ligacao(porto, barcelos).
ligacao(braga,barcelos).
ligacao(gaia, coimbra).
ligacao(lisboa,coimbra).
ligacao(porto, coimbra).

% caminho(+De, +Para, -Caminho)
caminho(De, Para, Caminho) :- caminho4(De, Para, [], Caminho).

% caminho4(De, Para, Visitas, Caminho)
caminho4(De, Para, _, [De,Para]) :- ligacao(De,Para).
caminho4(De, Para, NV, [De|R]) :-
    ligacao(De, De2),
    \+ De2 = para,
    \+ member(De2, NV),
    caminho4(De2,Para,[De|NV],R)
.

todos_caminhos(De, Para, Caminhos) :- setof(C, caminho(De, Para, C), Caminhos).

caminho_mais_curto(D,P,C) :-
    todos_caminhos(D, P, Caminhos),
    shortest_list(Caminhos, C)
.

shortest_list(L,S) :- shortest_list(L,999999999,S,S1), ground(S1).
shortest_list([],_Min,S,S).
shortest_list([X|R],Min,St,Sl) :-
    length(X, L), L < Min, !,
    shortest_list(R, L, X, Sl)
.
shortest_list([_X|R], Min, St, Sl) :- shortest_list(R, Min, St, Sl).
