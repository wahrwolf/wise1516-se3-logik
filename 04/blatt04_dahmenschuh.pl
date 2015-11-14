% Aufgaben Blatt 04



% Aufgabe 1
%|__|sym|refl|tran|funk|
%|a)|   |    |    | X  | 
%|b)| X |    |    | X  |
%|c)| X |    | X  | X  |
%|d)| X | X  | X  | X  |
%|e)| X | X  | X  | X  |
%|f)| X | X  | X  | X  |

% #TODO Begründung hinzufügen!

% Aufgabe 2
neueigentuemer(Eigentümer, Strasse, Hausnummer):-obj(ObjID,_,Strasse,Hausnummer,_),bew(_,ObjID,_,Eigentümer,_,Kauftag),not(bew(_,ObjID,_,_,_,Verkaufstag), Kauftag>20072131 , Kauftag<Verkaufstag.

vorbesitzer_All(ObjectID, Besitzer, Vorbesitzer):- findall(Vorbesitzer, , ).

vorbesitzer_rec(ObjectID, Besitzer, Vorbesitzer):-bew(_,ObjectID,Vorbesitzer,Besitzer_,_) ; bew(_,ObjectID, Zwischenbesitzer, Besitzer, _, _) , vorbesitzer_rec(ObjectID, Zwischenbesitzer, Vorbesitzer).

% Aufgabe 3
ist_betroffen_von(Ort1, Ort2):- stromaufwaerts(Ort2, Ort1) ; stromaufwaerts(Ort3, Ort1), ist_betroffen_von(Ort3, Ort2).
% ist_betroffen_von ist semantisch betrachtet 
% 	antisymetrisch 	- da 1 Fluss nicht in zwei Richtungen fließen kann
% 	nicht reflexiv 	- da ein Fluss nicht unbedint ein Dorf zweimal passiert (es aber kann U-Ausbuchtung)
% 	transitiv 	- Wenn a von b abhängig ist, und b von c abhängig ist, so ist auch a von c abhängig ...
%
%  Unter der Annahme dass eine Datenbasis endlich ist und die folgenden Eigenschaften Semantisch gelten,
%  terminiert die Rekursion stets da die Kombination aus Antisymetrie und Transitivität eine strikte Ordnung wiedergibt.
%
%  Wenn in der Datenbasis aber die Semantik verletzt ist (also ein Ort sowohl flussaufwärts,
%   als auch flussabwärts von einem anderen liegt) gilt aufgrund der Transitivtät eine Symetrie und damit
%   wird eine Termnierung unmöglich.
%

