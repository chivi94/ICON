/** Metainterprete con pruebas.
 * */
builtin(A is B). builtin(A > B). builtin(A < B).
builtin(A = B). builtin(A =:= B). builtin(A =< B).
builtin(A >= B). builtin(functor(T, F, N)).
builtin(read(X)). builtin(write(X)).
solve(true,true) :- !.
solve((A, B), (ProofA, ProofB)) :-!, solve(A, ProofA),solve(B, ProofB).
solve(A, (A:-builtin)):- builtin(A), !, A.
solve(A, (A:-Proof)) :- clause(A, B), solve(B, Proof).

%Ejemplo de propagacion de señal.
conectado(w2, w1).
conectado(w3, w2).
valor(w1, 1).
valor(W,X):- conectado(W, V), valor(V, X).
