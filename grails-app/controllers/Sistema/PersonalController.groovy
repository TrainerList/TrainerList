package Sistema



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import Sistema.Aluno

@Transactional(readOnly = true)
class PersonalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def areaPersonal(){
        def alunos = Personal.findById(params.id).alunos

        alunos = Aluno.list()

        //render(view:"areaPersonal", model: [alunos: alunos])
        render(view:"areaPersonal", model: [alunos: alunos, alunosCount: alunos.size()])
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Personal.list(params), model:[personalInstanceCount: Personal.count()]
    }

    def show(Personal personalInstance) {
        respond personalInstance
    }

    def create() {
        respond new Personal(params)
    }

    @Transactional
    def save(Personal personalInstance) {
        if (personalInstance == null) {
            notFound()
            return
        }

        personalInstance.senha = personalInstance.senha.encodeAsSHA256()

        personalInstance.validate()

        if (personalInstance.hasErrors()) {
            respond personalInstance.errors, view:'create'
            return
        }

        personalInstance = personalInstance.save flush:true

        render(view:"areaPersonal",params:"id: personalInstance.id")

/*        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'personal.label', default: 'Personal'), personalInstance.id])
                redirect personalInstance
            }
            '*' { respond personalInstance, [status: CREATED] }
        }
*/
    }

    def edit(Personal personalInstance) {
        respond personalInstance
    }

    @Transactional
    def update(Personal personalInstance) {
        if (personalInstance == null) {
            notFound()
            return
        }

        if (personalInstance.hasErrors()) {
            respond personalInstance.errors, view:'edit'
            return
        }

        personalInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Personal.label', default: 'Personal'), personalInstance.id])
                redirect personalInstance
            }
            '*'{ respond personalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Personal personalInstance) {

        if (personalInstance == null) {
            notFound()
            return
        }

        personalInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Personal.label', default: 'Personal'), personalInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personal.label', default: 'Personal'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
