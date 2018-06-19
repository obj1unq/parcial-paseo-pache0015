class Familia{
	var ninios = #{}
	
	method puedeSalirDePaseo(){
		return ninios.all({ninio => ninio.estaListoParaPaseo()})
	}
	method prendasInfaltables(){
		return ninios.map({ninio => ninio.prendaDeMayorCalidad()})
	}
	method niniosChiquitos(){
		return ninios.filter({ninio => ninio.edad() < 4}) // Repite condición de ninio pequenio.
	}
	method salirDePaseo(){
		// Falta chequear precondicion.
		ninios.usarPrendas()
	}
	method aniadirNinio(_ninio){
		ninios.add(_ninio)
	}
}