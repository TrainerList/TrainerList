package Sistema

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional
class ExercicioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Exercicio.list(params), model: [exercicioInstanceCount: Exercicio.count()]
    }

    def show(Exercicio exercicioInstance) {
        respond exercicioInstance
    }

    def create() {
        respond new Exercicio(params)
    }

    @Transactional
    def save(Exercicio exercicioInstance) {
        if (exercicioInstance == null) {
            notFound()
            return
        }

        if (exercicioInstance.hasErrors()) {
            respond exercicioInstance.errors, view: 'create'
            return
        }

        exercicioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), exercicioInstance.id])
                redirect exercicioInstance
            }
            '*' { respond exercicioInstance, [status: CREATED] }
        }
    }

    def edit(Exercicio exercicioInstance) {
        respond exercicioInstance
    }

    @Transactional
    def update(Exercicio exercicioInstance) {
        if (exercicioInstance == null) {
            notFound()
            return
        }

        if (exercicioInstance.hasErrors()) {
            respond exercicioInstance.errors, view: 'edit'
            return
        }

        exercicioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Exercicio.label', default: 'Exercicio'), exercicioInstance.id])
                redirect exercicioInstance
            }
            '*' { respond exercicioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Exercicio exercicioInstance) {

        if (exercicioInstance == null) {
            notFound()
            return
        }

        exercicioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Exercicio.label', default: 'Exercicio'), exercicioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def get(){
        if (params.id){
            Exercicio exercicio = Exercicio.get(params.id)
            render exercicio as JSON
        }else{
            def resposta = [:]
            resposta.mensagem = "ERRO"
            render resposta as JSON
        }

    }
}
