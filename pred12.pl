% ii io
tree_depth(nil,0).
tree_depth(tree(T1,T2,_),D):-tree_depth(T1,DT1),tree_depth(T2,DT2),D is max(DT1, DT2) + 1.