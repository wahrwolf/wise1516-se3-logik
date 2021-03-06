

% Rekursive Definition für eine Suche
:- dynamic ist_erreichbar_von/2.
ist_erreichbar_von(DirA, DirB):- directory(DirA,_,DirB,_,_).
ist_erreichbar_von(DirA, DirB):- ist_erreichbar_von(DirB, DirA).
ist_erreichbar_von(DirA, DirB):- directory(DirA,_,DirC,_,_), ist_erreichbar_von(DirC, DirB).

ist_erreichbar_von_root(FileId):- file(FileId,Dir,_,_,_,_), ist_erreichbar_von(Dir, 0).

ist_unterverzeichnis_von(DirA, DirB):- directory(DirA,_,DirB,_,_).
ist_unterverzeichnis_von(DirA, DirB):- directory(DirC,_,DirA,_,_), ist_unterverzeichnis_von(DirB, DirC).
