male(ab).
male(lb).
male(ms).
male(ljb).
female(X) :- nonvar(X), not(male(X)).
parent(lr, ljb).
parent(lb, ljb).
parent(ab, lb).
parent(crs, lb).
parent(es, st).
parent(es, ms).
parent(ab, ms).
parent(crs, ms).
