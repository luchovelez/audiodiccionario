package audiodiccionario
//import grails.rest.*

//@Resource(uri='/definicion')
class Definicion {
    String palabra
    String definicion
    Diccionario diccionario
    static belongsTo = Diccionario
    String toString() {
        "${palabra}"
    }
    static constraints = {
    }
}
