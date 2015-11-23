% Aufgabe 1
%
% ?- b(x,y) = b(Y,X).
% Y = x,
% X = y.
%
% Kann erfolgreich unifiziert werden, da X und Y noch nichts gebunden
% haben. x wird an Y gebunden und y an X.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ?- t(r,i)=t(Z,Z).
% false.
%
% Die unifizierung scheitert, da an Z nicht zweimal gebunden werden
% kann. Als erstes wird das r an Z gebunden und danach wird versucht i
% an Z zu binden, was fehlschlägt.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ?- h(g(F,k),g(k,F)) = h(g(m,H),g(H,m)).
% F = m,
% H = k.
%
% Kann erfolgreich unifiziert werden. m wird an F gebunden und k an H.
% in g(k,F) = g(H,m) wird dann im Grunde geprüft ob g(k,m) = g(k,m), was
% true ist.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ?- m(X,c(g),h(X)) = m(t(r,s),c(u),h(g(T)),t).
% false.
%
% Unifizierung scheitert, da die erste Klausel 3 Argumente besitzt und
% die zweite 4. Struktur ist nicht dieselbe und kann daher nicht
% unifiziert werden.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ?- false = not(true).
% false.
%
% Kann nicht unifiziert werden, da strukturell ungleich.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ?- False = not(true).
% False = not(true).
%
% Kann unifiziert werden. False ist hier nicht der Boolsche Ausdruck
% sondern eine unbelegte Variable. not(true) wird an False gebunden.


% Aufgabe 2
%
% 1.1.) Nachfolger
%
% nachfolger(?Peano1,?Peano2). Peano2 ist der direkte Nachfolger von
% Peano1.
% Richtungsunabhängig.
%
nachfolger(0,s(0)).
nachfolger(s(X),s(Y)):-
       nachfolger(X,Y).

% Test
%
% ?- nachfolger(s(0),Nachfolger).
% Nachfolger = s(s(0)).
%
% ?- nachfolger(Vorgänger,Nachfolger).
% Vorgänger = 0,
% Nachfolger = s(0) ;
% Vorgänger = s(0),
% Nachfolger = s(s(0)) ;
% Vorgänger = s(s(0)),
% Nachfolger = s(s(s(0))) ;
% Vorgänger = s(s(s(0))),
% Nachfolger = s(s(s(s(0)))) ;
% Vorgänger = s(s(s(s(0)))),
% Nachfolger = s(s(s(s(s(0))))).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.2.) Vorgänger
%
% Das gleiche Prädikat wie in Aufgabe 2.1 kann genommen werden.
% Es kann den Vorgänger sowie den Nachfolger ermitteln.
%
% nachfolger(?Peano1, ?Peano2). Peano 1 ist der direkte Vorgänger von
% Peano 2.
% Richtungsunabhängig.
%
% Test
%
% ?- nachfolger(Vorgänger,s(s(0))).
% Vorgänger = s(0).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.3.) Subtraktion
%
%
% subtraktion(?Peano1,?Peano2,-Peano3).
% Peano 3 ist die Differenz von Peano1 und Peano2.

differenz(X,0,X).
differenz(s(X),s(Y),s(Diff)):-
	differenz(X,Y,s(Diff)).

% Test
%
% ?- differenz(s(s(s(s(s(0))))),s(s(0)),Diff).
% Diff = s(s(s(0))).
%
% ?- differenz(X,Y,Z).
% X = Z,
% Y = 0 ;
% X = s(s(_G16148)),
% Y = s(0),
% Z = s(_G16148) ;
% X = s(s(s(_G16148))),
% Y = s(s(0)),
% Z = s(_G16148) ;
% X = s(s(s(s(_G16148)))),
% Y = s(s(s(0))),
% Z = s(_G16148)
% ...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.4.) Verdoppelt
%
% verdoppelt(+Peano1,?Peano2).
%
verdoppelt(0,_).
verdoppelt(s(Peano1),s(Peano2)):-
	differenz(s(Peano1),s(Peano2),s(Diff)),
	s(Diff) = s(Peano2).

