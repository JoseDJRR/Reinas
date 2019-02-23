import UIKit

class GameBoard {
    var reinas = [Reina]()
    var limite: Int
    
    init(limite: Int) {
        self.limite = limite
    }

    func Posicion (atRow row: Int, col: Int) -> Bool { // Checa la posicion
        for reina in reinas {

            if reina.row == row { 
                return false
            }
            if reina.col == col { 
                return false 
            }
            if abs(reina.row-row) == abs(reina.col-col) { 
                return false 
            }
        }
        return true
    }

    func Busqueda(atRow row: Int) {

        if reinas.count < limite {

            for col in 0...limite-1 {

                if Posicion(atRow: row, col: col) {

                    let reina = Reina(row: row, col: col)
                    reinas.append(reina)
                    Busqueda(atRow: row+1)
                    if reinas.count == limite {
                        print(salida())
                    }
                    reinas.removeLast()
                }
            }
        }
    }

    struct Reina {
        var row: Int
        var col: Int
    }

    func Jugar() {
        Busqueda(atRow: 0)
    }

    func salida() -> String {

        var s = ""
        for q in reinas {
            s += "(\(q.row),\(q.col))"
        }
        return s
    }
}

let x = GameBoard(limite: 4)
x.Jugar()