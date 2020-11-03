import comidas.*
class Comensal {
	var property peso = 0
	var property comidas = []
	
	method leAgrada(unaComida)
	
	method pesoTotalDeComidas() { return comidas.sum({plato=> plato.peso()}) }
	
	method satisfecho() { return self.pesoTotalDeComidas() >= peso * 0.01 }
	
	method comer(unaComida) { comidas.add(unaComida) }	
}

class Vegetariano inherits Comensal {
	override method leAgrada(unaComida) {
		return unaComida.esAptoVegetariano() && unaComida.valoracion() > 85
	}
	
	override method satisfecho() { return super() && comidas.all({plato=> not plato.esAbundante()}) }
}

class HambrePopular inherits Comensal {
	
	override method leAgrada(unaComida) { return unaComida.esAbundante() }
	
}

class PaladarFino inherits Comensal {
	override method leAgrada(unaComida) {
		return unaComida.peso().between(150, 300) && unaComida.valoracion() > 100
	}
	override method satisfecho() { return super() && comidas.size().even() }
}