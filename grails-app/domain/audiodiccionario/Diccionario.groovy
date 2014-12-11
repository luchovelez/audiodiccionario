package audiodiccionario

class Diccionario {
    static searchable = true 
    
    String palabra
    String definicion

    static constraints = {
        definicion size: 5..100, blank: false, unique: true
        
    }
}
