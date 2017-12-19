% ii io

flatten_tree(T,L):-flat(T,L,[]).
flat(nil,Res,Res).
flat(tree(L,R,M),List,Res):-flat(R,L1,Res),flat(L,List,[M|L1]).
