:-
    use_module(library(clpfd)).

solve :-
    Pessoas = [A  , B  , C  , D  , E  , F  ], Pessoas = [1,2,3,4,5,6],
    Artigos = [Livro, Vestido, Bolsa, Gravata, Chapeu, Candeeiro], Artigos = [1,2,3,4,5,6],

    AAndar  = [ALivro, AVestido, ABolsa, AGravata, AChapeu, ACandeeiro], domain(AAndar , 0, 6),
    PArtigo = [ArA, ArB, ArC, ArD, ArE, ArF], domain(PArtigo, 1, 6), all_distinct(PArtigo),

    element(ArC, AAndar, 2),                                                                        % O andar do artigo da Sra. Catt é o 2º
    AGravata #= 2,                                                                                  % A pessoa X que comprou a gravata saiu no 2º andar
    AVestido #= 3, ALivro #\= 3, ABolsa #\= 3, AGravata #\= 3, AChapeu #\= 3, ACandeeiro #\= 3,
    ACandeeiro #= 5,                                                                                % A pessoa Y que comprou o candeeiro saiu no 5º andar
    element(ArF, AAndar, 6),                                                                        % A Sra. Fisk ficou no sexto andar
    ArB #\= Bolsa, ABolsa #= 2, ArB #\= Gravata,
    ALivro #= 0,
    element(ArE, AAndar, 5),                                                                        % A Sra. Ennis saiu no 5º andar

    append(AAndar, PArtigo, Vars),
    labeling([], Vars),

    write(AAndar), nl,
    write(PArtigo), nl,

    % Adams - Livro
    % Baker - Vestido
    % Catt  - Bolsa
    % Dodge - Gravata
    % Ennis - Candeeiro
    % Fisk  - Chapeu

    true.

:-
    solve.
