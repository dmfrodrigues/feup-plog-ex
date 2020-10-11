cargo(tecnico, rogerio).
cargo(tecnico, ivone).
cargo(engenheiro, daniel).
cargo(engenheiro, isabel).
cargo(engenheiro, oscar).  
cargo(engenheiro, tomas).
cargo(engenheiro, ana).
cargo(supervisor, luis).
cargo(supervisor_chefe, sonia).
cargo(secretaria_exec, laura).
cargo(diretor, santiago).

chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, director).
chefiado_por(secretaria_exec, director).

/*
a) What are the pairs (X, Y) such that job Y bosses X which bosses technicians?

X = engenheiro,
Y = supervisor

b) What are the triples (X, Y, Z) such that ivone has job X which bosses technicians, and such that person Z has job Y?

no

c) What people X are supervisors, or supervisors?

X = luis

d) What is the pair (J, P) (Job, Person) such that job J is bossed by a supervisor or chief-supervisor?
Or otherwise, which people are bossed by a supervisor or chief-supervisor?

J = engenheiro,
P = daniel

e) Which job is bossed by the director, other than Carolina's job?

P = supervisor_chefe

*/
