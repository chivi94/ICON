/**
 * Ejemplo 1 de un metaintérprete vanilla sencillo.
 * Lectura declarativa del ejemplo:
 * - La meta vacía es cierta.
 * - La meta conjuntiva (A, B) es cierta, si A es cierta y B es
 * cierta.
 * - La meta A es cierta, si existe una clausula A:-B y B es
 * cierta.
 * Lectura operacional del ejemplo:
 * - La meta vacía está resuelta.
 * - Para resolver la meta (A,B), primero resolver la meta A y
 * después la B. (Regla de cómputo).
 * - Para resolver la meta A, buscar una claúsula cuya
 * cabeza unifique A y resolver el cuerpo usando la regla
 * de búsqueda de Prolog.
 * PARA EJECUTAR EL PROGRAMA -> solve(clausula(variables)). De esta forma se hace uso del metaintérprete
*/
%Metainteprete vanilla.
solve(true).
solve((A,B)):-solve(A), solve(B).
solve(A):-clause(A,B), solve(B).

%Ejemplo
conectado(w2, w1).
conectado(w3, w2).
valor(w1, 1).
valor(W,X):- conectado(W, V), valor(V, X).