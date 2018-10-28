/**Mismo ejemplo pero poniendo nivel de profundidad y tabulando.
 * */
solve_traza_nivel(A):- solve(A, 0).

solve(true, _):-!.
solve((A, B), Deep) :-!,
    Deep2 is Deep + 1,
    solve(A, Deep2),
    solve(B, Deep2).

solve(A, Deep):-
    clause(A,B),
    tab(Deep * 4), write(Deep), write(' '),  write(A), nl,
    solve(B, Deep).


/*
* Ejemplo
*/
conectado(w2, w1).
conectado(w3, w2).
valor(w1, 1).
valor(W,X):- conectado(W, V), valor(V, X).