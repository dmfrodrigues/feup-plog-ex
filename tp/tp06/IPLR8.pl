:- use_module(library(clpfd)).
:- use_module(library(lists)).

compras(Vars) :-
    Vars = [Arroz, Batatas, Esparguete, Atum],
    domain(Vars, 1, 710),                     % Domain
    Arroz*Batatas*Esparguete*Atum #= 711000000,
    Arroz+Batatas+Esparguete+Atum #= 711,
    Batatas #> Atum,
    Atum #> Arroz,
    Arroz #> Esparguete,
    element(I1, Vars, El1),            El1 rem 10 #= 0,
    element(I2, Vars, El2), I1 #\= I2, El2 rem 10 #= 0,
    labeling([], Vars).                     % Search for solutions