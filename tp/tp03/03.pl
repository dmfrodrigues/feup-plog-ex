anexar([], L, L).
anexar([X|L1], L2, [X|L3]) :- anexar(L1, L2, L3).
