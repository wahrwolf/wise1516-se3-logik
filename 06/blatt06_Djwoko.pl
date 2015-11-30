% Se3 LP - Blatt 6 -
%
% Yani Djallal 6527225
% Hauke Koepcke 6677995
% Vincent Dahmen 6689845
%
% Uebungsgruppenleiter: Timo Baumann
% Gr.05 Mittwoch 12-14 Uhr
%
% Aufgabe 1.1
%
% zins(+Anlagebetrag, +Zinsfaktor, +Anlagedauer, ?Endguthaben)
zins(Anlagebetrag,_,0,Anlagebetrag).
zins(Anlagebetrag,Zinsfaktor,Anlagedauer,Endguthaben) :-
	Anlage2 is ((Zinsfaktor + 1) * Anlagebetrag),
	Dauer2 is Anlagedauer - 1,
	zins(Anlage2,Zinsfaktor,Dauer2,Endguthaben).
% Testeingaben:
% zins(1000,0.05,2,X).
% X = 1102.5.
%
% zins(1000,0.05,3,1157.625).
% true.

% Aufgabe 1.2
%
% zins_ohne_zinseszins
%(+Anlagebetrag, +Zinsfaktor, +Anlagedauer, ?Endguthaben)
zins_ohne_zinseszins(Anlagebetrag,_,0,Anlagebetrag).
zins_ohne_zinseszins(Anlagebetrag,Zinsfaktor,Anlagedauer,Endguthaben) :-
	Endguthaben is (Zinsfaktor * Anlagebetrag * Anlagedauer)
	+ Anlagebetrag.
% Testeingaben:
% zins_ohne_zinseszins(1000,0.05,3,X).
% X = 1150.0.
%
% zins_ohne_zinseszins(1000,0.05,50,X).
% X = 3500.0.
%
% Die nicht rekursive Lösung aus Teilaufgabe 1.2 berechnet nur den Zins,
% nach X Jahren. Nicht wie die aus Teilaufgabe 1.1 rekursive Lösung,
% diese nimmt den Zins immer wieder ins folge Jahr und setzt ihn als
% neue Anlage, d.h. es werden die Zinsen der Zinsen mit berechnet
% (Zinseszins).

% Aufgabe 1.3
%
% Die erste Aufgabe hatten wir bereits Endrekursiv gelöst.
% Bei einer Alternativen Lösungsanfrage kommt es zum float_
% overflow.

% Aufgabe 1.4
%
% neuzins
% (+Anlagebetrag, +Bonuszins, +StartZins +Anlagedauer, ?Endguthaben)
% Für Bonuszins muss das doppelte Eingeben wird
% (Bsp.: Bonuszins von 2% = 0.04)
% Startzins: 0.01
neuzins(Anlagebetrag,_,_,0,Anlagebetrag).
neuzins(Anlagebetrag,Bonuszins,Zins,Anlagedauer,Endguthaben) :-
	AktBonus is (Bonuszins / 2),
	Zins2 is Zins + AktBonus,
	Anlage2 is (1 + Zins2) * Anlagebetrag,
	Dauer2 is Anlagedauer - 1,
	neuzins(Anlage2,AktBonus,Zins2,Dauer2,Endguthaben).
% Testeingaben:
% neuzins(1000,0.04,0.01,4,X).
% X = 1172.5756900000001.
%
% neuzins(1000,0.04,0.01,2,1071.2).
% true.
%
% Die Endrekursive Lösung erscheint uns übersichtlicher, da wir
% so sehen, dass man einen Zwischenspeicher genutzt hat. Dies ist
% unserer Meinung nach leichter nachzuvolziehen. Anstatt wenn wir
% das nach der Rekursion die im Speicher hinterlegten Eingaben alle
% zusammen rechnen. Der Benutzer sieht so nicht, wo die Werte herkommen.

% Aufgabe 1.5
%
% Das Modell mit dem festen Zinssatz eignet sich für 1 - 4 Jahre.
% Ab dem 4. Jahr eignet sich der variable Zinssatz mehr, da
% man dort mehr Zinsen / Jahr macht.

% Aufgabe 2.1
%
% piaufg1(+Schritte,-Ergebnis)
% Dient lediglich der normalen Ausgabe von pi und nicht,
% wie in der Formel angegeben (pi viertel).
piaufg1(Schritte,Ergebnis) :- pi1(Schritte,Resultat),
	Ergebnis is Resultat * 4.

% pi1(+Schritte,-Ergebnis)
pi1(1,0).
pi1(Schritte,Resultat) :-
	NeuSchritte is Schritte - 1,
	Schritt is ((-1)^(NeuSchritte + 1)) / (2 * NeuSchritte - 1),
	pi1(NeuSchritte,Resultat2),
	Resultat is Schritt + Resultat2.
% Testeingaben: piaufg1
% piaufg1(10, Ergebnis).
% Ergebnis = 3.2523659347188767.
%
% piaufg1(1000, Ergebnis).
% Ergebnis = 3.142593654340044.

% Aufgabe 2.1.2
%
% FEHLT

% Aufgabe 2.2
%
% FEHLT

% Aufgabe 2.3
%
% piaufg3(+Schritte,-Ergebnis)
% Dient lediglich der normalen Ausgabe von pi und nicht,
% wie in der Formel angegeben ( pi halbe )
piaufg3(Schritte, Ergebnis) :- pi3(Schritte, Resultat),
	Ergebnis is Resultat * 2.

% pi3(+Schritte, -Resultat)
pi3(1,1).
pi3(Schritte,Resultat) :-
	Schritte > 0,
	NeuSchritte is Schritte - 1,
	Schritt is ((2 * NeuSchritte) / (2 * NeuSchritte - 1)) *
		   ((2 * NeuSchritte) / (2 * NeuSchritte + 1)),
	pi3(NeuSchritte, Resultat2),
	Resultat is Schritt * Resultat2.
% Testeingaben: piaufg3
%
% piaufg3(10, Ergebnis).
% Ergebnis = 3.060034547126889.
%
% piaufg3(1000, Ergebnis).
% Ergebnis = 3.140806960828445.

% Konvergenzverhalten: Die Berechnung aus Teilaufgabe 1 konvergiert von
% 4 ausgehend (mit 2 Rekursionschritten) gegen pi und die Berechnung aus
% Teilaufgabe 3 konvergiert von 2 ausgehend gegen pi. Beide Formlen
% konvergieren recht gleich schnell gegen pi (siehe 1000 Schritt
% Eingabe in Testeingaben).

% Aufgabe 3.1
%
%
