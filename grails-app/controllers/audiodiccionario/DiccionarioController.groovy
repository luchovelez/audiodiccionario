package audiodiccionario


import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DiccionarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Diccionario.list(params), model:[diccionarioInstanceCount: Diccionario.count()]
    }

    def show(Diccionario diccionarioInstance) {
        respond diccionarioInstance
    }
    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Diccionario(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Diccionario diccionarioInstance) {
        if (diccionarioInstance == null) {
            notFound()
            return
        }

        if (diccionarioInstance.hasErrors()) {
            respond diccionarioInstance.errors, view:'create'
            return
        }

        diccionarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'diccionario.label', default: 'Diccionario'), diccionarioInstance.id])
                redirect diccionarioInstance
            }
            '*' { respond diccionarioInstance, [status: CREATED] }
        }
    }
    @Secured(['ROLE_ADMIN'])
    def edit(Diccionario diccionarioInstance) {
        respond diccionarioInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Diccionario diccionarioInstance) {
        if (diccionarioInstance == null) {
            notFound()
            return
        }

        if (diccionarioInstance.hasErrors()) {
            respond diccionarioInstance.errors, view:'edit'
            return
        }

        diccionarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Diccionario.label', default: 'Diccionario'), diccionarioInstance.id])
                redirect diccionarioInstance
            }
            '*'{ respond diccionarioInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Diccionario diccionarioInstance) {

        if (diccionarioInstance == null) {
            notFound()
            return
        }

        diccionarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Diccionario.label', default: 'Diccionario'), diccionarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'diccionario.label', default: 'Diccionario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
