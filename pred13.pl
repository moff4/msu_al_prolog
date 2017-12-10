%sub_tree
% ii, io

%examples
% sub_tree(tree(nil,nil,f),tree(tree(nil,nil,f),tree(tree(nil,nil,p),tree(nil,nil,r),k),g)).
% sub_tree(tree(nil,nil,f),tree(tree(nil,nil,f),nil,f)).
% sub_tree(X,tree(tree(nil,nil,f),nil,f)).
% sub_tree(tree(nil,nil,j),tree(tree(nil,nil,f),tree(tree(nil,nil,p),tree(nil,nil,r),k),g)).

sub_tree(tree(L,R,M),tree(L,R,M)).
sub_tree(T,tree(L,R,_)):-sub_tree(T,L);sub_tree(T,R).