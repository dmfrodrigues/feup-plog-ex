/*
max(X, Y, Z, X):- X>Y, X>Z, !.
max(X, Y, Z, Y):- Y>X, Y>Z, !.
max(_, _, Z, Z).
*/

/**
 * Item a)
 * 
 * When X=Y and X,Y > Z, Z is returned as the maximum
 */

% Item b)

max(X, Y, Z, X):- X>=Y, X>=Z, !.
max(X, Y, Z, Y):- Y>=X, Y>=Z, !.
max(_, _, Z, Z).
