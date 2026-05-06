import wollok.game.*
import pepita.*

object silvestre {
  var property position = game.at(5, 1)
  
  method image() = "silvestre.png"
  
  method silvestreMovement() {
    game.onTick(10, "silvestreMovement", { self.iaMovement() })
  }
  
  method iaMovement() {
    position = game.at(
      if ((pepita.position().x() > 3) && (pepita.position().x() < (game.width() - 1)))
        pepita.position().x()
      else position.x(),
      position.y()
    )
  }
  
  method serChocadoPor(alguien) {
    pepita.muerta()
  }
}