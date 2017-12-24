# Практикум по языку пролог

## Этап 1. 20 предикатов  

FIXME  

## Этап 2. Система, отвечающая на вопросы о родственных отношениях.
Файл с исходным кодом: `task2.pl` и `database.pl`  

База данных состоит из отношений четырех типов:  
* родитель  
* мужчина  
* женщина  
* супруги  

На основе этих типов выводятся родственные связи:
* близкие - муж, жена, брат, сестра, мать, отец, дочь и сын  
* не далекие родственники - тетя, дядя, бабушка, дедушка, внук и внучка  
* далекие родственники - двоюродный брат и двоюродная сестра  
* полученные в результате свадьбы - сноха, свекровь, невестка, свёкр, золовка, деверь, зять, тёща, тесть, шурин, свояченица, сват и сватья  

Программа имеет консольный интерфейс в виде 6 предикатов:  

% ii  
add_parent/2 % создает связь родитель-детеныш  
add_sp/2     % создает пару муж-жена  

% i  
add_male/1   % меняет пол человека на мужской (при необходимости создаёт нового человека)  
add_female/1 % меняет пол человека на женский (при необходимости создаёт нового человека)  

%i  
show_all_relatives/1 % выводит все родственные отношения для X  

% ii  
how_they_relate/2    % пишет кем являются друг для друга два человека 

Для простоты работы с текущей БД в архиве прилагается фотография: `database.jpg`  


