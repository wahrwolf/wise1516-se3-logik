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
% 	3.1
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
% 	3.2
%
% 	3.3
ist_erreichbar(Ort1, Ort2):- stromaufwaerts(Ort1, Ort2) ; stromaufwaerts(Ort2, Ort1).
% Sofern die Datenbasis wie oben beschrieben wohldefiniert ist (also antisymetrisch und transitiv),
% es also keine Kreise gibt gibt es keine Mehrfachresultate und die Suche terminiert stets.
%  	3.4
ueber_kanal_verbunden_mit(Ort1, Ort2, Distanz).
% Der Strom fließt von Ort1 -> Ort2 über einen Kanal
%
% Jeder Fluss verhält sich wie ein Baum (hat keine Kreise, wächst von der Wurzel weg, hat eine endliche Teife ...)
% aber sobald Kanäle eingeführt werden können Kreise entstehen.
% Somit gilt keine Antisymetrie mehr und ist_erreichbar und ist_betroffen terminiern nicht mehr zwingend.
% Eine Möglichkeit dies zu vermeiden, w#re die Benutzung von Hilfsunktion die Flüsse zusammen fasst.
% dann könnte ist_betroffen erst auf einem Fluss und anschließend in angrenzenden Flüssen suchen.
