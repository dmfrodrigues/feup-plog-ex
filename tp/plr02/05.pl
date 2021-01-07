:-
    use_module(library(clpfd)).

solve_me(CorCarros, Tamanhos) :-
    Cor       = [Amarelo, Verde, Azul, Preto], Cor = [1, 2, 3, 4],
    CorCarros = [Cor1   , Cor2 , Cor3, Cor4 ], domain(CorCarros, 1, 4), all_distinct(CorCarros),    % Cor do carro na posicao i
    Tamanhos  = [Tam1   , Tam2 , Tam3, Tam4 ], domain(Tamanhos, 1, 4), all_distinct(Tamanhos),      % Tamanho do carro na posicao i

    element(PosAzul, CorCarros, Azul), PosAntesAzul #= PosAzul-1, PosDepoisAzul #= PosAzul+1,
    element(PosAntesAzul, Tamanhos, TamAntesAzul), element(PosDepoisAzul, Tamanhos, TamDepoisAzul),
    TamAntesAzul #< TamDepoisAzul,

    element(PosVerde, CorCarros, Verde), element(PosVerde, Tamanhos, TamVerde), TamVerde #= 1,

    PosVerde #> PosAzul,

    element(PosAmarelo, CorCarros, Amarelo), element(PosPreto, CorCarros, Preto), PosAmarelo #> PosPreto,
    
    append(CorCarros, Tamanhos, Vars),
    labeling([], Vars),

    true.

:-
    solve_me(CorCarros, Tamanhos),
    write(CorCarros), nl,
    write(Tamanhos), nl.

% A ordem na fila, de trás para a frente da fila, é: [Preto, Azul, Amarelo, Verde].
% Logo o primeiro carro é o Verde.
