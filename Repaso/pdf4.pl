/**
 * Calculo de la siguiente sucesion:
 * f(n)=3*f(n-1) + 2*f(n-2)
 * Calculo de la siguiente serie:
 * S(n)= sum(i=0,n,f(i)) -> Sumatorio desde i=0 hasta n de f(i).
 * */
sucesion(N,N):- N =< 1, !.

sucesion(N,R):-
        sucesion(N-1, T1),
        sucesion(N-2, T2),
        R is (3*T1) + (2*T2).

serie(N,Resultado):- N=:=0,sucesion(N,Resultado),!.
serie(N,Resultado):-serie(N-1,R2),
                    sucesion(N,R1),
                    Resultado is R1+R2.

