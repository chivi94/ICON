es_padre_de(teodosio,fermin).
es_padre_de(teodosio,belen).
es_padre_de(teodosio,jose).
es_padre_de(teodosio,jesus).
es_padre_de(fermin,ivan).
es_padre_de(belen,noelia).
es_padre_de(jose,josito).
es_padre_de(jose,sofia).
es_padre_de(jesus,daniel).
es_padre_de(jesus,mario).
es_padre_de(jesus,laura).

es_padre(jesusR,elena).
es_padre(jesusR,jesusR_pequenio).
es_padre(jesusR_pequenio,david).
es_padre(jesusR_pequenio,cristian).

matrimonio_con(teodosio,dionisia).
matrimonio_con(fermin,elena).
matrimonio_con(belen,fernando).
matrimonio_con(jose,isabel).
matrimonio_con(jesus,marisol).

matrimonio_con(jesusR,elisea).
matrimonio_con(jesusR_pequenio,pilar).

hijo(Hijo,Padre):-es_padre_de(Padre,Hijo).
hijo(Hijo,Padre):-matrimonio_con(Padre_,Padre),es_padre_de(Padre_,Hijo).

padre(Padre,Hijo):-es_padre_de(Padre,Hijo).
padre(Padre,Hijo):-matrimonio_con(Padre_,Padre),es_padre_de(Padre_,Hijo).

abuelo(Abuelo,Nieto):-padre(Abuelo,Padre),padre(Padre,Nieto).
nieto(Nieto,Abuelo):-abuelo(Abuelo,Nieto).

hermano(Hermano1,Hermano2):-es_padre_de(Padre,Hermano1),es_padre_de(Padre,Hermano2), Hermano1 \= Hermano2.

tio(X,Y):-hermano(X,Padre),padre(Padre,Y).
tio(X,Y):-matrimonio_con(Z,X),hermano(Z,Padre),padre(Padre,Y).

primo(X,Y):-padre(Padre,X),padre(Padre_,Y),hermano(Padre,Padre_),X \= Y.

sobrino(X,Y):-tio(Y,X).

cuniado(X,Y):-matrimonio_con(Z,X),hermano(Z,Y).

ascendiente(X,Y):-padre(X,Y).
ascendiente(X,Y):-padre(X,Z),ascendiente(Z,Y).

descendiente(X,Y):-ascendiente(Y,X).

yerno(X,Y):-matrimonio_con(Z,X),hijo(Z,Y).

suegro(X,Y):-yerno(Y,X).



