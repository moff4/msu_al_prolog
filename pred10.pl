% ii
subset(L1,L1).
subset([X|L1],[X|L2]):-subset(L1, L2).
subset(L1,[_|L2]):-subset(L1, L2).