% oii ioi iii
number(E,0,[E|_]).
number(E,N1,[_|T]):- number(E,N,T), N1 is N+1. 