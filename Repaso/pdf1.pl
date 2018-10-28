/**Primero, metemos la base de conocimiento 
*Hechos:
*matrimonio(X,Y):X esta casado con Y, siendo Y el familiar politico.
*padre(X,Y): X es padre de Y**/
matrimonio(teodosio,dionisia).
matrimonio(jesus,elisea).
matrimonio(fermin,elena).
matrimonio(jesus_jr,pilar).
matrimonio(pepe,pepita).
matrimonio(belen,fernando).
matrimonio(chuchi,marisol).
matrimonio(jose,isabel).
padre(teodosio,fermin).
padre(teodosio,belen).
padre(teodosio,chuchi).
padre(teodosio,jose).
padre(jesus,elena).
padre(jesus,jesus_jr).
padre(jesus,pepe).
padre(fermin,ivan).
padre(jesus_jr,david).
padre(jesus_jr,cristian).
padre(pepe,juanito).
padre(pepe,fulanito).
padre(belen,noelia).
padre(chuchi,daniel).
padre(chuchi,mario).
padre(chuchi,laura).
padre(jose,jose_jr).
padre(jose,sofia).

/** Aquí vamos a definir las reglas
 * hijo(X,Y) -> X es hijo de Y. Puede ser por relacion directa o porque exista matrimonio.
 * abuelo(X,Y) -> X es abuelo de Y. Puede ser por relacion directa o porque exista matrimonio, o por parte de familiar politico.
 * papa(X,Y) -> X es papa de Y.
 * hermano(X,Y) -> X es hermano de Y. Debemos meter una comparación para no repetir elementos.
 * tio(X,Y) -> X es hermano de Y.Se han implementado reglas para un árbol de 2 ramas.
 * primo(X,Y) -> X es primo de Y.Se han implementado 2 reglas.
 * sobrino(X,Y) si tio(Y,X).
 * ascendiente(X,Y) -> X es ascendiente de Y, relación recursiva.
 * */
hijo(X,Y):-padre(Y,X).
hijo(X,Y):- padre(Z,X),matrimonio(Z,Y).

abuelo(X,Y):-padre(X,Z),padre(Z,Y).
abuelo(X,Y):-matrimonio(Z,X),abuelo(Z,Y).
abuelo(X,Y):- padre(X,Z),matrimonio(W,Z),padre(W,Y).

papa(X,Y):- padre(X,Y).
papa(X,Y):- matrimonio(Z,X),padre(Z,Y).

hermano(X,Y):- padre(Padre,X),padre(Padre,Y), X\=Y.

tio(X,Y):-hermano(X,Padre),padre(Padre,Y).
tio(X,Y):-matrimonio(Directo,X),hermano(Directo,Padre),padre(Padre,Y).

tio(X,Y):-hermano(X,Z),matrimonio(W,Z),padre(W,Y).
tio(X,Y):-matrimonio(Z1,X),hermano(Z1,Z2),matrimonio(W,Z2),padre(W,Y).

primo(X,Y):-padre(P1,X),padre(P2,Y),hermano(P1,P2).
primo(X,Y):-padre(P,X),matrimonio(P,Z),hermano(Z,J),padre(J,Y).

sobrino(X,Y):-tio(Y,X).

ascendiente(X,Y):-padre(X,Y).
ascendiente(X,Y):-padre(Z,Y),ascendiente(X,Z).
ascendiente(X,Y):-matrimonio(Z,X),ascendiente(Z,Y).

