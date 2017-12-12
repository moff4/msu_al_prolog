% iii iio ioi oii ooi
delete_first(_,[],[]).
delete_first(X,[X|L1],L1):-!.
delete_first(X,[Y|L1],[Y|L2]):-delete_first(X,L1,L2),!.
