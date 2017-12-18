% ii oi
list_length(Xs,L) :- list_length(Xs,0,L) .
list_length( []     , L , L ) .
list_length( [_|Xs] , T , L ) :-T1 is T+1,list_length(Xs,T1,L).


sublist( X, Y ) :- sublist( X, Y, N),list_length(Y,N).
sublist( [X|XS], [X|XSS],N) :- sublist( XS, XSS,N).
sublist( X, [_|XSS],N) :- sublist( X, XSS ,N1),N1 is N-1,N>0,!.
sublist( [], _ , _):-!.