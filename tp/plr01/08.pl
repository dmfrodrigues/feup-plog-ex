:-
    use_module(library(clpfd)).

solve_market(Arroz, Batatas, Esparguete, Atum) :-
    Vars = [Arroz, Batatas, Esparguete, Atum],
    domain(Vars, 1, 711),
    Arroz + Batatas + Esparguete + Atum #= 711,
    Arroz * Batatas * Esparguete * Atum #= 711*1000000,
    (mod(Arroz     , 10) #= 0 #/\ (mod(Batatas, 10) #= 0 #\/ mod(Esparguete, 10) #= 0 #\/ mod(Atum, 10) #= 0)) #\/
    (mod(Batatas   , 10) #= 0 #/\ (                          mod(Esparguete, 10) #= 0 #\/ mod(Atum, 10) #= 0)) #\/
    (mod(Esparguete, 10) #= 0 #/\ (                                                       mod(Atum, 10) #= 0)),
    Batatas #> Atum, 
    Atum #> Arroz,
    Arroz #> Esparguete,
    labeling([], Vars).

:-
    solve_market(Arroz, Batatas, Esparguete, Atum),
    write(Arroz), nl, write(Batatas), nl, write(Esparguete), nl, write(Atum), nl.
