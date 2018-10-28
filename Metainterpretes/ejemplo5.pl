/** Metainterprete con modificación del lenguaje.
 * */

%Modificacion del lenguaje base
:-op(40, xfy, &).
:-op(50, xfy, --->).

%Metainterprete con el lenguaje modificado
solve(true):-!.
solve((A & B)):-!, solve(A), solve(B).
solve(A):- !, B--->A,solve(B).
%Ejemplo de propagacion de señal.
true ---> valor(w1,1).
true ---> conectado(w3,w2).
true ---> conectado(w2,w1).
conectado(W, V) & valor(V,X) ---> valor(W,X).