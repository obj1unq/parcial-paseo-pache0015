class Prenda{
	
	var talle
	var desgaste = 0
	var abrigo 
	
//	method asignarComodidad(_comodidad){
//		comodidad = _comodidad
//	}
	method comodidad(_ninio){
		return -self.desgaste() + self.talleCoincide(_ninio)
	}
	method asignarTalle(_talle){
		talle = _talle
	}
	method talle(){
		return talle
	}
	method asignarDesgaste(_desgaste){
		desgaste = _desgaste
	}
	method desgaste(){
		return if(desgaste >=3){3} else {desgaste}
	}
	method talleCoincide(_ninio){
		return if(self.talle() == _ninio.talle()){8} else {0}
	}
	method asignarAbrigo(_valor){
		abrigo = _valor
	}
	method abrigo(){
		return abrigo
	}
	method calidad(_ninio){
		return abrigo + self.comodidad(_ninio)
	}
	method usar(){
		desgaste += 1
	}
}



class PrendaLiviana inherits Prenda{
	var valorDeAbrigoDeterminado = 1
	var valorDeDesgasteDeterminado = 0
	override method comodidad(_ninio){
		return super(_ninio) + 2
	}
	override method desgaste(){
		return valorDeDesgasteDeterminado
	}
	override method abrigo(){
		return valorDeAbrigoDeterminado
	}
	
	 method modificarDesgaste(_valor){
	 	valorDeDesgasteDeterminado = _valor
	 }
	 method modificarAbrigo(_valor){
	 	valorDeAbrigoDeterminado = _valor
	 }
}

class PrendaPesada inherits Prenda{
	var valorDeDesgasteDeterminado = 0
	
	method modificarDesgaste(_valor){
	 	valorDeDesgasteDeterminado = _valor
	 }
	override method desgaste(){
		return valorDeDesgasteDeterminado
	}
}
class PrendaPares inherits Prenda{
	var property prendaIzquierda 
	var property prendaDerecha 
	
	method asignarPrendaDerecha(_prenda){
		prendaDerecha = _prenda
	}
	method asignarPrendaIzquierda(_prenda){
		prendaIzquierda = _prenda
	}
	override method desgaste(){
		return (prendaIzquierda.desgaste() + prendaDerecha.desgaste()) /2
	}
	override method comodidad(_ninio){
		return super(_ninio) + self.comodidadSegunEdad(_ninio) 
	}
	method comodidadSegunEdad(_ninio){
		return if (_ninio.edad() < 4){-1} else {0}
	}
	method intercambiarPares(_par){
		if (self.talle() == _par.talle())
			{
				var prendaDeCambio = prendaDerecha
				prendaDerecha = _par.prendaDerecha()
				_par.asignarPrendaDerecha(prendaDeCambio)
			}
		else {self.error("No se puede realizar un intercambio entre estos pares")}
	}
	override method abrigo(){
		return prendaIzquierda.abrigo() + prendaDerecha.abrigo()
	}
	
}
class PrendaDerecha inherits Prenda{
	
	
	override method abrigo(){
		return abrigo
	}
	override method usar(){
		desgaste +=  1.20
	}
}

class PrendaIzquierda inherits Prenda{
	
	
	override method abrigo(){
		return abrigo
	}
	override method usar(){
		desgaste +=  0.80
	}
}


