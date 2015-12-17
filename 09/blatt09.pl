%rule(Pattern,Response).
rule([P1,V,_,_,gross],['Das ist ja schoen fuer ',P2]):- pronomenFuer(P1,V,P2).

rule(['Mir',geht,es,Zustand],
     ['Warum geht es dir',Zustand,'?']).

pronomenFuer(ich,bin,dich).
pronomenFuer(du,bist,mich).
pronomenFuer(er,ist,ihn).
pronomenFuer(sie,ist,sie).
pronomenFuer(es,ist,es).
pronomenFuer(wir,sind,euch).
pronomenFuer(ihr,seid,uns).
pronomenFuer(sie,sind,sie).

chatbot(Input) :- rule(Input,Output),
                  write(Output),
		  !.

