% KOMMENTAR: bitte ein Kürzel mit Bezug auf Eure Namen wählen

% KOMMENTAR: bitte blatt01_kuerzel (kein Unterstrich zwischen blatt und Zahl)
% KOMMENTAR: Dateiendung .pl (nicht .txt)

% KOMMENTAR: Aufgabe 1:  4 von  4
% KOMMENTAR: Aufgabe 2:  6 von  6
% KOMMENTAR: Summe:     10 von 10

% KOMMENTAR: weitere Kommentare inline


% SE3: Logikprogrammierung - Blatt 01

% Abgabe von:
% Tim Schuh	   3schuh
% Vincent Dahmen   14dahmen


% Aufgabe 1.1

% Der Punkt im Dateinamen ist der einzige plausible Grund, dass Hochkommas verwendet
% werden muessen. Der Punkt beendet den momentanen Befehl. Dies wird durch die
% Hochkommas hier jedoch verhindert, weil der Punkt innerhalb derselbigen ist.
% KOMMENTAR: genau.


% Aufgabe 1.2

% Listing liefert ganz viel interessantes Zeug. Wir koennen erkennen,
% dass es die Praedikate mutter_von und vater_von gibt. Bei den folgenden
% beiden Aufrufen wird "listing." lediglich gefiltert.
% KOMMENTAR: genau.

% Ausgabe von "listing(mutter_von).":
% mutter_von(marie, hans).
% mutter_von(marie, helga).
% mutter_von(julia, otto).
% mutter_von(barbara, klaus).
% mutter_von(barbara, andrea).
% mutter_von(charlotte, barbara).
% mutter_von(charlotte, magdalena).

% Ausgabe von "listing(vater_von).":
% vater_von(otto, hans).
% vater_von(otto, helga).
% vater_von(gerd, otto).
% vater_von(johannes, klaus).
% vater_von(johannes, andrea).
% vater_von(walter, barbara).
% vater_von(walter, magdalena).



% Aufgabe 1.3
% assert/1 ist ein veraltetes Praedikat. Stattdessen wird assertz/1 verwendet.
% Bei beiden Prädikaten wird die neue Relation ans Ende angefuegt. Bei asserta/1
% wird die neue Relation am Anfang eingefuegt. Es ist dabei irrelevant, ob sie
% bereits vorhanden war oder nicht.
% KOMMENTAR: was passiert, wenn sie bereits vorhanden war?

consult('familie.pl').
listing(mutter_von).
assert(mutter_von(padme, leia)).   % fuegt das Paar am Ende ein. (depricated)
% KOMMENTAR: deprecated ;-)
listing(mutter_von).
assertz(mutter_von(padme, luke)).  % fuegt das Paar am Ende ein.
listing(mutter_von).
asserta(vater_von(anakin, luke)).  % fuegt das Paar am Anfang ein.
listing(vater_von).



% Aufgabe 2.1

% a) -> true
vater_von(walter, magdalena).

% b) -> false
mutter_von(julia, klaus).

% c) -> V = otto.
vater_von(V, helga).

% d) -> julia hat keine Mutter?!
mutter_von(M, julia).
% KOMMENTAR: was bedeutet das?

% e) -> K = klaus; K = andrea
vater_von(johannes, K).

% f) -> M = marie, V = otto, K = hans;
	M = marie, V = otto, K = helga;
	M = julia, V = gerd, K = otto;
	M = barbara, V = johannes, K = klaus;
	M = barbara, V = johannes, K = andrea;
	M = charlotte, V = walter, K = barbara;
	M = charlotte, V = walter, K = magdalena
mutter_von(M, K), vater_von(V, K).

% g) -> true
not(mutter_von(magdalena, K)).

% h) -> false
not(mutter_von(marie, K)).

% i) -> true
not(not(mutter_von(marie, K))).

% Aufgabe 2.2
% -> K = barbara, V = klaus; K = barbara, M = andrea
mutter_von(charlotte, K), mutter_von(K, M); mutter_von(charlotte, K), vater_von(K, V).



% Aufgabe 2.3

% [trace] [1]  ?- mutter_von(charlotte, K).
%    Call: (10) mutter_von(charlotte, _G973) ? creep
%    Exit: (10) mutter_von(charlotte, barbara) ? creep
% K = barbara ;
%    Redo: (10) mutter_von(charlotte, _G973) ? creep
%    Exit: (10) mutter_von(charlotte, magdalena) ? creep
% K = magdalena.

% Nach der ersten Loesung (K = barbara) kann man 'r' oder 'semikolon'
% druecken, damit man an der letzten Stelle weitersuchen kann. Hier
% kann man das Vier-Port-Modell (Skript S. 38) in Aktion sehen. Nach
% der ersten Loesung koennen wir bei 'redo' wieder einsteigen bis die
% Suche beendet ist.
% KOMMENTAR: Ok
