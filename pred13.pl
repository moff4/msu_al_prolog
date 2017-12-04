%sub_tree
% ii, io

sub_tree(tree(L,R,M),tree(L,R,M)).
sub_tree(T,tree(L,R,_)):-sub_tree(T,L);sub_tree(T,R).