% iii iio oii
inter(M1,M2,M3):-its(M1,M2,M),per(M,M3),!.

its([],_,[]).
its([A|T],L,[A|M]):-member(A,L),!,delete_first(A,L,R),its(T,R,M).
its([_|T],A,B):-its(T,A,B).

per([],[]).
per([X|T],T2):-per(T,T1),ins(X,T1,T2).

ins(X,L,[X|L]).
ins(X,[Y|L],[Y|L1]):-ins(X,L,L1).

delete_first(E,[E|T],T):-!.
delete_first(E,[X|T],[X|P]):-delete_first(E,T,P).
