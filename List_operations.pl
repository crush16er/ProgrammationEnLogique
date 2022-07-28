member(X, [X | _]).
member(X, [_ | L]) :- member(X, L).

append([], L, L).
append([X | L1], L2, [X | L3]) :- append(L1, L2, L3).

select(X, [X | L], L).
select(X, [Y | L1], [Y | L2]) :- select(X, L1, L2).





jednokrotnie(X, L1) :- (member(X,L1), select(X,L1, L2), \+ (member(X,L2))).


headandtail(X, List) :- List = [X|Tail], jednokrotnie(X, Tail).

ddwukrotnie(X, L1) :- headandtail(X, L1); (L1 = [Y|L2], \+(L2 = []), \+ (X = Y), ddwukrotnie(X, L2)).


dwukrotnie(X, L1) :- distinct(member(X, L1)), ddwukrotnie(X,L1).