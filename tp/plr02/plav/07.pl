:-
    use_module(library(clpfd)),
    use_module(library(lists)).

flatten([], []).
flatten([X|L], R) :- !,
    flatten(L, L1),
    append(X, L1, R).

solve_me(Mat) :-
    Mat = [
        [A1, B1, C1, D1, E1, F1, G1, H1],
        [A2, B2, C2, D2, E2, F2, G2, H2],
        [A3, B3, C3, D3, E3, F3, G3, H3],
        [A4, B4, C4, D4, E4, F4, G4, H4],
        [A5, B5, C5, D5, E5, F5, G5, H5],
        [A6, B6, C6, D6, E6, F6, G6, H6],
        [A7, B7, C7, D7, E7, F7, G7, H7],
        [A8, B8, C8, D8, E8, F8, G8, H8]
    ],

    bool_or([A1, B1, C1, D1, E1, F1, G1, H1], R1),
    bool_or([A2, B2, C2, D2, E2, F2, G2, H2], R2),
    bool_or([A3, B3, C3, D3, E3, F3, G3, H3], R3),
    bool_or([A4, B4, C4, D4, E4, F4, G4, H4], R4),
    bool_or([A5, B5, C5, D5, E5, F5, G5, H5], R5),
    bool_or([A6, B6, C6, D6, E6, F6, G6, H6], R6),
    bool_or([A7, B7, C7, D7, E7, F7, G7, H7], R7),
    bool_or([A8, B8, C8, D8, E8, F8, G8, H8], R8),

    bool_or([A1, A2, A3, A4, A5, A6, A7, A8], CA),
    bool_or([B1, B2, B3, B4, B5, B6, B7, B8], CB),
    bool_or([C1, C2, C3, C4, C5, C6, C7, C8], CC),
    bool_or([D1, D2, D3, D4, D5, D6, D7, D8], CD),
    bool_or([E1, E2, E3, E4, E5, E6, E7, E8], CE),
    bool_or([F1, F2, F3, F4, F5, F6, F7, F8], CF),
    bool_or([G1, G2, G3, G4, G5, G6, G7, G8], CG),
    bool_or([H1, H2, H3, H4, H5, H6, H7, H8], CH),

    bool_or([                            H1], D01),
    bool_or([                        G1, H2], D02),
    bool_or([                    F1, G2, H3], D03),
    bool_or([                E1, F2, G3, H4], D04),
    bool_or([            D1, E2, F3, G4, H5], D05),
    bool_or([        C1, D2, E3, F4, G5, H6], D06),
    bool_or([    B1, C2, D3, E4, F5, G6, H7], D07),
    bool_or([A1, B2, C3, D4, E5, F6, G7, H8], D08),
    bool_or([A2, B3, C4, D5, E6, F7, G8    ], D09),
    bool_or([A3, B4, C5, D6, E7, F8        ], D10),
    bool_or([A4, B5, C6, D7, E8            ], D11),
    bool_or([A5, B6, C7, D8                ], D12),
    bool_or([A6, B7, C8                    ], D13),
    bool_or([A7, B8                        ], D14),
    bool_or([A8                            ], D15),

    bool_or([A1                            ], A01),
    bool_or([A2, B1                        ], A02),
    bool_or([A3, B2, C1                    ], A03),
    bool_or([A4, B3, C2, D1                ], A04),
    bool_or([A5, B4, C3, D2, E1            ], A05),
    bool_or([A6, B5, C4, D3, E2, F1        ], A06),
    bool_or([A7, B6, C5, D4, E3, F2, G1    ], A07),
    bool_or([A8, B7, C6, D5, E4, F3, G2, H1], A08),
    bool_or([    B8, C7, D6, E5, F4, G3, H2], A09),
    bool_or([        C8, D7, E6, F5, G4, H3], A10),
    bool_or([            D8, E7, F6, G5, H4], A11),
    bool_or([                E8, F7, G6, H5], A12),
    bool_or([                    F8, G7, H6], A13),
    bool_or([                        G8, H7], A14),
    bool_or([                            H8], A15),

    bool_or([R1,CA,D08,A01],1), bool_or([R1,CB,D07,A02],1), bool_or([R1,CC,D06,A03],1), bool_or([R1,CD,D05,A04],1), bool_or([R1,CE,D04,A05],1), bool_or([R1,CF,D03,A06],1), bool_or([R1,CG,D02,A07],1), bool_or([R1,CH,D01,A08],1),
    bool_or([R2,CA,D09,A02],1), bool_or([R2,CB,D08,A03],1), bool_or([R2,CC,D07,A04],1), bool_or([R2,CD,D06,A05],1), bool_or([R2,CE,D05,A06],1), bool_or([R2,CF,D04,A07],1), bool_or([R2,CG,D03,A08],1), bool_or([R2,CH,D02,A09],1),
    bool_or([R3,CA,D10,A03],1), bool_or([R3,CB,D09,A04],1), bool_or([R3,CC,D08,A05],1), bool_or([R3,CD,D07,A06],1), bool_or([R3,CE,D06,A07],1), bool_or([R3,CF,D05,A08],1), bool_or([R3,CG,D04,A09],1), bool_or([R3,CH,D03,A10],1),
    bool_or([R4,CA,D11,A04],1), bool_or([R4,CB,D10,A05],1), bool_or([R4,CC,D09,A06],1), bool_or([R4,CD,D08,A07],1), bool_or([R4,CE,D07,A08],1), bool_or([R4,CF,D06,A09],1), bool_or([R4,CG,D05,A10],1), bool_or([R4,CH,D04,A11],1),
    bool_or([R5,CA,D12,A05],1), bool_or([R5,CB,D11,A06],1), bool_or([R5,CC,D10,A07],1), bool_or([R5,CD,D09,A08],1), bool_or([R5,CE,D08,A09],1), bool_or([R5,CF,D07,A10],1), bool_or([R5,CG,D06,A11],1), bool_or([R5,CH,D05,A12],1),
    bool_or([R6,CA,D13,A06],1), bool_or([R6,CB,D12,A07],1), bool_or([R6,CC,D11,A08],1), bool_or([R6,CD,D10,A09],1), bool_or([R6,CE,D09,A10],1), bool_or([R6,CF,D08,A11],1), bool_or([R6,CG,D07,A12],1), bool_or([R6,CH,D06,A13],1),
    bool_or([R7,CA,D14,A07],1), bool_or([R7,CB,D13,A08],1), bool_or([R7,CC,D12,A09],1), bool_or([R7,CD,D11,A10],1), bool_or([R7,CE,D10,A11],1), bool_or([R7,CF,D09,A12],1), bool_or([R7,CG,D08,A13],1), bool_or([R7,CH,D07,A14],1),
    bool_or([R8,CA,D15,A08],1), bool_or([R8,CB,D14,A09],1), bool_or([R8,CC,D13,A10],1), bool_or([R8,CD,D12,A11],1), bool_or([R8,CE,D11,A12],1), bool_or([R8,CF,D10,A13],1), bool_or([R8,CG,D09,A14],1), bool_or([R8,CH,D08,A15],1),

    flatten(Mat, Matflat), domain(Matflat, 0, 1),
    sum(Matflat, #=, Value),

    labeling([minimize(Value)], Matflat).

write_matrix([]).
write_matrix([L|M]) :-
    write(L), nl,
    write_matrix(M).

:-
    solve_me(M),
    write_matrix(M), nl.
