%mueve(estadoActual,entrada,pilaAntes,estadoSiguiente,pilaDespues).
mueve(q0, a, [z], q0, [a|z]).
mueve(q0, b, [z], q0, [b|z]).

mueve(q0, a, [a], q0, [a|[a|_]]).
mueve(q0, a, [b], q0, [a|b]).
mueve(q0, b, [a], q0, [b|a]).
mueve(q0, b, [b], q0, [b|b]).

mueve(q0,e,[a],q1,[a]).
mueve(q0,e,[b],q1,[b]).

mueve(q0, a, [a|H], q0, [a|[a|H]]).
mueve(q0, b, [a|H], q1, H).
mueve(q1, b, [a|H], q1, H).
mueve(q1,[],[z],qf,[z]).

transita(q1,[],z,qf,[z]):-!.
transita(Qi, [X|Y], R, Qf, T):- X \=[],
mueve(Qi, X, R, P, S), transita(P, Y, S, Qf, T).
acepta(X,Resultado) :- transita(q0,X,[z],Q,_), Q=qf,
Resultado is 1, !.