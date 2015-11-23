% Teilaufgabe 3.1
% ist_betroffen_von(Ort1,Ort2,Distanz).
ist_betroffen_von(Ort1,Ort2,Distanz) :-
        stromaufwaerts(_,Ort2,Ort1,Distanz).

	
ist_betroffen_von(Ort1,Ort2,Distanz) :-
	stromaufwaerts(_,Ort2,Ort3,Distanz1),
	ist_betroffen_von(Ort1,Ort3,Distanz2),
	Ort2 \== Ort3,
	Distanz is Distanz1 + Distanz2.

% Teilaufgabe 3.2

ist_betroffen_nach(Ort1, Ort2, Delay) :-
	stromaufwaerts(_,Ort2,Ort3,Distanz, Geschw),
	ist_betroffen_nach(Ort1, Ort3, Delay1)
	Delay2 is Distanz/Geschw,
	Delay is Delay1 + Delay2.