% Test
%
% ?- verdoppelt(s(s(s(s(0)))),s(s(0))).
% true .
%
% ?- verdoppelt(s(s(s(s(0)))),X).
% X = s(s(0)) .
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.5.) Modulo
%
%
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.6.) Peano -> Integer
%
% peano2int(?Int,?s(Peano)).
%
peano2int(0,0).
peano2int(Int,s(Peano)):-
	peano2int(Int1,Peano),
	Int is Int1 + 1.

% Test
%
% ?- peano2int(Int,s(s(s(s(0))))).
% Int = 4.
%
% ?- peano2int(Int,X).
% Int = X, X = 0 ;
% Int = 1,
% X = s(0) ;
% Int = 2,
% X = s(s(0)) ;
% Int = 3,
% X = s(s(s(0))) ;
% Int = 4,
% X = s(s(s(s(0)))) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2.2.)
%
 peano(0).
 peano(s(X)) :- peano(X).

% ohne Typtest:
%
% lt(0,s(0)).
% lt(s(X),s(Y)) :- lt(X,Y).
%
% Test
%
% [trace] 138 ?- lt(s(0),X).
%   Call: (7) lt(s(0), _G1505) ? creep
%   Call: (8) lt(0, _G1578) ? creep
%   Exit: (8) lt(0, s(0)) ? creep
%   Exit: (7) lt(s(0), s(s(0))) ? creep
% X = s(s(0)).

% mit Typtest:
%
 lt(0,s(0)).
 lt(s(X),s(Y)) :- peano(s(X)),
                  peano(s(Y)),
                  lt(X,Y).

% Test
%
% [trace] 2 ?- lt(s(0),X).
%   Call: (7) lt(s(0), _G637) ? creep
%   Call: (8) peano(s(0)) ? creep
%   Call: (9) peano(0) ? creep
%   Exit: (9) peano(0) ? creep
%   Exit: (8) peano(s(0)) ? creep
%   Call: (8) peano(s(_G707)) ? creep
%   Call: (9) peano(_G707) ? creep
%   Exit: (9) peano(0) ? creep
%   Exit: (8) peano(s(0)) ? creep
%   Call: (8) lt(0, 0) ? creep
%   Fail: (8) lt(0, 0) ? creep
%   Redo: (9) peano(_G707) ? creep
%   Call: (10) peano(_G713) ? creep
%   Exit: (10) peano(0) ? creep
%   Exit: (9) peano(s(0)) ? creep
%   Exit: (8) peano(s(s(0))) ? creep
%   Call: (8) lt(0, s(0)) ? creep
%   Exit: (8) lt(0, s(0)) ? creep
%   Exit: (7) lt(s(0), s(s(0))) ? creep
% X = s(s(0)) ;
%   Redo: (10) peano(_G713) ? creep
% ....
% Terminiert nicht.
%
%
% ohne Typtest:
%
% add(0,X,X).
% add(s(X),Y,s(R)) :- add(X,Y,R).
%
% mit Typtest:
%
% add(0,X,X).
% add(s(X),Y,s(R)) :- peano(s(X)),
%		      peano(Y),
%		      peano(s(R)),
%		      add(X,Y,R).

% Mit einem Typtest müssen alle Argumente instanziiert werden,
% sonst terminieren die Anfragen nicht und es werden unendlich viele
% Peano-Zahlen erzeugt.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Aufgabe 3)
%
%
% ist_betroffen_von(?Ort1,?Ort2,?Distanz)
% Ort1 liegt stromabwaerts von Ort2, mit der Gesamtdistanz
% entlang der Flüsse.

ist_betroffen_von(Ort1,Ort1,0).
ist_betroffen_von(Ort2,Ort1,Distanz) :-
	stromaufwaerts(_,Ort1,Ort2,Distanz,_).
ist_betroffen_von(Ort2,Ort1,SummeDistanz) :-
	stromaufwaerts(_,Ort1,OrtX,Distanz1,_),
	ist_betroffen_von(Ort2,OrtX,Distanz2),
	Ort2 \== OrtX,
	SummeDistanz is Distanz1 + Distanz2.

