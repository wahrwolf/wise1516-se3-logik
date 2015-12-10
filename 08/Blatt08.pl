% Aufgabe2:
% Münzsysteme werden als monoton fallend sortierte Liste interpretiert.

eurocent([200,100,50,20,10,5,2,1]).

% wechselgelder(Preis, Muenzen, Ausgabe)
% Ausgabe als Liste von  Paaren im Format [[Muenze, Anzahl] [Muenze2, Anzahl2] ...]

% Ein Betrag von 0 ist immer als leere Liste darstellbar!
wechselgeld(0,[]).

 
wechselgeld(Betrag, [X|R1]):-
	eurocent(Xs), % benutze eurocent wie oben definiert
	member(X,Xs),  % unterspezifiezierte Anfrage um X an eine Münze zu binden 
	@>=(Betrag,X), % Münze X muss größer als Restbetrag sein
	B2 is Betrag-X,
	wechselgeld(B2,R1). %Rekursiver aufruf

% gebe nur sortierte Permutationen aus.
wechselgeld_clean(Betrag, Xs):-
	wechselgeld(Betrag,Xs),
	sorted(Xs).

sorted([]).
% Etwas ist dann sortiert wenn das erste Element
% das größte ist und der Rest der Liste sortiert!
sorted([H|Xs]):-
	max_member(H,[H|Xs]),
	sorted(Xs).
	
% Eine wechselgeldkonstellation ist optimal wenn
% sie von allen möglichen wechselgeldkonstellationen
% diejenige mit der kleisnten Anzahl an Münzen.
wechselgeld_opt(Betrag, R):-
	findall(Xs,wechselgeld_clean(Betrag,Xs),Z),
	max_member(R,Z). %max_member prüft als Spezialfall und gibt die Liste mit den größten Elemten aus.

% Aufgabe 1.4:
% Stichpunkte warum unser Prädikat weiterhin funktioniert:
% 	-mithilfe von member wird dynamisch in der Liste geguckt (also auch mit 40)
% 	- das Prädikat aus 3 findet immer noch optmale ergebnisse, da es sich um eine syntaktische und nicht semanteische Suche handelt.


 
% wechselgeld_limit(Betrag, Bestand, ?R)

% Aufgabe 1.5
wechselgeld_limit(Betrag, Bestand, BestandNeu, R):-
	wechselgeld_clean(Betrag,R),
	subset(R, Bestand),
	subtract(Bestand, R, BestandNeu).

% Aufgabe 1 Bonus
geldsumme([],0).
geldsumme([H|Xs], R):-
	geldsumme(Xs, R1),
	R is R1 + H.
	

automat(Betrag, InGeld, OutGeld):- 
	sorted(InGeld),
	geldsumme(InGeld,Xs),
	@=<(Betrag, Xs),
	Restbetrag is Xs - Betrag ,
	wechselgeld_opt(Restbetrag, OutGeld).
