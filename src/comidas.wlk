class Comida {
	method peso()
	method esAptoVegetariano()	
	method valoracion()
	method esAbundante() { return self.peso() > 250 }
}

class Provoleta inherits Comida {
	var property peso
	var property tieneEspecias
	
	override method esAptoVegetariano() {
		return not tieneEspecias
	}
	
	method esEspecial() {
		return self.esAbundante() || tieneEspecias
	}
	override method valoracion() {
		return if(self.esEspecial()) {120} else {80}
	}
}  ////pan: objetos!

class HamburguesaCarne inherits Comida {
	var property pan
	override method peso() { return 250 }
	override method esAptoVegetariano() { return false }
	override method valoracion() { return 60 + pan.valoracion() }
}

object panIndustrial {
	method valoracion() { return 0 }
}
object panCasero {
	method valoracion() { return 20 }
}
object panMasaMadre {
	method valoracion() { return 45 }
}

class HamburguesaVegetariana inherits HamburguesaCarne {
	var property legumbre = ""
	override method esAptoVegetariano() { return true }
	override method valoracion() {
		return super() + (2 * legumbre.size()).min(17)
	}	
}

class Parrillada inherits Comida {
	var property cortesIncluidos = []
	
	override method peso() {
		return cortesIncluidos.sum({corte=> corte.peso()})
	}
	override method esAptoVegetariano() { return false }
	
	method calidadMaximaDeCortes() { return cortesIncluidos.max({corte=> corte.calidad()}).calidad() }
	
	override method valoracion() {
		return ((15 * self.calidadMaximaDeCortes()) - cortesIncluidos.size()).max(0)
	}
}

class Corte {
	var property nombre
	var property calidad
	var property peso
}














