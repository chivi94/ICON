/**
 * Aquí definiremos unas cuantas operaciones sobre listas.
 * Reglas:
 * - longitud([X|Y], L) -> Da la longitud L de la lista dada.
 * - ultimo([X\Y], L) -> Da el último elemento L de la lista dada.
 * - sumarTodos([X|Y], R) -> Suma todos los elementos de la lista dada.
 * */
longitud([],L):- L is 0.
longitud([X|Y],L):- longitud(Y,L1), L is L1 + 1.

ultimo([X],R):- R is X.
ultimo([X|Y],R):-ultimo(Y,R).

sumarTodos([],0).
sumarTodos([H|T],S):- sumarTodos(T,S1), S is H+S1.

borrar(H, [H|T], T).

borrar(E, [H|T], [H|R]):-
    borrar(E, T, R).