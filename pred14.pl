% ii io
flatten_tree(T,L):-flat(T,L,[]).
flat(tree(L,R,M),LIST,RES):- flat(R,L1,RES),flat(L,LIST,[M|L1]).