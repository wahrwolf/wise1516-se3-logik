% SE3 Logikprogrammierung - Blatt 02
% Abgabe von:
% Tim Schuh		3schuh
% Vincent Dahmen	4dahmen

% Aufgabe 1

% P1 ist der Grossvater muetterlicherseits von P2
% X ist die Mutter von P2
?- vater_von(VATER, X), mutter_von(X, KIND).

% P1 und P2 sind Geschwister (von X)
% X ist der Vater von P1 und P2
?- vater_von(X, KIND1), vater_von(X, KIND2),KIND1/=KIND2.

% P2 ist der Onkel muetterlicherseits von P1) 
?- mutter_von(X,KIND), mutter_von(Y,X), mutter_von(Y,COUSIN), vater_von(COUSIN,Z),X/=P2

% P2 und P1 sind Stiefgeschwister
?- mutter_von(X,P1), vater_von(Y,P2), mutter_von(Z,P1), mutter_von(Z,P2), P1/=P2, X/=Y.

% Aufgabe 2:

% Welche Haeuser stehen in der Bahnhofsstrasse?
?- obj(X,_,bahnhofsstr,_,_).

% Welche Haueser wuren vor 1950 gebaut?
?- obj(X,_,_,_,Y), Y>1950.

% Wer besitzt Haueser die mehr als 300.000 EUR wert sind?
?- bew(_,_,_,X,Y,_),Y > 300000.

%Welche Haueser wurden mit Gewinn weiterverkauft?
?- bew(_,HAUS,_,BESITZER,PREIS1,DATUM1),bew(_,HAUS,BESITZER,_,PREIS2,DATUM2),DATUM1<DATUM2,PREIS1<PREIS2.

% Welche Haueser haben schon mehrfach den Besitzer gewechselt?
?- bew(_,HAUS,_BESITZER1,_,_,_),bew(_,HAUS,BESITZER2,_,_,_),BESITZER1\=BESITZER2.
% Anmerkung: Es muss lediglich geprueft werden ob ein Haus min 2 von verschidenen Personen verkauft wurde,
% 		aufgrund der Transitivitaet muss es dann min 2 Besitzerwechsel gehabt haben.

% Wer besitzt mehrere Hauser?
?- bew(_,HAUS1,_,BESITZER,_,_),bew(_,HAUS2,_,BESITZER,_,_),not(bew(_,HAUS1,BESITZER,_,_,_)),not(bew(_,HAUS2,BESITZER,_,_,_)),HAUS1\=HAUS2.
% Anmerkung: Ein BESITZER muss mindestens 2 versch Haueser gekauft haben, und darf keines verkauft haben.



% obj(Objektnummer, Objekttyp, Strassenname, Hausnummer, Baujahr).


	
