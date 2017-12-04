delete_all(_,[],[]).
delete_all(E,[E|L1],L2):-delete_all(E,L1,L2),!.
delete_all(E,[F|L1],[F|L2]):-delete_all(E,L1,L2).
