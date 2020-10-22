connected(a,b,1).
connected(a,c,1).
connected(b,d,1).
connected(b,e,1).
connected(b,f,1).
connected(c,g,1).
connected(d,h,1).
connected(d,i,2).
connected(f,i,3).
connected(f,j,1).
connected(f,k,1).
connected(g,l,1).
connected(g,m,1).
connected(k,n,1).
connected(l,o,1).
connected(i,f,1).

ligado(X, Y, W) :- connected(X, Y, W).
