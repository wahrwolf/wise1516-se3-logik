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
	
