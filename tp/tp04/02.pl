:- reconsult('utils.pl'),
   reconsult('graph-weighted.pl').

/**
 * solve_bfs_weighted(+U, +V, -Sol)
 * 
 * Find path from U to V, and return it to Sol.
 */
solve_bfs_weighted(U, V, Cost-Sol) :-
    bfs_weighted([0-[U]], V, Cost-Sol1),
    reverse(Sol1, Sol).

/**
 * adjacent_path(+Path, -NewPath)
 * 
 * estende_ate_filho
 * 
 * Adds to Path a node adjacent to the tip of Path which is not in Path.
 */
adjacent_path(C-[U|Path], NewC-[V,U|Path]) :-
    connected(U, V, W),
    \+ member(V, Path),
    NewC is C+W.

bfs_weighted([C-[V|RestOfPath]|_], V, C-[V|RestOfPath]).
bfs_weighted([Path|Queue], S, Sol) :-
    findall(AdjPath, adjacent_path(Path, AdjPath), AdjPaths), % NewPaths are all paths that continue from CurrPath
    append(Queue, AdjPaths, NewQueue),                        % Newly-found paths are added to list of all known paths
    keysort(NewQueue, NewQueueSorted),
    bfs_weighted(NewQueueSorted, S, Sol).
