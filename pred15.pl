% iiii iiio
substitute(nil,_,_,nil):-!.
substitute(tree(T1,T2,V),V,T,tree(T11,T22,T)):-substitute(T1,V,T,T11),substitute(T2,V,T,T22),!.
substitute(tree(T1,T2,V),W,T,tree(T11,T22,V)):-substitute(T1,W,T,T11),substitute(T2,W,T,T22).