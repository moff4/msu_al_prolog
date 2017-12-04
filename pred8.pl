number(E,0,[E|_]):-!.
number(E,N,[_|L]):-number(E,N1,L),N is N1+1.