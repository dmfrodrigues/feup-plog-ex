dados(um).
dados(dois).
dados(tres).

% Item a)

cut_teste_a(X) :- dados(X).
cut_teste_a('ultima_clausula').

/**
 * ?- cut_teste_a(X), write(X), nl, fail.
 * 
 * um
 * dois
 * tres
 * ultima_clausula
 * no
 */

% Item b)

cut_teste_b(X) :- dados(X), !.
cut_teste_b('ultima_clausula').

/**
 * ?- cut_teste_b(X), write(X), nl, fail.
 *
 * um
 * no
 */

% Item c)

cut_teste_c(X,Y) :- dados(X), !, dados(Y).
cut_teste_c('ultima_clausula').

/**
 * ?- cut_teste_c(X,Y), write(X-Y), nl, fail.
 *
 * um-um
 * um-dois
 * um-tres
 * no
 */
