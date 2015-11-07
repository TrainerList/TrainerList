package Sistema



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ImagemExercicioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ImagemExercicio.list(params), model:[imagemExercicioInstanceCount: ImagemExercicio.count()]
    }

    def show(ImagemExercicio imagemExercicioInstance) {
        respond imagemExercicioInstance
    }

    def create() {
        respond new ImagemExercicio(params)
    }

    @Transactional
    def save(ImagemExercicio imagemExercicioInstance) {
        if (imagemExercicioInstance == null) {
            notFound()
            return
        }

        if (imagemExercicioInstance.hasErrors()) {
            respond imagemExercicioInstance.errors, view:'create'
            return
        }

        imagemExercicioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'imagemExercicio.label', default: 'ImagemExercicio'), imagemExercicioInstance.id])
                redirect imagemExercicioInstance
            }
            '*' { respond imagemExercicioInstance, [status: CREATED] }
        }
    }

    def edit(ImagemExercicio imagemExercicioInstance) {
        respond imagemExercicioInstance
    }

    @Transactional
    def update(ImagemExercicio imagemExercicioInstance) {
        if (imagemExercicioInstance == null) {
            notFound()
            return
        }

        if (imagemExercicioInstance.hasErrors()) {
            respond imagemExercicioInstance.errors, view:'edit'
            return
        }

        imagemExercicioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ImagemExercicio.label', default: 'ImagemExercicio'), imagemExercicioInstance.id])
                redirect imagemExercicioInstance
            }
            '*'{ respond imagemExercicioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ImagemExercicio imagemExercicioInstance) {

        if (imagemExercicioInstance == null) {
            notFound()
            return
        }

        imagemExercicioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ImagemExercicio.label', default: 'ImagemExercicio'), imagemExercicioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagemExercicio.label', default: 'ImagemExercicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
