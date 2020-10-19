inverter(List, Reversed)       :- rev(List, [], Reversed).
rev([H|List], Stack, Reversed) :- rev(List, [H|Stack], Reversed).
rev([], Reversed, Reversed).
