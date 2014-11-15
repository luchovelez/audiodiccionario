package audiodiccionario


import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DiccionarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index(Integer max) {
       params.max = Math.min(max ?: 10, 100)
        respond Diccionario.list(params), model:[diccionarioInstanceCount: Diccionario.count()]
       // params.max = Math.min(params.max ? params.int('max') : 5, 100)      
       // [diccionarioInstanceList: diccionarioList, diccionarioInstanceTotal: diccionarioList.totalCount]
    }
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 5, 100)
 
        def diccionarioList = Diccionario.createCriteria().list (params) {
            if ( params.query ) {
                ilike("palabra", "%${params.query}%")
            }
        }
 
        [diccionarioInstanceList: diccionarioList, diccionarioInstanceTotal: diccionarioList.totalCount]
    }
    
    def searchableService //inject the service (make sure the name is correct)
    
// @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def search = {
    def query = params.q
    if(query){
        def srchResults = searchableService.search(query)
        render(view: "list",
               model: [diccionarioInstanceList: srchResults.results,
                     diccionarioInstanceTotal:srchResults.total])
    }else{
        redirect(action: "list")
    }
}
    
    
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
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
