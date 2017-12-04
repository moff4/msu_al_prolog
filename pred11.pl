union([E|M1],M2,M3):-member(E,M2),!,union(M1,M2,M3).
union([E|M1],M2,[E|M3]):-union(M1,M2,M3).
union([],M2,M2).