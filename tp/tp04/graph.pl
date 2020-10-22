connected(a,b).
connected(f,i).
connected(a,c).
connected(f,j).
connected(b,d).
connected(f,k).
connected(b,e).
connected(g,l).
connected(b,f).
connected(g,m).
connected(c,g).
connected(k,n).
connected(d,h).
connected(l,o).
connected(d,i).
connected(i,f).

ligado(X, Y) :- connected(X, Y).
