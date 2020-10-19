/*
 * replace(X, Y, L, R)
 *
 * Replaces all occurences of X by Y in L, and returns R.
 */
replace(_, _, [], []).
replace(X, Y, [X|L], [Y|R]) :- replace(X, Y, L, R), !.
replace(X, Y, [Z|L], [Z|R]) :- replace(X, Y, L, R).