## ASCII картинка  
ZZZZZ$$Z$$ZZZZZZZZ$Z$$ZZ$ZZ$$$$$$$$$Z??IIZD8$?IIZ$NN88DD8D888888888888888888888888DDNNDNDDZ$88888888
$ZZZZ$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Z???I8DDO???7$NDDNMNN8888888888888888888888888888888Z88NND888888
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Z????I7I????I$NNNNMN8888888888888888888888888888DDO$8NNDD8888888
$$$$$$$$$$$$$$$$$$$$$$$$$ZZZOOOOZZZ$Z???????II?II78DDNNND8888888888888888888O8O888888DNND88888888888
$$ZZZZZZOOZZZ$$$$$$$$$$$$$$$$$$$$$$$ZI$$$$$$$$$$$ZZZZZZZOD888O888888888OO88O8888O8888D888O8888O8888O
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Z$Z$$$$ZZZZZZZZZOZOZZZZZO888888888O8888888888O8OO8OO8OOOOOOOO88O8
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Z$ZZ$$$ZZZZZZZOZOZZZOOOOZZZZZZO88OO888OO888OOOOOOOOOOOOOOOOOOOO88OO8
$$$$$$$$$$$$$$$$$$$$$$$$$$$Z$$ZZZ$$$ZZZZZZZOZZOOZOOO8OOOOOOZZZZOO8888OO8OO8OOOO888888OOOOOOOOOOOOO8O
$$$$$$$$$$$$$$$$$$$$$$ZZZZZZZZZ$$ZZZZZZOOZZZ$I??+~===++=ZOZOZOZZOO8O8OOOOOOO8OO88O8OOOOO8OOOOOOOOOOO
$$$$$$$7$7$$$77$7$$$$ZZZZZZZZ$$$$ZZZZZZ7$I+::,,,,,,,,,,,:+=+$ZZZZ$OOOOOOOO8OOOO8OOOOOOOOOOOOOOOOOOOO
$ZZOOZZZ$$$$$$77$$$ZZZZZZZZZZZZZZZ$7=::,,,,,,,,,,,:,,,::::,,~=$ZZ$$OOOOOOOOO8O8O8OOOOOOOOOOOOOOOOOOO
$$$$7777$$$7$Z$Z$ZZZZZZZZZZZZZZZZ$=:,:,,,,,,,,::::::,,,,,,:,,::=7$ZZOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
$$7$$$7$7$ZZZZZZZZZZZZZZZZZZZZZZI:::~=~===~:,,~I7?==:~:::::,,:,::~?$$OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
7$7$$$$ZZZZZZZZZOZZOZZZZZZZZOZI~,:~=I7OZZ7?~::=O$7I7?I?I++~=:,,,,::+$$OOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
7777$OOZZZZZZZOOOOZZZZZZZZZZZ+:::==OO7?77$Z?=:~777II???++?+I?+~:::::=I$OOOOOOOOOOOOOOOOOOOOOOOOOOOOO
7777ZZZZZZZOZOOZOOZZZZ$$ZZOO$+~~=?OO7I7I77$I+::=I77?7?+++??III?=:::::~+OOOOOOOOOOO8OOOOOOOOOOOOOOOOO
$$$Z$ZZZZZZOOOOOOZZZZ$7ZZOO7~~~?78Z7I+??7I7?=:,:=III?=+~~=+?I77I?~:::::+ZOOOOOOOOOOOOOOOOOOOOOOOOOOO
7$$77ZZZOZOOOOOOOZZZZZZOOOO?~+IOZ$I+=~~~+77?+~::+?II=:::,,::+I$$7I+~::::=OOOOOOOOOOOOOOOOOOOOOOOOOOO
$$777ZZZOOOOOOOOZZZZZZZZOOI=+?OO7I+~:::,:=II+~:~?7?=:::,,,:::+7$Z$I?~::::+ZOOOOOOOOOOOOOOOOOOOOOOOOO
77777$OOZZOOOOOZZZZZZZZOOZ++7O8Z$+~~::::,:=I?=:+77~::::::::::~?7ZOZ$7?~:::=7ZOOOOOOOOOOOOOOOOOOOOOO8
777777ZZZOZOOOOZZZZZZOOOOI?IOD8O7=~:::::,::~+?+IZ?:,::::~::::~?$ZZ$$OZ?~:::~?OOOOOOOOOOOOOOOOOOOOOOO
777777$ZZZZZOZZZOOOZOZOOOII$O8O$?~::~:::::::=7I?$I::::~~~~~:,,:?7ZZZOOZ7=~~~=$OOOOOOOOOOOOOOOOOOOOOO
ZZOZZZ$ZZZOZZZZZZZZZOOO87I7OO87=:::~~~~:::::~7I+ZI=::~~~~=~~~:,,:=7ZO$ZZ7?IZZOOOOOOOOOOOOOOOOOOOOOOO
7777777ZZZZZZZZOOZZ$ZO8O77Z887~~=???++=~~:::=7++$7=~::::~=?7$I=+~:+$OO8O8+++$888OOOOOOOOOOOOOOOOOOOO
77777777ZZZZOZZZZZZZOOOZ778O$==I8DDNZ?==~::~=?+:I7?~~~~~+7ODZ78N7I~IZO88OZOII7$OO8OOOOOOOOOOOOOOOOOO
77777777$ZZZOZZZZZZZO8O$Z8OO7?ONZOD888$?+=~=+==~?7?=~~+?O8DO88O887:+IO8O8$7O$7$OOO8OOOOOOOOOOOOOOOOO
777777777ZZZOZZZZZOOOOOZO8OZI=IODOO8DD8ZI++++=~:=II?==+II8O88O8Z+~:~~=Z88I7ZZZZOO888OOOOOOOOOOOOOOOO
777777777ZZZOZZZZ$ZOO8OZ8D8I=~~=?$Z$$OOII===~::::==+=:~~+$??+?=~:::~::~+$DZ7$$ZO888O8OOOOOOOOOOOOOOO
$$ZZZZZZ$$ZOOZZZ$ZZOOOOONNI+==~~~~~~=+?++~~:::::::~:::,:+~~~:::::::~:~:~+D8Z$ZZZ$ZOO8OOOOOOOOOOOOOOO
77777777777ZOZZZ$ZOO88ZONZ+===~~~~~~~~~?~::::::::::::,,::~::::,:::~~:~:~~7D8$ZZ777ZZOOOOOOOOOOOOOOOO
77777777777ZOZZZZZOOOOZOZ?+=====~=~~~~=~~:::~:~:::::::,::::,,::~~~~:~:~~~=777II??IIZOOOOOOOOOOOOOOOO
777777777777ZZZ$$ZOOOZ$Z7?========~~:~~~~~:~~~~~~~~::::::::,,:::~~~~::~~~=++=~~~=7Z$ZZOOOOOOOOOOOOOO
777777777777$ZZZ$ZOOOI7ZI?+==~~===~~~~~~~~~~~~::~=~~~:::::,:,,:~~~~:~~~~~=:::::~+II77$ZOOOOOOOOOOOOO
7777777777I7$$$$7$ZZ$?I7I?++===~~~~:~~~~~~~===~::==~::::::,,,,::::~~:~~~~~::::~==+=?$OOOOOOOOOOOOOOO
ZZZZZZ$$$I+~::::,,,:=+??I?+====~~~~~~~~~~:~=+?I==?I?=:,:::::::::::::~~~~~~~::~~====??IZOOOOOOOOOOOOO
777777I=~::,,,,,,,,,::=+???+==~~~~~~~~~~::+I$ZZOOZZZ7+:,,::::~~~::::~=~~~~~::~~====++?7OOOOOOOOOOOOO
77777I=:::,,,,,,:,:,:::~?II+===~~~~~~~~~~?Z88O8OOOOO8OI~:,:~::,,,:::~==~~~~~~~=====+++?$OOOOOOOOOOOO
77777+~::::,,,,,,,,,:::~+II?+=~~~~~~~~~=7O888ZZZOZZO888Z:,:~::,::~=~~===~~~~~=====+=??IZZOOOOOOOOOOO
7777I=~~:::,,,,,,,,,::~~+III?====~~~~~~+8O888OZOOZZO8888=:::~::~~==+==+==~~=~=~===++++?$OZOOOOOOOOOO
7777I=~~::::,,,,,,:::~~=?III++?+==~~~~~?ODNNMN8888DMNND8=::::~::~+?==++++=====~=~~=++??7OZOOOOOOOOOO
ZZZZ$?~~~~~:::,:::::~=++IIIII?II+======?Z8NMMMDDDDMMMND8~::::~:~=I?++=+??++==~:~=~=++II$ZZOOOO8OOOOO
77777I==~~~~~:::::~~==?II?III?II?======+$8DDN8DNNDDD8O8Z~::~:~~=I$I+?????+===~====I?+77$OOOOOOOOOOOO
777777I====~=~~~~===+?III?I?III$OI=====??Z8DDDDNNDDDDO7?~~~~~~=II???+????++==~~~=?I?II7OOO88OOOOOOOO
77777777+===+++++=+??IIIIII??III77=====+??7ODNNNNNNNO7?+~=====+???+++++===++=~~==+?I77$ZOO88OOOO8OOO
777777777I?+???????IIIIIIIII??I?II7+++++?I7$$Z8DD8OO$7I+====++?+??????+===~~+?+==?I77$Z$88O8OOOOOO88
777777777$$$$7$I777????IIIIIIIIIIIII?+???I77Z$ZOOOOOZ7I+++??I?+77II+++++=~=~~~=??II7ZZZZOOOO88OOOO8O
$$$$777777$ZOOZZZZI????II?IIII7$7$77$III?I$$$$$ZOZ$$Z$I7777$I+I777??++===~~~===?I7$Z$O7Z888OO8OOO88O
7777777777$ZOZ8OO7I7II?I?II?III77$$7I$ZZZ7O8DD8DD8D88Z$88OZ7?II?++??++==~=~~=++?7$ZO7$77$8D88888OO8O
7777777777$$OOO8OZ$7II???????III7$$Z$I7ZOZ$ZOZZZOZZZ$7IDOZI???+?I+=+=========??7$ZZZZ$?I$Z8D8OO88O88
77777777777ZZZ$ZZO$$$I7?++????II77$$$777ZZ777$77$777I??O7II???+=+?=+=====+=+??I$Z$Z7$$?+=IZ8D8888888
777777777777$$$$Z$OZZZ7??++?I??I77$77$$77Z$$777I77II??ZZ$?I??++==~?=~====++?I$Z$Z$$7$$?I+?$8D877$$ZZ
777777777777$$$$$OOOO$II??++??III777$$$I7Z8O777IIIII788O$II?+?++==~=+====??I$$Z$$III$$777II$ODZ$7$$$
7$$77777777777$$$Z8OOZ$7II?I??IIII777$77Z7ZO8DOODDDDD8$I??II+++======+=++?I$Z$Z$777I$77I?I7IZDDZ$$77
I777777777777$$$$ZOOO8ZZ$Z7?????I7II7777II?I7OO8D8OO7I+++I?I+=+==+=+==+?I$$ZZZ$77???7$?+++IZO8DDZ?++
I777777777777777$$Z$OOOOZZ$7I?I?IIII7IIII????II77III?++=+?+?+=++=+++++?I7$ZOZ$77II??7ZI?+==78O8DD8??
I777777777777777777$$ZZ8OOZ$7I?II??I7II7?I????III?+?+++=++?++++?+++??I77ZZO777I7I????$$$?+II$Z88DDDO
I777777777777777777777$$OOOOZ$7I??III?II?I?????II++++?+++??+++++++?I7$ZZOZ7I?IIII?+I?I$7$??$O8OO88DD
I7777777$$77777$$$$$Z$III$OOOZ$$I?II???I?I??II?I?+++++I???+?++++??77ZZZ$7I????I?I?++?I$ZI+7$OO8O8888
I77777777777777777777IIIII$ZOOOZ7III??+?+?+?IIII?+????III?II???I77$Z$7I??+++++??+++??IZZ7I??88888O88
I777777777777777777777II??I?I7Z$$Z77I????+?I?????+III?I777I7II7$7$77I???+===++?++++++?777I??$OO88OOO
77777777777777777777777I?????III7$7$7I?II+??+?I??II777$7Z$777I7$7I???+?++========++++?I7$III7OOOOO88
77777777777$7777$7777777?+++???III7I77IIIIIIIIIIIII777Z$$$$$7I7II????+++====~~=~===++?777IIII$OOOZOO
78O8OOOOOZZOOOOOOO88OOZZI++++?????IIII7IIIII7II777$7$$7$$777II7III?I?++==~~~~~~~=~==+II777??7$OOZZZO
7DOOO88OOOOOO8888888OOOZ$+++++??+???III777$77777$$7$$77I777777III?+?++===~~~~~~~~~==++?I7III7$ZZZO$Z
7888888OO8OOOOOOOOOOOOOZ$++++++++????II7777$$Z777777I7II$7$77II????++===~~~~~~:~:~~~+?I?II??I7$$Z$$$
7OO88O8OOOOOOOOOOOOOOOOO$?+++++++?++??II777888$7$I7II77$Z$$III?+++====~=~~~~::::~~~~+++7I7+I.$..$.ZZ
$O8888DDDDDDDDDDDDD88O88O?+++++++++++?IIII88D$$$7I7$7$$7$$$II?++++++===~~~~~~::::~~~=??$777I777$$$Z$