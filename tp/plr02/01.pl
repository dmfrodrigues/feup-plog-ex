:-
    use_module(library(clpfd)).

solve :-
    Cidades    = [Detroit , Chicago  , Nenhum     ], Cidades   = [1, 2, 3],
    Pessoas    = [Ferreira , Rocha , Silva , SrFerreira , SrRocha , SrSilva ], Pessoas = [1, 2, 3, 4, 5, 6],
    
    PTrabalhos = [Revisor , Foguista , Maquinista ], domain(PTrabalhos, 1, 3), all_distinct(PTrabalhos),
    PCidades   = [CFerreira, CRocha, CSilva, CSrFerreira, CSrRocha, CSrSilva], domain(PCidades, 1, 3),
    % PSalarios  = [SFerreira, SRocha, SSilva, SSrFerreira, SSrRocha, SSrSilva],
    % PTrabalhos = [TTFerreira, TTRocha, TTSilva],

    append(PTrabalhos, PCidades, Vars),

    CSrRocha #= Detroit,
    element(Revisor, PCidades, Nenhum),
    % SSrFerreira #= 10000,
    Silva #\= Foguista,
    domain([VizinhoDoRevisor], 4, 6), element(Revisor, PCidades, CidadeDoRevisor), element(VizinhoDoRevisor, PCidades, CidadeDoRevisor),
    ((X #= SrFerreira #/\ Revisor #= Ferreira) #\/ (X #= SrRocha #/\ Revisor #= Rocha) #\/ (X #= SrSilva #/\ Revisor #= Silva)), element(X, PCidades, Chicago),


    labeling([], Vars),
    write(PTrabalhos), nl,
    write(Maquinista), nl. 

:-
    solve.

% O maquinista corresponde ao Silva
