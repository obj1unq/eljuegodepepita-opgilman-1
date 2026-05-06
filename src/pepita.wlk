import src.randomizer.*
import wollok.game.*
import extras.*

object pepita {
	var property position = game.at(3, 3)
	var property positionAnterior = game.at(3, 3)
	var energia = 1000
	var property image = "pepita.png"
	var property text = ""
	
	method comer(comida) {
		energia += comida.energiaQueOtorga()
	}
	
	method volar(kms) {
		energia = (energia - 10) - kms
	}
	
	method energia() = energia
	
	method cansar() {
		energia -= 9
		console.println("Energia: " + energia)
	}
	
	method movementPlayer() {
		keyboard.w().onPressDo({ self.intentarMoverse(position.up(1)) })
		keyboard.s().onPressDo({ self.intentarMoverse(position.down(1)) })
		keyboard.a().onPressDo({ self.intentarMoverse(position.left(1)) })
		keyboard.d().onPressDo({ self.intentarMoverse(position.right(1)) })
	}
	
	method intentarMoverse(nuevaPosicion) {
		if (self.energia() > 0) {
			self.irA(nuevaPosicion)
			self.cansar()
		} else {
			self.muerta()
		}
	}
	
	method irA(nuevaPosicion) {
		positionAnterior = position
		position = nuevaPosicion
	}
	
	method muerta() {
		image = "pepita-gris.png"
		self.text("PERDI")
		game.onTick(800, "pepitaGravity", { game.stop() })
	}
	
	method retroceder() {
		position = positionAnterior
	}

	method gravityAction() {
		game.onTick(800, "pepitaGravity", { self.irA(self.position().down(1)) })
	}
}