:- dynamic male/1,female/1,parent/2,suprug/2.
['database.pl'].

% ----------------------- САМОЕ ПРОСТОЕ ---------------------------------------

% i
exsist(X):-male(X).
exsist(Y):-female(Y).

% ii io oi
mother(X,Y):-parent(X,Y),female(X).
father(X,Y):-parent(X,Y),male(X).

% ii io oi
son(X,Y):-parent(Y,X),male(X).
daughter(X,Y):-parent(Y,X),female(X).

% ii io oi oo
grandparent(X,Y):-parent(Y,Z),parent(Z,X).
grandchild(X,Y):-grandparent(Y,X).

% io ii
brother(X,Y):-parent(Z,X),parent(Z,Y),male(Y),male(Z),X \= Y.
sister(X,Y):-parent(Z,X),parent(Z,Y),female(Y),female(Z),X \= Y.

% io ii
uncle(X,Y):-parent(Z,X),brother(Z,Y).
aunt(X,Y):-parent(Z,X),sister(Z,Y).

% ----------------------- САМОЕ ПРОСТОЕ ---------------------------------------
% ----------------------- УНИВЕРСАЛЬНАЯ ШТУКА ДЛЯ ВСЕХ ОСТАЛЬНЫХ --------------
% iio ioo oio
% whoarethey( 1st , 2nd , status ):-
% 1st является "status" для 2nd

% nearenst
whoarethey(X,Y,'муж'):- spouses(X,Y),male(Y).
whoarethey(X,Y,'жена'):- spouses(X,Y),female(Y).

whoarethey(X,Y,'брат'):- brother(X,Y).
whoarethey(X,Y,'сестра'):- sister(X,Y).
whoarethey(X,Y,'мать'):- mother(Y,X).
whoarethey(X,Y,'отец'):- father(Y,X).
whoarethey(X,Y,'дочь'):- daughter(Y,X).
whoarethey(X,Y,'сын'):- son(Y,X).

% second step
whoarethey(X,Y,'тетя'):- aunt(X,Y).
whoarethey(X,Y,'дядя'):- uncle(X,Y).
whoarethey(X,Y,'бабушка'):- grandparent(X,Y),female(X).
whoarethey(X,Y,'дедушка'):- grandparent(X,Y),male(X).
whoarethey(X,Y,'внук'):- grandchild(X,Y),male(Y).
whoarethey(X,Y,'внучка'):- grandchild(X,Y),female(Y).

% third step
whoarethey(X,Y,'двоюродный брат'):-uncle(X,Z),parent(Z,Y),male(Y).
whoarethey(X,Y,'двоюродная сестра'):-uncle(X,Z),parent(Z,Y),female(Y).
whoarethey(X,Y,'двоюродный брат'):-aunt(X,Z),parent(Z,Y),male(Y).
whoarethey(X,Y,'двоюродная сестра'):-aunt(X,Z),parent(Z,Y),female(Y).

% by marrige
whoarethey(X,Y,'сноха'):-spouses(X,Z),mother(Y,Z),female(X).
whoarethey(X,Y,'свекровь'):-whoarethey(Y,X,'сноха'),female(X).
whoarethey(X,Y,'невестка'):-spouses(X,Z),father(Y,Z),female(X).
whoarethey(X,Y,'свёкр'):-whoarethey(Y,X,'невестка'),female(X).
whoarethey(X,Y,'невестка'):-spouses(X,Z),sister(Z,Y),female(X).
whoarethey(X,Y,'золовка'):-whoarethey(Y,X,'невестка'),female(X).
whoarethey(X,Y,'невестка'):-spouses(X,Z),brother(Z,Y),female(X).
whoarethey(X,Y,'деверь'):-whoarethey(Y,X,'невестка'),female(X).

whoarethey(X,Y,'зять'):-spouses(X,Z),mother(Y,Z),male(X).
whoarethey(X,Y,'тёща'):-whoarethey(Y,X,'зять'),male(X).
whoarethey(X,Y,'зять'):-spouses(X,Z),father(Y,Z),male(X).
whoarethey(X,Y,'тесть'):-whoarethey(Y,X,'зять'),male(X).
whoarethey(X,Y,'зять'):-spouses(X,Z),sister(Z,Y),male(X).
whoarethey(X,Y,'шурин'):-whoarethey(Y,X,'зять'),male(X).
whoarethey(X,Y,'зять'):-spouses(X,Z),brother(Z,Y),male(X).
whoarethey(X,Y,'свояченица'):-whoarethey(Y,X,'зять'),male(X).

whoarethey(X,Y,сват):-father(X,Z),spouses(Z,Q),parent(Y,Q).
whoarethey(X,Y,сватья):-mother(X,Z),spouses(Z,Q),parent(Y,Q).

% ----------------------- УНИВЕРСАЛЬНАЯ ШТУКА ДЛЯ ВСЕХ ОСТАЛЬНЫХ --------------
% ----------------------- ИЗМЕНЕНИЯ БД ----------------------------------------


assert_spouses(X,Y,success):-male(X),female(Y),asserta(suprug(X,Y)),write('теперь '),write(X),write(' и '),write(Y),write(' - одна большая семья :3'),!.
assert_spouses(X,Y,success):-female(X),male(Y),asserta(suprug(X,Y)),write('теперь '),write(X),write(' и '),write(Y),write(' - одна большая семья :3'),!.
assert_spouses(X,Y,not_exists):-write('Уверены, что существуют '),write(X),write(' и '),write(Y),write(' (да еще и разных полов) ?'),!.

assert_parent(X,Y,success):-exsist(X),exsist(Y),asserta(parent(X,Y)),write('теперь '),write(X),write(' родитель '),write(Y),!.
assert_parent(X,Y,not_exists):-write('Уверены, что существуют '),write(X),write(' и '),write(Y),write('?'),!.

assert_male(X,error):-female(X),spouses(X,_),write(' противоречие мужчина не может быть женат на мужчине'),!. 
assert_male(X,already):-male(X),write(' уже добавлено '),!. 
assert_male(X,success):-retract(female(X)),asserta(male(X)),write(' пол '),write(X),write(' изменен на мужской'),!. 
assert_male(X,success):-asserta(male(X)),write(' пол '),write(X),write(' изменен на мужской'),!.


assert_female(X,error):-male(X),spouses(X,_),write(' противоречие женщина не может быть замужем за женщиной'),!. 
assert_female(X,already):-female(X),write(' уже добавлено '),!. 
assert_female(X,success):-retract(male(X)),asserta(female(X)),write(' пол '),write(X),write(' изменен на женский'),!. 
assert_female(X,success):-asserta(female(X)),write(' пол '),write(X),write(' изменен на женский'),!.

% ----------------------- ИЗМЕНЕНИЯ БД ----------------------------------------
% ----------------------- ПОЛЬЗОВАТЕЛЬСКИЙ ИНТЕРФЕЙС --------------------------

% ii
add_parent(X,Y):-assert_parent(X,Y,_). % создает связь родитель-детеныш
add_sp(X,Y):-assert_spouses(X,Y,_).    % создает пару муж-жена

% i
add_male(X):-assert_male(X,_).         % меняет пол человека на мужской (при необходимости создаёт нового человека) 
add_female(X):-assert_female(X,_).     % меняет пол человека на женский (при необходимости создаёт нового человека)

%i  - выводит все родственные отношения для X
show_all_relatives(X):-how_they_relate(X,_).

% ii - пишет в кем является X для всех родствеников
how_they_relate(X,Y):-whoarethey(Y,X,S),write(X),write(' является '),write(S),write(' для '),write(Y).
