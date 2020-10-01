aluno(joao, paradigmas).
aluno(maria, paradigmas).
aluno(joel, lab2).
aluno(joel, estruturas).

frequenta(joao, feup).
frequenta(maria, feup).
frequenta(joel, ist).

professor(carlos, paradigmas).
professor(ana_paula, estruturas).
professor(pedro, lab2).

funcionario(pedro, ist).
funcionario(ana_paula, feup).
funcionario(carlos, feup).

% a)
aluno_do_prof(X, Aluno) :-
    professor(X, UC),
    aluno(Aluno, UC).

% b)
pessoa(P, X) :-
    frequenta(P, X) ;
    funcionario(P, X).

% c)
colega(X, Y) :-
    (aluno(X, UC), aluno(Y, UC)) ;
    (frequenta(X, Fac), frequenta(Y, Fac)) ;
    (
        professor(X, UC1), aluno(A1, UC1), frequenta(A1, Fac),
        professor(Y, UC2), aluno(A2, UC2), frequenta(A2, Fac)
    ).
