package Sistema


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClasseExercicioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClasseExercicio.list(params), model: [classeExercicioInstanceCount: ClasseExercicio.count()]
    }

    def show(ClasseExercicio classeExercicioInstance) {
        respond classeExercicioInstance
    }

    def create() {
        respond new ClasseExercicio(params)
    }

    @Transactional
    def save(ClasseExercicio classeExercicioInstance) {
        if (classeExercicioInstance == null) {
            notFound()
            return
        }

        if (classeExercicioInstance.hasErrors()) {
            respond classeExercicioInstance.errors, view: 'create'
            return
        }

        classeExercicioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'classeExercicio.label', default: 'ClasseExercicio'), classeExercicioInstance.id])
                redirect classeExercicioInstance
            }
            '*' { respond classeExercicioInstance, [status: CREATED] }
        }
    }

    def edit(ClasseExercicio classeExercicioInstance) {
        respond classeExercicioInstance
    }

    @Transactional
    def update(ClasseExercicio classeExercicioInstance) {
        if (classeExercicioInstance == null) {
            notFound()
            return
        }

        if (classeExercicioInstance.hasErrors()) {
            respond classeExercicioInstance.errors, view: 'edit'
            return
        }

        classeExercicioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClasseExercicio.label', default: 'ClasseExercicio'), classeExercicioInstance.id])
                redirect classeExercicioInstance
            }
            '*' { respond classeExercicioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClasseExercicio classeExercicioInstance) {

        if (classeExercicioInstance == null) {
            notFound()
            return
        }

        classeExercicioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClasseExercicio.label', default: 'ClasseExercicio'), classeExercicioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'classeExercicio.label', default: 'ClasseExercicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
