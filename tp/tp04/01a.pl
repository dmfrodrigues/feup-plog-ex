:- reconsult('utils.pl'),
   reconsult('graph.pl').

/**
 * solve_dfs(+U, +V, -Sol)
 * 
 * Find path from U to V, and return it to Sol.
 */
solve_dfs(U, V, Sol) :-
    solve_dfs([], U, V, Sol1),
    reverse(Sol1, Sol).

/**
 * solve_dfs(+Path, +U, +D, -Sol)
 * 
 * Finds path from U to D, after having passed through Path,
 * and returns solution to Sol.
 */
solve_dfs(Path, D, D, [D|Path]).        % When U=D, we arrived at the destination
solve_dfs(Path, U, D, Sol) :-
    connected(U, V),
    \+ member(V, Path),
    solve_dfs([U|Path], V, D, Sol).
