:- reconsult('utils.pl'),
   reconsult('graph.pl').

/**
 * solve_bfs(+U, +V, -Sol)
 * 
 * Find path from U to V, and return it to Sol.
 */
solve_bfs(U, V, Sol) :-
    bfs([[U]], V, Sol1),
    reverse(Sol1, Sol).

/**
 * adjacent_path(+Path, -NewPath)
 * 
 * estende_ate_filho
 * 
 * Adds to Path a node adjacent to the tip of Path which is not in Path.
 */
adjacent_path([U|Path], [V,U|Path]) :-
    connected(U, V),
    \+ member(V, Path).

bfs([[V|RestOfPath]|_], V, [V|RestOfPath]).
bfs([Path|Queue], S, Sol) :-
    findall(AdjPath, adjacent_path(Path, AdjPath), AdjPaths), % NewPaths are all paths that continue from CurrPath
    append(Queue, AdjPaths, NewQueue),                        % Newly-found paths are added to list of all known paths
    bfs(NewQueue, S, Sol).
