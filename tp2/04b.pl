fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, F) :-
    N > 1,
    N2 is N-2,
    N1 is N-1,
    fibonacci(N2, F2),
    fibonacci(N1, F1),
    F is F2+F1
. 
