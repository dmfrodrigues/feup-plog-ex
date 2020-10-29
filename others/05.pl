% b(Balde@{b1, b2}, Capacidade, Quantidade)
% e(b1, b2)

esvazia(b(N, C, Q), b(N, C, 0), N) :-
    Q > 0.

enche(b(N, C, Q), b(N, C, C), N) :- Q < C.

despeja(b(N1, C1, Q1), b(N2, C2, Q2), b(N1, C1, Q3), b(N2, C2, C2), N1, V) :-
    Q1 > 0, Q2 < C2,
    V is C2-Q2,
    Q3 is Q1-V,
    Q3 > 0.
despeja(b(N1, C1, Q1), b(N2, C2, Q2), b(N1, C1, 0), b(N2, C2, Q3), N1, Q1) :-
    Q1 > 0,
    Q3 is Q2+Q1,
    Q3 =< C2.

% faz_op(+Op, +Ei, -Ef, -Desc)
faz_op(esvazia, b(Bi1, Bi2), b(Bf1, Bf2), esvazia(B)) :-
    (
        (esvazia(Bi1, Bf1, B), Bf2=Bi2);
        (esvazia(Bi2, Bf2, B), Bf1=Bi1)
    ).

faz_op(enche, b(Bi1, Bi2), b(Bf1, Bf2), esvazia(B)) :-
    (
        (enche(Bi1, Bf1, B), Bf2=Bi2);
        (enche(Bi2, Bf2, B), Bf1=Bi1)  
    ).

faz_op(despeja, b(Bi1, Bi2), b(Bf1, Bf2), despeja(B, Q)) :-
    (
        despeja(Bi1, Bi2, Bf1, Bf2, B, Q);
        despeja(Bi2, Bi1, Bf2, Bf1, B, Q)
    ).

procura_solucao(E, E, []).

% procura_solucao(EstadoInicial, EstadoFinal, Prof, Estados, Ops)
procura_solucao(_, _, 0, _, _, Ops) :- !, fail.
procura_solucao()

procura_solucao(EstadoInicial, EstadoFinal, [Op|Ops]) :-
    procura_solucao(EstadoInicial, EstadoFinal1, Ops),
    faz_op(_, EstadoFinal1, EstadoFinal, Op).
