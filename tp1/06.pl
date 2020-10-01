bird(tweety).
fish(goldie).
worm(molie).
cat(silvester).

my_cat(silvester).

likes(Bird, Worm) :- bird(Bird), worm(Worm).
likes(Cat , Fish) :- cat(Cat), fish(Fish).
likes(Cat , Bird) :- cat(Cat), bird(Bird).

friend(me, Cat) :- cat(Cat), my_cat(Cat).
friend(X, Z) :- friend(X, Y), friend(Y, Z).
eats(Cat, X) :- cat(Cat), likes(Cat, X).

/*
a) eats(silvester, X).
goldie
tweety
b) It is reasonable.
*/
