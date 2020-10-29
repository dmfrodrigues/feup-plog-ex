/**
 * min_elements(+L, -R)
 * 
 * Given a list L of pairs Idx-Val, find the list R of
 * the indexed with lowest value.
 */
min_elements(L, R) :- min_elements(L, _, R).

/**
 * min_elements(+L, -Min, -R)
 * 
 * Given a list L of pairs Idx-Val, find the list R of
 * the indexed with lowest value, given Min is the
 * lowest value so far.
 */
min_elements([         ], 4000000000, [     ]).
min_elements([Idx-Val|L], Val, [Idx  ]) :- min_elements(L, Min, _), Val <   Min, !. % If H<Min
min_elements([Idx-Val|L], Min, [Idx|R]) :- min_elements(L, Min, R), Val =:= Min, !. % If H=Min
min_elements([  _-Val|L], Min,      R ) :- min_elements(L, Min, R), Val >   Min, !. % If H>Min
