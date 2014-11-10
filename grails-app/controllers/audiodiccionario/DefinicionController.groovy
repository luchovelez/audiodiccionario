package audiodiccionario



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DefinicionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Definicion.list(params), model:[definicionInstanceCount: Definicion.count()]
    }

    def show(Definicion definicionInstance) {
        respond definicionInstance
    }

    def create() {
        respond new Definicion(params)
    }

    @Transactional
    def save(Definicion definicionInstance) {
        if (definicionInstance == null) {
            notFound()
            return
        }

        if (definicionInstance.hasErrors()) {
            respond definicionInstance.errors, view:'create'
            return
        }

        definicionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'definicion.label', default: 'Definicion'), definicionInstance.id])
                redirect definicionInstance
            }
            '*' { respond definicionInstance, [status: CREATED] }
        }
    }

    def edit(Definicion definicionInstance) {
        respond definicionInstance
    }

    @Transactional
    def update(Definicion definicionInstance) {
        if (definicionInstance == null) {
            notFound()
            return
        }

        if (definicionInstance.hasErrors()) {
            respond definicionInstance.errors, view:'edit'
            return
        }

        definicionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Definicion.label', default: 'Definicion'), definicionInstance.id])
                redirect definicionInstance
            }
            '*'{ respond definicionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Definicion definicionInstance) {

        if (definicionInstance == null) {
            notFound()
            return
        }

        definicionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Definicion.label', default: 'Definicion'), definicionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'definicion.label', default: 'Definicion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
