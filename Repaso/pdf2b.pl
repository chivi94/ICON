/** En este ejemplo calcularemos el número combinatorio de m sobre n.
 * Reglas:
 * - factorial(N,Resultado); Caso base -> N es 1.
 * - m_sobre_n(M,N,R).
 * */

factorial(1,1).
factorial(N,Resultado):- N > 1,
                         N2 is N-1,
                         factorial(N2,R),
                         Resultado is N*R.               
m_sobre_n(M,N,R):- factorial(M,T1),
                   T2 is M - N,
                   factorial(T2, T3),
                   factorial(N, T4),
                   R is T1 / (T3 * T4).  