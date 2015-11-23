% Se3 LP - Blatt 5 -
%
% Yani Djallal 6527225
% Hauke Koepcke 6677995
% Vincent Dahmen 6689845
%
% Uebungsgruppenleiter: Timo Baumann
% Gr.05 Mittwoch 12-14 Uhr

% Aufgabe 1
%
% b(x,y) b(Y,X)
% Die Unifikation ist erfolgreich, da klein x an groß Y und klein y an
% groß X gebunden wird.
% Y=x,
% X=y.
%
% t(r,i) t(Z,Z)
% Die Unifikation ist gescheitert, da man an groß Z nicht zwei
% verschiedene Werte binden kann. Erst wird Z=r gebunden,
% danach wird versucht Z=i zu binden, Z hat aber bereits einen Wert.
%
% h(g(F,k),g(k,F)) h(g(m,H),g(H,m))
% Die Unifikation ist erfolgreich, denn groß F wird an klein m gebunden
% und klein k and groß H.
% H=k,
% F=m.
%
% m(X,c(g),h(X)) m(t(r,s),c(u),h(g(T)),t)
% Die Unifikation ist gescheitert, da die Instanziierung falsch ist.
% das 2. Prädikat möchte 4 Argumente erhalten. Es bekommt aber nur
% 3.
%
% false not(true)
% Die Unifikation ist gescheitert, da die Struktur grund verschieden
% ist.
%
% False not(true)
% Die Unifikation ist erfolgreich, da False(großgeschrieben) als
% Variable erkannt wird und not(true) gebunden wird.


% Aufgabe 2
%
% 2.1.1
:- dynamic nachfolger/2.
% nachfolger(?Peanozahl,?Peanozahl2).
nachfolger(Peano,s(Peano)).
% Testeingaben:
% nachfolger(0,X).
% X=s(0).
% nachfolger(s(s(s(0))),X).
% X=s(s(s(s(0)))).

% 2.1.2
:- dynamic vorgänger/2.
% vorgänger(?Peanozahl,?Peanozahl).
vorgänger(s(Peano),Peano).
% Testeingaben:
% vorgänger(s(s(0)),X).
% X= s(0).

% 2.1.3. Subtraktion
:- dynamic differenz/3.
% differenz(?Peano1,?Peano2,-Peano3).
% Peano3 ist die Differenz von Peano1 und Peano2.
differenz(X,0,X).
differenz(s(X),s(Y),s(Diff)):-
        differenz(X,Y,s(Diff)).
% Testeingaben:
% differenz(s(s(s(0))),s(0),Ergebnis).
% Ergebnis = s(s(0)).
%
% differenz(s(s(0)),0,Ergebnis).
% Ergebnis = s(s(0)).

% 2.1.4. Verdoppelt
:- dynamic verdoppelt/2.
% verdoppelt(+Peano1,?Peano2).
verdoppelt(0,_).
verdoppelt(s(Peano1),s(Peano2)):-
        differenz(s(Peano1),s(Peano2),s(Diff)),
        s(Diff) = s(Peano2).
% Testeingaben:
% verdoppelt(s(s(0)),s(0)).
% true.
%
% verdoppelt(s(s(s(s(s(s(0)))))),s(s(s(0)))).
% true.

% 2.1.5. Modulo
:- dynamic modulo/3.
% modulo(?Dividend, ?Divisor, ?Modulo)
modulo(Divdend , Divisor, Rest) :-
    modulo(Divedend2, Divisor, Rest) ,
   differenz(Dividend, Dividend2, Divisor).
modulo(Dividend, Divisor, Rest) :- lt(Divisor, Dividend), Rest=Dividend.
% Testeingaben:
% modulo(s(s(0)),s(0),Rest).
% Rest = 0.
%
% modulo(s(s(s(s(s(0))))),s(s(0)),Rest).
% Rest = s(0).

% 2.1.6. Peano in Integer Umwandlung
:- dynamic peano2int/2.
% peano2int(?s(Peano),-Zahl1).
peano2int(0,0).
peano2int(s(X),Zahl1):-
        peano2int(X,Zahl2),
        Zahl1 is Zahl2 + 1.
% Testeingaben:
% peano2int(s(s(0)),X).
% X = 2.
%
% peano2int(s(s(s(s(s(0))))),X).
% X = 5.

% 2.2. Typtest
:-dynamic peano/1.
% peano(0).
% peano(s(X)) :- peano(X).
%
% ohne Typtest:
%
% lt(0,s(0)).
% lt(s(X),s(Y)) :- lt(X,Y).
%
% mit Typtest:
:- dynamic lt/2.
lt(0,s(0)).
lt(s(X),s(Y)) :- peano(s(X)),
		 peano(s(Y)),
                 lt(X,Y).
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
%                     peano(s(R)),
%                     add(X,Y,R).
%
% Mit einem Typtest müssen alle Argumente instanziiert werden,
% sonst terminiert die Rekursion nicht und es werden endlich viele
% Peano-Zahlen erzeugt, bis der Speicher voll ist und wir einen
% Stack-Overflow Fehler kommen.

