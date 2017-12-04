%sort
% ii, io
sort([],[]).
sort([A],[A]).
sort([H|T], Out):- sort(T,Z), insert(H,Z,Out).

insert(X, [], [X]).
insert(X, [H|T], [X,H|T]):- X =< H.
insert(X, [H|T], [H|Z]):- X > H, insert(X,T,Z).