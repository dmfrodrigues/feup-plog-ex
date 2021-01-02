isosceles(triangulo((X1,Y1),(X2,Y2),(X3,Y3))) :-
    A is (X1-X2)**2 + (Y1-Y2)**2,
    B is (X1-X3)**2 + (Y1-Y3)**2,
    C is (X2-X3)**2 + (Y2-Y3)**2,
    (A =:= B ; A =:= C ; B =:= C).
