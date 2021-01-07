:-
    use_module(library(clpfd)).

solve_me(Pratos) :-
    Amigos = [B, D, F, H, J, L], Amigos = [1, 2, 3, 4, 5, 6],
    Pratos = [Peixe, Porco, Pato, Omeleta, Bife, Esparguete], domain(Pratos, 1, 6), all_distinct(Pratos),

    D #\= Peixe, J #\= Peixe,
    
    F #\= Porco, F #\= Pato,
    
    B #\= Omeleta, B #\= Pato,
    D #\= Omeleta, D #\= Pato,
    
    (B #= Porco #\/ B #= Pato #\/ B #= Bife),
    (F #= Porco #\/ F #= Pato #\/ F #= Bife),
    (H #= Porco #\/ H #= Pato #\/ H #= Bife),

    labeling([], Pratos),

    true.

:-
    solve_me(Pratos),
    write(Pratos), nl.

% Peixe         - Luis
% Porco         - Bernard
% Pato          - Henrique
% Omeleta       - Jaqueline
% Bife          - Francisco
% Esparguete    - Daniel
