imaturo(X):- adulto(X), !, fail.
imaturo(X).
adulto(X):- pessoa(X), !, idade(X, N), N>=18.
adulto(X):- tartaruga(X), !, idade(X, N), N>=50.

/**
 * The first cut works similarly to \+/1, because if
 * adulto(X) succeeds then we want no more processing
 * to be done, and imaturo(X) fails. On the other hand,
 * if adulto(X) fails then the next clause is applied,
 * and X is immature. It is a 'red' cut because it is
 * essential to the proper working of this program.
 *
 * The second and third cuts are for efficiency purposes;
 * if X is a person then he/she can't be a turtle, in which
 * case if X is a person but clause 3 fails we know we don't
 * have to check clause 4 because we already know X is a person.
 * This is a 'green' cut because it does not affect the program's
 * functionality, only its performance.
 */
