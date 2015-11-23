% Se3 LP - Blatt 5 -
%
% Yani Djallal 6527225
% Hauke Koepcke 6677995
% Vincent Dahmen ######
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

% 2.1.3.) Subtraktion
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

% 2.1.4.) Verdoppelt
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

% 2.1.5.) Modulo
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

% 2.1.6.) Peano -> Integer
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