% Test
%
% ?- ist_betroffen_von(hamburg,praha,X).
% X = 752 .
%
% ?- ist_betroffen_von(praha,hamburg,X).
% false.
%
% ?- ist_betroffen_von(usti,muendung_moldau,70).
% true.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  3.2)
%
% zeit(?Ort1,?Ort2,?Zeit)
% Ort1 liegt stromabwaerts von Ort2, mit der Gesamtzeit in
% Stunden, um von Ort2 nach Ort1
% getrieben zu werden.
%
zeit(Ort1,Ort1,0).
zeit(Ort2,Ort1,Zeit) :-
	stromaufwaerts(_,Ort1,Ort2,Distanz,Geschw),
	Zeit is Distanz / Geschw.
zeit(Ort2,Ort1,SummeZeit) :-
	stromaufwaerts(_,Ort1,OrtX,Distanz,Geschw),
	Zeit1 is Distanz / Geschw,
	zeit(Ort2,OrtX,Zeit2),
	Ort2 \== OrtX,
	SummeZeit is Zeit1 + Zeit2.

% Test
%
% ?- zeit(Ort,schnackenburg,Zeit).
% Ort = schnackenburg,
% Zeit = 0 ;
% Ort = geesthacht,
% Zeit = 37 ;
% Ort = hamburg,
% Zeit = 48 ;
% Ort = muendung_elbe,
% Zeit = 68.83333333333333 ;
% false.



stromaufwaerts(moldau,praha,muendung_moldau,38,6).

stromaufwaerts(elbe,muendung_moldau,usti,70,5).
stromaufwaerts(elbe,usti,dresden,93,5).
stromaufwaerts(elbe,dresden,meissen,26,6).
stromaufwaerts(elbe,meissen,torgau,73,8).
stromaufwaerts(elbe,torgau,rosslau,102,4).
stromaufwaerts(elbe,rosslau,muendung_saale,33,5).
stromaufwaerts(elbe,muendung_saale,magdeburg,35,5).
stromaufwaerts(elbe,magdeburg,tangermuende,63,5).
stromaufwaerts(elbe,tangermuende,muendung_havel,34,7).
stromaufwaerts(elbe,muendung_havel,wittenberge,31,9).
stromaufwaerts(elbe,wittenberge,schnackenburg,21,12).
stromaufwaerts(elbe,schnackenburg,geesthacht,111,3).
stromaufwaerts(elbe,geesthacht,hamburg,22,2).
stromaufwaerts(elbe,hamburg,muendung_elbe,125,6).

stromaufwaerts(saale,calbe,muendung_saale,20,6).
stromaufwaerts(saale,bernburg,calbe,16,8).
stromaufwaerts(saale,halle,bernburg,57,4).

stromaufwaerts(mulde,bitterfeld,rosslau,27,9).
stromaufwaerts(mulde,wurzen,bitterfeld,47,11).

stromaufwaerts(havel,havelberg,muendung_havel,3,4).
stromaufwaerts(havel,rathenow,havelberg,42,4).
stromaufwaerts(havel,brandenburg,rathenow,47,7).
stromaufwaerts(havel,muendung_spree,brandenburg,55,8).

stromaufwaerts(spree,berlin_mitte,muendung_spree,14,9).


stromaufwaerts(oder,muendung_neisse,eisenhuettenstadt,11,2).
stromaufwaerts(oder,eisenhuettenstadt,frankfurt_oder,33,3).
stromaufwaerts(oder,frankfurt_oder,schwedt,111,7).
stromaufwaerts(oder,schwedt,szczecin,42,6).
stromaufwaerts(oder,szczecin,swinoujscie,61,8).



% Aufgabe 4

% Rekursive Definition für eine Suche

ist_erreichbar_von(DirA, DirB):- directory(DirA,_,DirB,_,_).
ist_erreichbar_von(DirA, DirB):- ist_erreichbar_von(DirB, DirA).
ist_erreichbar_von(DirA, DirB):- directory(DirA,_,DirC,_,_), ist_erreichbar_von(DirC, DirB).

ist_erreichbar_von_root(FileId):- file(FileId,Dir,_,_,_,_), ist_erreichbar_von(Dir, 0).

ist_unterverzeichnis_von(DirA, DirB):- directory(DirA,_,DirB,_,_).
ist_unterverzeichnis_von(DirA, DirB):- directory(DirC,_,DirA,_,_), ist_unterverzeichnis_von(DirB DirC).





