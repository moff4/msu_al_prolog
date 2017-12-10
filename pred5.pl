% iii iio
delete_one(_,[],[]):-!.
delete_one(X,[X|T],T):-!.
delete_one(X,[Y|T],[Y|TY]):-delete_one(X,T,TY).