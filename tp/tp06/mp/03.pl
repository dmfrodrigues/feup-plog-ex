/**
 * mais_proximos(+Idade, -ListaProximos)
 * 
 * Given a list L and the name of a predicate P or arity 1,
 * returns in R all alements but first are all elements that
 * make P true.
 */
mais_proximos(Idade, [X1|ListaProximos]) :-
    setof(I-X, diferenca_idades(Idade, X, I), [I1-X1|L]), % L - List of pairs (person, age difference)
    primeiros(L, I1, ListaProximos).

diferenca_idades(Idade, X, I) :-
    idade(X, Idade1),
    I is abs(Idade-Idade1).

primeiros([         ], _, [     ]).
primeiros([Val-  _|_], I, [     ]) :- Val > I,!.
primeiros([  _-Idx|L], I, [Idx|R]) :- primeiros(L, I, R).

idade(maria,30).
idade(pedro,25).
idade(jose,25).
idade(rita,18).
