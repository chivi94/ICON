/**
 * En este ejemplo obtendremos un autómata de Moore.
 * - Base de conocimiento:
 * mueve(Inicio,Movimiento,Fin) -> Dado un estado Inicio, se mueve a un estado Fin mediante un Movimiento.
 * - Reglas:
 * transita(Inicio,ListaMovimientos,Resultado).
 * */

mueve(q0,a,q2).
mueve(q0,b,q1).
mueve(q1,a,q0).
mueve(q1,b,q3).
mueve(q2,a,q2).
mueve(q2,b,q3).
mueve(q3,a,q0).
mueve(q3,b,q3).

transita(X,[],X):-!.
transita(Inicio,[A|B],Fin):-mueve(Inicio,A,Temporal),transita(Temporal,B,Fin).