:- op(500,xfx,na).
:- op(500,xfy,ad).
:- op(500,yfx,ae).

/**
 * a) ae(na(a,b),c)
 * b) Error
 * c) ad(a,na(b,c))
 * d) Error
 * e) ad(a,ad(b,c))
 * f) ae(ae(a,b),c)
 * g) ad(a,ad(b,ae(ae(na(c,d),e),f)))
 */
