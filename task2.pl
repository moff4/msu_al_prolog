:-['database.pl'].
:- dynamic male/1,female/1,parent/2,suprug/2.

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
whoarethey(X,Y,'племянник'):- uncle(Y,X),male(X).
whoarethey(X,Y,'племянник'):- aunt(X,Y),male(X).
whoarethey(X,Y,'племянница'):- uncle(Y,X),female(X).
whoarethey(X,Y,'племянница'):- aunt(X,Y),female(X).
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
whoarethey(X,Y,'сноха'):-spouses(X,Z),mother(Y,Z),female(Y).
whoarethey(X,Y,'свекровь'):-whoarethey(Y,X,'сноха'),female(Y).
whoarethey(X,Y,'невестка'):-spouses(X,Z),father(Y,Z),female(Y).
whoarethey(X,Y,'свёкр'):-whoarethey(Y,X,'невестка'),female(Y).
whoarethey(X,Y,'невестка'):-spouses(X,Z),sister(Z,Y),female(Y).
whoarethey(X,Y,'золовка'):-whoarethey(Y,X,'невестка'),female(Y).
whoarethey(X,Y,'невестка'):-spouses(X,Z),brother(Z,Y),female(Y).
whoarethey(X,Y,'деверь'):-whoarethey(Y,X,'невестка'),female(Y).

whoarethey(X,Y,'зять'):-spouses(X,Z),mother(Y,Z),male(Y).
whoarethey(X,Y,'тёща'):-whoarethey(Y,X,'зять'),male(Y).
whoarethey(X,Y,'зять'):-spouses(X,Z),father(Y,Z),male(Y).
whoarethey(X,Y,'тесть'):-whoarethey(Y,X,'зять'),male(Y).
whoarethey(X,Y,'зять'):-spouses(X,Z),sister(Z,Y),male(Y).
whoarethey(X,Y,'шурин'):-whoarethey(Y,X,'зять'),male(Y).
whoarethey(X,Y,'зять'):-spouses(X,Z),brother(Z,Y),male(Y).
whoarethey(X,Y,'свояченица'):-whoarethey(Y,X,'зять'),male(Y).

whoarethey(X,Y,'сват'):-father(X,Z),spouses(Z,Q),parent(Y,Q).
whoarethey(X,Y,'сватья'):-mother(X,Z),spouses(Z,Q),parent(Y,Q).

% ----------------------- УНИВЕРСАЛЬНАЯ ШТУКА ДЛЯ ВСЕХ ОСТАЛЬНЫХ --------------
% ----------------------- ИЗМЕНЕНИЯ БД ----------------------------------------

assert_spouses(X,Y,error):-spouses(X,Z),Z \= Y,write(X),write(' уже состоит в браке с '),write(Z),!.
assert_spouses(X,Y,error):-spouses(Y,Z),Z \= X,write(Y),write(' уже состоит в браке с '),write(Z),!.
assert_spouses(X,Y,success):-male(X),female(Y),asserta(suprug(X,Y)),write('теперь '),write(X),write(' и '),write(Y),write(' - одна большая семья :3'),!.
assert_spouses(X,Y,success):-female(X),male(Y),asserta(suprug(X,Y)),write('теперь '),write(X),write(' и '),write(Y),write(' - одна большая семья :3'),!.
assert_spouses(X,Y,not_exists):-write('Уверены, что существуют '),write(X),write(' и '),write(Y),write(' (да еще и разных полов) ?'),!.

assert_parent(X,Y,success):-exsist(X),exsist(Y),asserta(parent(X,Y)),write('теперь '),write(X),write(' родитель '),write(Y),!.
assert_parent(X,Y,not_exists):-write('Уверены, что существуют '),write(X),write(' и '),write(Y),write('?'),!.

assert_male(X,error):-female(X),spouses(X,_),write(' противоречие мужчина не может быть женат на мужчине'),!. 
assert_male(X,already):-male(X),write('Уже добавлено '),!. 
assert_male(X,success):-retract(female(X)),asserta(male(X)),write(' пол '),write(X),write(' изменен на мужской'),!. 
assert_male(X,success):-asserta(male(X)),write(' пол '),write(X),write(' изменен на мужской'),!.


assert_female(X,error):-male(X),spouses(X,_),write(' противоречие женщина не может быть замужем за женщиной'),!. 
assert_female(X,already):-female(X),write('Уже добавлено '),!. 
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

% ii - пишет кем является X для всех своих родствеников
how_they_relate(X,Y):-whoarethey(Y,X,S),write(X),write(' - '),write(S),write(' для '),write(Y).


% ---


% ----------------------- ПОЛЬЗОВАТЕЛЬСКИЙ ИНТЕРФЕЙС ------------------------
% ----------------------- НАСТОЯЩИЙ ИНТЕРФЕЙС -------------------------------


run(0).
run(1):-
	write_ln('Введите имя человека:'),
	read(Y),
	write_ln('Введите вид родственной связи:'),
	read(S),
	findall([X,' -- ',S,' для ',Y],whoarethey(Y,X,S),L),
	foreach(member(Q, L),write_ln(Q)),
	main(_).
run(2):-write_ln('Введите имя'),
	read(X),
	findall([S,' для ',Y],whoarethey(Y,X,S),L),
	foreach(member(Q, L),write_ln(Q)),
	main(_).
run(3):-
	write_ln('Введите два имя:'),
	read(X),
	read(Y),
	whoarethey(Y,X,S),
	write(X),write(' - '),write(S),write(' для '),write_ln(Y),
	main(_).
run(4):-
	write_ln('Введите имя:'),
	read(X),
	add_male(X),
	main(_).
run(5):-
	write_ln('Введите имя:'),
	read(X),
	add_female(X),
	main(_).
run(6):-
	write_ln('Введите имя родителя:'),
	read(X),
	write_ln('Введите имя детеныша:'),
	read(Y),
	add_parent(X,Y),
	main(_).
run(7):-
	write_ln('Введите два имя:'),
	read(X),
	read(Y),
	add_sp(X,Y),
	main(_).

prerun():-read(X),run(X).

main(_):-
	write_ln(''),
	write_ln('Введите команду:'),
	prerun().

:-write_ln(' Привет мир! '),
	write_ln('Программа для работы с базой данных родственных отношений'),
	write_ln('0 - закончить работу'),
	write_ln('1 - найти родственика по родственной связи'),
	write_ln('2 - выводит все родственные отношения для кого-то'),
	write_ln('3 - выводит родственное отношение для двух индивидумов'),
	write_ln('4 - добавить мужчину'),
	write_ln('5 - добавить женщину'),
	write_ln('6 - добавить связь родитель-детеныш'),
	write_ln('7 - создает пару муж-жена'),
	write_ln('').
:-main(_).