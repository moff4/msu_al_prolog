% oii ioi ooi
number(E,0,[E|_]).
number(_,-1,[]).
number(E,N1,[_|T]):- number(E,N,T), N > -1, N1 is N+1. 
number(E,N1,[_|T]):- number(E,N,T), N = -1, N1 is N.