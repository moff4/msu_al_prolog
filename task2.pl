
% parent oi io ii oo
% HERE IS DATABASE +++++++
% it should be here FIXME

parent(zina,alice).
parent(kosty,alice).

parent(ira,bob).
parent(tomas,bob).
parent(ira,alex).
parent(tomas,alex).
parent(ira,kate).
parent(tomas,kate).

parent(alice,petr).
parent(bob,petr).
parent(alice,max).
parent(bob,max).
parent(alice,olga).
parent(bob,olga).

parent(eva,jane).
parent(petr,jane).

parent(marge,dave).
parent(max,dave).
parent(marge,kira).
parent(max,kira).

parent(olga,steve).
parent(andrey,steve).
parent(olga,sveta).
parent(andrey,sveta).
parent(olga,arnold).
parent(andrey,arnold).


male(max).
male(bob).
male(kosty).
male(tomas).
male(alex).
male(petr).
male(andrey).
male(dave).
male(steve).
male(arnold).

female(alice).
female(zina).
female(ira).
female(kate).
female(eva).
female(marge).
female(olga).
female(jane).
female(kira).
female(sveta).


% HERE IS DATABASE -------

% ii io oi
mother(X,Y):-parent(X,Y),female(X).

% ii io oi
father(X,Y):-parent(X,Y),male(X).

% ii io oi
grandparent(X,Y):-parent(X,Z),parent(Z,Y).

