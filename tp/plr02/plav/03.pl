:-
    use_module(library(clpfd)).

solve_me(Initials, Vars) :-
    length(Initials, 16),
    Initials = [
        Ai, Bi, Ci, Di,
        Ei, Fi, Gi, Hi,
        Ii, Ji, Ki, Li,
        Mi, Ni, Oi, Pi
    ],

    Vars = [
        A, B, C, D,
        E, F, G, H,
        I, J, K, L,
        M, N, O, P
    ],
    domain(Vars, 0, 1),

    sum([A, B, C, D], #=, R1),
    sum([E, F, G, H], #=, R2),
    sum([I, J, K, L], #=, R3),
    sum([M, N, O, P], #=, R4),
    sum([A, E, I, M], #=, C1),
    sum([B, F, J, N], #=, C2),
    sum([C, G, K, O], #=, C3),
    sum([D, H, L, P], #=, C4),
    
    mod(C1+R1-A+Ai,2) #= 1, mod(C2+R1-B+Bi,2) #= 1, mod(C3+R1-C+Ci,2) #= 1, mod(C4+R1-D+Di,2) #= 1,
    mod(C1+R2-E+Ei,2) #= 1, mod(C2+R2-F+Fi,2) #= 1, mod(C3+R2-G+Gi,2) #= 1, mod(C4+R2-H+Hi,2) #= 1,
    mod(C1+R3-I+Ii,2) #= 1, mod(C2+R3-J+Ji,2) #= 1, mod(C3+R3-K+Ki,2) #= 1, mod(C4+R3-L+Li,2) #= 1,
    mod(C1+R4-M+Mi,2) #= 1, mod(C2+R4-N+Ni,2) #= 1, mod(C3+R4-O+Oi,2) #= 1, mod(C4+R4-P+Pi,2) #= 1,

    sum(Vars, #=, Value),

    labeling([minimize(Value), best], Vars), !,

    write(Value),nl,

    true.

write_puzzle([
    A, B, C, D,
    E, F, G, H,
    I, J, K, L,
    M, N, O, P
]):-
    format("~d ~d ~d ~d~n", [A, B, C, D]),
    format("~d ~d ~d ~d~n", [E, F, G, H]),
    format("~d ~d ~d ~d~n", [I, J, K, L]),
    format("~d ~d ~d ~d~n", [M, N, O, P]).

:-
    Initials = [
        1,0,0,0,
        0,0,0,0,
        0,0,1,0,
        0,0,0,0
    ],
    Puzzle = [
        _, _, _, _,
        _, _, _, _,
        _, _, _, _,
        _, _, _, _
    ],
    solve_me(Initials, Puzzle),
    write_puzzle(Puzzle), nl.
