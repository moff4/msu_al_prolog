['database.pl'].

% ii io oi
mother(X,Y):-parent(X,Y),female(X).

% ii io oi
father(X,Y):-parent(X,Y),male(X).

% ii io oi oo
grandparent(X,Y):-parent(X,Z),parent(Z,Y).

% ii io oi oo
grandchild(X,Y):-grandparent(Y,X).

% io ii
brother(X,Y):-parent(Z,X),parent(Z,Y),male(Y),male(Z).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(Y),female(Z).

% io ii
uncle(X,Y):-parent(Z,X),brother(Z,Y).
aunt(X,Y):-parent(Z,X),sister(Z,Y).
