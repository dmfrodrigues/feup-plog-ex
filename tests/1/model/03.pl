:-
    reconsult('02.pl').

/**
 * patientJuri(+JuriMember)
 *
 * Sucede se o júri JuriMember já se absteve de carregar no botão pelo menos por duas vezes
 */
patientJuri(J) :-
    juriTimes([X, Y], J, [TX, TY], _),
    X =\= Y,
    TX =:= 120,
    TY =:= 120.
