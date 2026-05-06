import wollok.game.*
import randomizer.*
import pepita.*
object cartel {
  var property text = ""
  method position() = game.center()

}

class Muro {
    var property position = game.origin()
    
    method image() = "muro.png"
    method serChocadoPor(alguien) {
        alguien.retroceder()
	}
}

object nido{
  var property position = randomizer.position()
  method image() = "nido.png"

	method serChocadoPor(alguien) {
		pepita.text("GANÉ")
    game.removeVisual(self)
    game.onTick(800, "pepitaGravity", { game.stop() })
    
	}
}


