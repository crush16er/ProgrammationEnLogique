/*---------------------------1---------------------------*/
/*(a^n)(b^n)*/

anbn --> [].
anbn --> [a], anbn, [b].

checker1(S1) :- phrase(anbn, S1).




/*---------------------------2---------------------------*/
/*(a^n)(b^n)(c^n)*/

s --> a(N), b(N), c(N).

a(N) --> [a], a(N1), {N is N1+1}.
a(0) --> [].
b(N) --> [b], b(N1), {N is N1+1}.
b(0) --> [].
c(N) --> [c], c(N1), {N is N1+1}.
c(0) --> [].


checker2(S2) :- phrase(s, S2).






/*---------------------------3---------------------------*/
/*(a^n)(b^(fib(n)))*/

ss(N, M) --> a(N), b(M).

fib(0, 0) :- !.
fib(1, 1) :- !.
fib(N, Result) :- N1 is N - 1, N2 is N - 2, fib(N1, Result1), fib(N2, Result2), Result is Result1 + Result2.


checker3(S3) :- phrase(ss(N, M), S3), fib(N, M).



/**/

/*  Jak jest zależność między listami L1, L2 i L3, jeśli spełniają one warunek phrase(p(L1), L2, L3)?  */
/*  [L2] = [L1|L3] - L2 jest doklejeniem L3 na koniec L1 */

ppp([]) --> [].
ppp([X|Xs]) --> [X], ppp(Xs).