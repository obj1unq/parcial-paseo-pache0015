class Ninio {

	var edad = 0
	var prendas = #{}
	var talle

	method asignarTalle(_talle) {
		talle = _talle
	}

	method talle() {
		return talle
	}

	method agregarPrenda(_prenda) {
		prendas.add(_prenda)
	}

	method asignarEdad(_edad) {
		edad = _edad
	}

	method edad() {
		return edad
	}

	method estaListoParaPaseo() {
		return (self.tieneAlMenosxPrendas()) and (self.alMenos1PrendaConAbrigo3oMas()) and (self.promedioCalidadDePrendas() > 8)
	}

	method tieneAlMenosxPrendas() { // Este nombre podría mejorarse
		return prendas.size() >= 5
	}

	method alMenos1PrendaConAbrigo3oMas() {
		return prendas.any({ prenda => prenda.abrigo() >= 3 })
	}

	method promedioCalidadDePrendas() {
		var sumaDeCalidades = 0
		prendas.forEach({ prenda => sumaDeCalidades += prenda.calidad()})
		return sumaDeCalidades / prendas.size()
	}

	method prendaDeMayorCalidad() {
		return prendas.max({ prenda => prenda.calidad() })
	}

	method usarPrendas() {
		prendas.forEach({ prenda => prenda.usar()})
	}

}

class NinioProblematico inherits Ninio {

	var jugueteDeMano = null

	override method tieneAlMenosxPrendas() {
		return prendas.size() >= 4
	}

	override method estaListoParaPaseo() {
		// Mejor delegar más en el juguete.
		return super() and jugueteDeMano.edadMinima() <= self.edad() <= jugueteDeMano.edadMaxima()
	}

}

