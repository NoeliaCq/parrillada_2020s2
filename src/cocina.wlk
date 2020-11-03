import comidas.*
import comensales.*

object cocina {
	var property comidas = []
	
	method cantPlatosVegetarianos() {
		return comidas.count({plato=> plato.esAptoVegetariano()})
	}
	method cantPlatosCarnivoros() {
		return comidas.count({plato=> not plato.esAptoVegetariano()})
	}
	/*opté por poner el valor absoluto de la diferencia para respetar el enunciado pero con el método así como está,
	si hay 10 platos vegetarianos y 5 carnivoros igual retorna false, y por logica no debería...*/
	
	method tieneBuenaOfertaVegetariana() {
		return (self.cantPlatosVegetarianos() - self.cantPlatosCarnivoros()).abs() <= 2
	}
	method platosCarnivoros() {
		return comidas.filter({plato=> not plato.esAptoVegetariano()})
	}
	method platoFuerteCarnivoro() {
		return self.platosCarnivoros().max({plato=> plato.valoracion()})
	}
	method comidasQueLeGustanA(unComensal) {
		return comidas.filter({plato=> unComensal.leAgrada(plato)})
	}

	method elegirPlatoPara(unComensal) {
		if(self.comidasQueLeGustanA(unComensal).isEmpty()) {
			self.error("No hay platos disponibles para este comensal")
		}
		else {
			const platoElegido = self.comidasQueLeGustanA(unComensal).anyOne()
			comidas.remove(platoElegido)
			unComensal.comer(platoElegido)
		}
	}
}