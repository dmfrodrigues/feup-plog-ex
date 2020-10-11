e_primo(N) :- integer(N), N >= 2, \+e_composto(N).
e_composto(N) :- integer(N), N2 is N-1, e_divisivel_por_menor_ou_igual_a(N, N2).
e_divisivel_por_menor_ou_igual_a(N, M) :- M >= 2, N mod M =:= 0.
e_divisivel_por_menor_ou_igual_a(N, M) :-
    M > 2,
    M2 is M-1,
    e_divisivel_por_menor_ou_igual_a(N, M2)
.
