/**
 * bestParticipant(+P1, +P2, -P)
 * 
 * unifica P com o melhor dos dois participantes P1 e P2.
 * O melhor participante é aquele que tem uma maior soma de tempos na sua atuação
 * (independentemente de estar ou não em condições de passar à próxima fase).
 * Se ambos tiverem o mesmo tempo total, o predicado deve falhar.
 */
bestParticipant(P1, P2, P) :-
    performance(P1, Times1), sum_list(Times1, T1),
    performance(P2, Times2), sum_list(Times2, T2),
    (
        (T1 > T2, P = P1);
        (T1 < T2, P = P2)
    ).

sum_list([], 0).
sum_list([X|L], R) :-
    sum_list(L, R1),
    R is R1+X.
