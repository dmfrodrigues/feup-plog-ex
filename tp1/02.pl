pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pilot(bonhomme).

team(lamb, breitling).
team(besenyei, redbull). team(chambliss, redbull).
team(maclean, mediterraneanrt).
team(mangold, cobra).
team(jones, matador). team(bonhomme, matador).

plane(lamb, mx2).
plane(besenyei, edge540).
plane(chambliss, edge540).
plane(maclean, edge540).
plane(mangold, edge540).
plane(jones, edge540).
plane(bonhomme, edge540).

circuit(istanbul).
circuit(budapest).
circuit(porto).

won(jones, porto).
won(mangold, budapest). won(mangold, istanbul).

gates(istanbul, 9).
gates(budapest, 6).
gates(porto, 5).

team_won(Team, Circuit) :- 
    pilot(Pilot),
    team(Pilot, Team),
    won(Pilot, Circuit).

/*
a) won(Pilot, porto).
jones
b) team_won(Team, porto).
matador
c) circuit(Circuit1), circuit(Circuit2), \+(Circuit1 = Circuit2), won(Pilot, Circuit1), won(Pilot, Circuit2).
mangold
d) circuit(Circuit), gates(Circuit, N), N > 8.
istanbul
e) pilot(Pilot), \+(plane(Pilot, edge540)).
lamb
*/
