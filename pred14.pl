% ii io
flatten_tree(nil,[]). 
flatten_tree(tree(T1,T2,E),L):- flatten_tree(T1,L1),flatten_tree(T2,L2),append([E|L1],L2,L).