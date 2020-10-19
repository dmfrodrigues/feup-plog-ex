/**
 * misterio(L, R)
 * 
 * a) Replaces elements in even indices with 'censurado'.
 *
 * b) Two base cases are required because L can have even or odd length;
 * if it is even, elements are consumed in pairs (X, Y) until [] is left;
 * if it is odd, elements are consumed in pairs (X, Y) until [X] is left,
 * and it is not possible to consume a pair of values (X, Y) because there is only [X]
 */
misterio([],[]).
misterio([X],[X]).
misterio([X,Y|L],[X,censurado|M]):- misterio(L,M).
