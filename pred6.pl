% ii io
no_doubles([],[]).
no_doubles([X|T],T1):-member(X, T),!,no_doubles(T,T1).
no_doubles([X|T],[X|T1]):-no_doubles(T,T1).