% Aufgabe 3
%
% 3.1.
% ist_betroffen_von(?Ort1,?Ort2,-Distanz)
ist_betroffen_von(Ort1,Ort2,Distanz) :-
        stromaufwaerts(_,Ort2,Ort1,Distanz).
ist_betroffen_von(Ort1,Ort2,Distanz) :-
        stromaufwaerts(_,Ort2,Ort3,Distanz1),
        ist_betroffen_von(Ort1,Ort3,Distanz2),
        Ort2 \== Ort3,
        Distanz is Distanz1 + Distanz2.

% 3.2.
% zeit(?Ort1,?Ort2,-Zeit)
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

% Aufgabe 3 - Ueberarbeitete Datenbasis
stromaufwaerts(moldau,praha,muendung_moldau,38,4).

stromaufwaerts(elbe,muendung_moldau,usti,70,2).
stromaufwaerts(elbe,usti,dresden,93,2).
stromaufwaerts(elbe,dresden,meissen,26,3).
stromaufwaerts(elbe,meissen,torgau,73,6).
stromaufwaerts(elbe,torgau,rosslau,102,1).
stromaufwaerts(elbe,rosslau,muendung_saale,33,2).
stromaufwaerts(elbe,muendung_saale,magdeburg,35,2).
stromaufwaerts(elbe,magdeburg,tangermuende,63,2).
stromaufwaerts(elbe,tangermuende,muendung_havel,34,4).
stromaufwaerts(elbe,muendung_havel,wittenberge,31,7).
stromaufwaerts(elbe,wittenberge,schnackenburg,21,9).
stromaufwaerts(elbe,schnackenburg,geesthacht,111,1).
stromaufwaerts(elbe,geesthacht,hamburg,22,1).
stromaufwaerts(elbe,hamburg,muendung_elbe,125,1).

stromaufwaerts(saale,calbe,muendung_saale,20,1).
stromaufwaerts(saale,bernburg,calbe,16,4).
stromaufwaerts(saale,halle,bernburg,57,2).

stromaufwaerts(mulde,bitterfeld,rosslau,27,2).
stromaufwaerts(mulde,wurzen,bitterfeld,47,6).

stromaufwaerts(havel,havelberg,muendung_havel,3,2).
stromaufwaerts(havel,rathenow,havelberg,42,2).
stromaufwaerts(havel,brandenburg,rathenow,47,3).
stromaufwaerts(havel,muendung_spree,brandenburg,55,3).

stromaufwaerts(spree,berlin_mitte,muendung_spree,14,4).


stromaufwaerts(oder,muendung_neisse,eisenhuettenstadt,11,1).
stromaufwaerts(oder,eisenhuettenstadt,frankfurt_oder,33,1).
stromaufwaerts(oder,frankfurt_oder,schwedt,111,4).
stromaufwaerts(oder,schwedt,szczecin,42,3).
stromaufwaerts(oder,szczecin,swinoujscie,61,4).

% Aufgabe 4
%
:-[dateiverzeichnis].
% Rekursive Definition fuer eine Suche
:- dynamic ist_erreichbar_von/2.
ist_erreichbar_von(DirA, DirB):- directory(DirA,_,DirB,_,_).
ist_erreichbar_von(DirA, DirB):- directory(DirA,_,DirC,_,_),
	ist_erreichbar_von(DirC, DirB),	DirC \= DirB.


:- dynamic ist_erreichbar_von_root/1.
ist_erreichbar_von_root(FileId):- file(FileId,Dir,_,_,_,_),
	ist_erreichbar_von(Dir, 0).

:- dynamic ist_unterverzeichnis_von/2.
ist_unterverzeichnis_von(DirA, DirB):- directory(DirA,_,DirB,_,_).
ist_unterverzeichnis_von(DirA, DirB):- directory(DirC,_,DirA,_,_),
	ist_unterverzeichnis_von(DirB, DirC), DirC \= DirB.

% Aufgabe 5
%
% All diese Prädikaten benutzen verschiedene Arten von Rekursion um ein
% Problem zu lösen.
% Alle Rekursionen haben eine Abbruchbedingung oder einen fest
% definierten Fall um einen Rekursionsschritt zu beenden. Im
% Rekursionsschritt wird jeweils ein Teil des Aufrufsparameters
% verändert. Im wesentlichen unterscheiden wir zwischen sogenannten
% Endrekursionen bei denen das Ergebnis mit dem lezten Aufruf berechnet
% ist wie etwa bei der peano-subtraktion und solchen Rekursionen bei
% denen der gesamte Stack wieder abgebaut werden muss etwa wie in der
% Flusssuche. Damit das Prädikat terminierungssicher ist muss die
% Abbruchbedingung wohldefiniert sein! Das bedeutet dass die rekursion
% stets nach endlich vielen Schritten terminiert. So ist z.B. die Suche
% nach einem Parent-Directory auf jeden Fall terminierungssicher,
% wohingegen die Frage nach den Kindern in einer Verwandschaftsbeziehung
% eventuell unendlich.
