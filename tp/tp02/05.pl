primo(N) :-
    nao_e_divisivel_por_menor_do_que(N, N).

nao_e_divisivel_por_menor_do_que(_, 2).
nao_e_divisivel_por_menor_do_que(N, M) :-
    M1 is M-1,
    N mod M1 =\= 0,
    nao_e_divisivel_por_menor_do_que(N, M1).

lista_primos(1, []).
lista_primos(N, [N|L]) :-
    primo(N),
    N1 is N-1,
    lista_primos(N1, L),
    !.
lista_primos(N, L) :-
    N1 is N-1,
    lista_primos(N1, L).
