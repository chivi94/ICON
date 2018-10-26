/**En este primer ejercicio haremos una base de conocimiento sobre la casa de los Austrias.
 * Hechos:
 * reina(rey_austria,anio_comienzo_reinado,anio_fin_reinado).
 * Reglas:
 * rey_casa_austria(Rey,Anio) -> Para saber que Rey estaba en el trono en el Anio dado.
 * Preguntas:
 * rey_casa_austria(carlos_i,1520), true
 * rey_casa_austria(X,1520), X = carlos_i.
 * 
 * */
reina(carlos_i, 1516, 1556).
reina(felipe_ii, 1556, 1598).
reina(felipe_iii, 1598, 1621).
reina(felipe_iv, 1621, 1665).
reina(carlos_ii, 1665, 1700).

rey_casa_austria(Rey,Anio):-reina(Rey,Comienzo,Fin),
                            Anio >= Comienzo,
                            Anio =< Fin.