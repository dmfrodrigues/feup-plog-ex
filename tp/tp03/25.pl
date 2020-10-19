pop_left([_|L], L).
pop_right([_], []).
pop_right([X|L], [X|R]) :- pop_right(L, R).

vec_sum([], [], []).
vec_sum([A|L], [B|M], [C|N]) :-
    C is A+B,
    vec_sum(L, M, N).

pascal(1, [1]) :- !.
pascal(N, L) :-
    N1 is N-1,
    pascal(N1, L1),
    pop_left(L1, L2), pop_right(L1, L3), vec_sum(L2, L3, L4),
    append([1], L4, L5), append(L5, [1], L).
