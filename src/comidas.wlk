import wollok.game.*
import randomizer.*

object manzana {
	var property position = randomizer.position()
	const base = 5
	var madurez = 1
	var property image = "manzana.png"
	
	method energiaQueOtorga() = base * madurez
	
	method madurar() {
		madurez += 1
	}
	
	method serChocadoPor(alguien) {
		self.serDevorado(alguien)
	}
	
	method serDevorado(alguien) {
		game.removeVisual(self)
		alguien.comer(self)
	}
}

object alpiste {
	var property position = randomizer.position()
	var property image = "alpiste.png"
	
	method energiaQueOtorga() = 20
	
	method serChocadoPor(alguien) {
		self.serDevorado(alguien)
	}
	
	method serDevorado(alguien) {
		game.removeVisual(self)
		alguien.comer(self)
	}
}