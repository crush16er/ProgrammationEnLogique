mean(L, M) :-
    sum(L, S),
    length(L, N),
    M is S/N.

sum([],0).
sum([H|T],Y):-
    sum(T,X),
    Y is X + H.

variance([], _,0).
variance([H|T], M, VO):-
    variance(T,M,Y),
    VO is( Y + ((H-M)*(H-M))).

statsList(L, M, V1) :-
    sum(L, S),
    length(L, N),
    M is S/N,
    variance(L, M, Vo),
    V1 is Vo/N.