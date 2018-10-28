/**
 * Igual que el ejemplo anterior, pero optimizando el metainterprete.
 * */

%Metainteprete vanilla.
solve(true):-!.
solve((A,B)):-!,solve(A), solve(B).
solve(A):-!,clause(A,B), solve(B).

%Ejemplo
conectado(w2, w1).
conectado(w3, w2).
valor(w1, 1).
valor(W,X):- conectado(W, V), valor(V, X).