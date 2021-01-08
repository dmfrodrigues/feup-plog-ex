:-
    use_module(library(clpfd)).

solve_me(MNacionalidade, NNacionalidade) :-
    Nacionalidade  = [Alemao , Ingles , Brasileiro , Espanhol , Italiano , Frances ], Nacionalidade = [1,2,3,4,5,6],
    NNacionalidade = [NAlemao, NIngles, NBrasileiro, NEspanhol, NItaliano, NFrances], domain(NNacionalidade, 1, 6), all_distinct(NNacionalidade), % Numero
    Marca          = [LaVieClaire, SistemaV, Fagor], Marca = [1,2,3],
    MNacionalidade = [MAlemao, MIngles, MBrasileiro, MEspanhol, MItaliano, MFrances], domain(MNacionalidade, 1, 3), % Marca

    element(X, NNacionalidade, 1), element(X, MNacionalidade, LaVieClaire),
    MAlemao #= LaVieClaire,
    NAlemao #\= 1,

    element(X, NNacionalidade, 5), element(X, MNacionalidade, SistemaV),
    MBrasileiro #= SistemaV,
    NBrasileiro #\= 5,

    element(X, NNacionalidade, 3), element(X, MNacionalidade, SistemaV),
    MEspanhol #= Fagor,
    NEspanhol #\= 3,

    NEspanhol #\= 2, NEspanhol #\= 6,

    NItaliano #\= 3, NFrances #\= 3,

    NAlemao #\= 2,

    NItaliano #\= 1,

    append(NNacionalidade, MNacionalidade, Vars),
    labeling([], Vars),

    true.

:-
    solve_me(Marcas, Numeros),
    write(Marcas),nl,
    write(Numeros),nl.
