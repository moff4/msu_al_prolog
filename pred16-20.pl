edge(a,b,4).
edge(a,d,4).
edge(a,e,1).
edge(b,e,3).
edge(d,e,3).
edge(c,e,2).
edge(b,c,1).
edge(d,c,1).
edge(b,f,15).
edge(d,f,7).


newedge(X,Y,N) :- edge(X,Y,N).
newedge(X,Y,N) :- edge(Y,X,N).


edge1(X,Y) :- edge(X,Y,_); edge(Y,X,_).


% 16 --------------------------------------------------------------------------
% path. 
% iii, iio, ioi, oii, ooi, oio, ioo, ooo. 
path(A,B,P1) :- path1(A,B,[A],P), reverse(P,P1).

path1(A,B,P,[B|P]) :- newedge(A,B,_), not(member(B,P)).
path1(A,B,P,P2) :- newedge(A,N,_), not(member(N,P)), P1 = [N|P], path1(N,B,P1,P2).

 
% Cost(P,C) - C = цена пути P. 
% ii, io.
cost([A,B|T],C) :- !, newedge(A,B,C1), cost([B|T],C2), C is C1 + C2.
cost(_,0).


% 17 --------------------------------------------------------------------------
% min_path. 
% iii, iio.
min_path(X,Y,L) :- findall(L1, path(X,Y,L1), L2), min_cost(L2,MC), min_path1(L2,MC,L).

min_cost([P],C) :- cost(P,C).
min_cost([P|T],C) :- cost(P,C1), min_cost(T,C2), C is min(C1,C2).

min_path1([P|_],MC,P) :- cost(P,MC).
min_path1([_|T],MC,R) :- min_path1(T,MC,R).


% 18 --------------------------------------------------------------------------
% short_path. 
% iio.
short_path(X,Y,L) :- bfs([[X]], Y, L).

bfs([[Y|Path]|T], Y, L) :-  !, length([Y|Path], Len),  variants(Len, [[Y|Path]|T], Y, L).
bfs([[V|Path]|T], Y, L) :-  findall( [V1,V|Path], 
								   	 ( edge1(V1,V),
								 	   not(member(V1,[V|Path]))),
								   	 New),
							append(T,New,Ps),!,
							bfs(Ps, Y, L).

variants(Len, [[Y|Path]|_], Y, L) :- length([Y|Path], Len1), Len1 = Len, reverse([Y|Path], L).
variants(Len, [_|T], Y, L) :- variants(Len, T, Y, L).


% 19 --------------------------------------------------------------------------
% Цикличен если в графе существует такое ребро (a,b), что существует больше одного пути из a в b.
%cyclic :- findall((X,Y),edge(X,Y,_),L), cyclic1(L).
%cyclic1([(X,Y)|T]) :- findall(P,path(X,Y,P),LP), length(LP,L), L>1.

cyclic() :- edge1(X,_,_), edge1(Y,_,_),X\=Y, search(X,Y,W1), search(X,Y,W2), dif(W1,W2), !.

edge1(X, Y, C) :- edge(X, Y, C); edge(Y, X, C).

search(X, Y, Way) :- s1(X, Y, WayR, [X]), reverse(WayR, Way).
s1(X, X, W, W).
s1(X, Y, Way, L) :- edge1(X, Z, _), not(member(Z, L)), s1(Z, Y, Way, [Z|L]). 



% 20 --------------------------------------------------------------------------
% Isconnected
isconnected :- not(notconnected).
notconnected :- newedge(X,_,_), newedge(Y,_,_), not(X=Y), not(path(X,Y,_)).

