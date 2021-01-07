:-
    use_module(library(clpfd)).

solve_me(Lugares) :-
    Lugares    = [LCarlos, LRicardo, LRaul, LTomas, LRoberto, LBoris, LDiego, LLuis], domain(Lugares, 1, 8), all_distinct(Lugares),
    Casados    = [CCarlos, CRicardo, CRaul, CTomas, CRoberto, CBoris, CDiego, CLuis], domain(Casados, 0, 1),

    element(X, Lugares, 7), element(X, Casados, 1), LBoris #\= 7,
    LTomas #=< 4,
    LRaul #\= 4, LTomas #\= 4,
    element(Y, Lugares, 3), element(Y, Casados, 1),
    element(A, Lugares, 1), element(A, Casados, 1), element(B, Lugares, 4), element(B, Casados, 1),
    LDiego #\= 7, LDiego #\= 8, LBoris #\= 7, LBoris #\= 8,
    element(C, Lugares, 5), element(C, Casados, 1), LRoberto #\= 5,
    LRaul #\= 5,
    domain([LCarlos, LLuis], 1, 2),
    CLuis #= 0, CRicardo #= 0, CBoris #= 0, CCarlos #= 1, CRaul #= 1, CTomas #= 1, CRoberto #= 1, CDiego #= 1,

    append(Lugares, Casados, Vars),
    labeling([], Vars),

    true.

:-
    solve_me(Lugar),
    write(Lugar), nl.

% 1º - Carlos
% 2º - Luis
% 3º - Tomas
% 4º - Roberto
% 5º - Diego
% 6º - Boris
% 7º - Raul
% 8º - Ricardo
