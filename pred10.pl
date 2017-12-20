% oi
subset([],[]).
subset([X|L1],[X|L2]):-subset(L1, L2).
subset(L1,[_|L2]):-subset(L1, L2).

% ii 
subset2([],_).
subset2([X|L1],L2):-member(X,L2),subset2(L1,L2).