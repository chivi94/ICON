/**
 * Tenemos un árbol que representa el ensamblaje de una bicicleta. Las piezas 
 * básicas son las hojas de dicho árbol, que conforman el resto de elementos.
 * 
 * */
basica(eje).
basica(plato).
basica(pedales).
basica(cadena).
basica(llanta).
basica(radios).
basica(manillar).
basica(sillin).
basica(piniones).

ensamblaje(rueda_delantera,[llanta,radios,eje]).
ensamblaje(traccion,[eje,plato,pedales,cadena]).
ensamblaje(cuadro,[manillar,sillin,traccion]).
ensamblaje(rueda_trasera,[llanta,radios,eje,piniones]).
ensamblaje(bicicleta,[rueda_delantera,traccion,cuadro,rueda_trasera]).

pieza_basica([R|_],R):-basica(R).
pieza_basica([_|E],R):-pieza_basica(E,R).
pieza_basica([E|_],R):-ensamblaje(E,L),pieza_basica(L,R).
pieza_basica([_|E],R):-ensamblaje(E,L),pieza_basica(L,R).


piezas_de(X, Result):-
    ensamblaje(X, L),
    pieza_basica(L, Result).