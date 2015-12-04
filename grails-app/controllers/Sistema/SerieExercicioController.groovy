package Sistema


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class SerieExercicioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def inativar(SerieExercicio serieExercicioInstance){

        serieExercicioInstance.status = false

        serieExercicioInstance.validate()

        if (!serieExercicioInstance.hasErrors()){
            serieExercicioInstance.save(flush: true)

            redirect(action: "edit")
        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SerieExercicio.list(params), model: [serieExercicioInstanceCount: SerieExercicio.count()]
    }

    def show(SerieExercicio serieExercicioInstance) {
        respond serieExercicioInstance
    }

    def create() {
        respond new SerieExercicio(params)
    }

    @Transactional
    def save(SerieExercicio serieExercicioInstance) {
        if (serieExercicioInstance == null) {
            notFound()
            return
        }

        redirect(controller: "treino", action: "adicionarSerieExercicio", params: [tempoIntervalo:serieExercicioInstance.tempoIntervalo, repeticao:serieExercicioInstance.repeticao,
                                                                                   quantidadeRepeticao: serieExercicioInstance.quantidadeRepeticao, ateFalha:serieExercicioInstance.ateFalha,
                                                                                   exercicioId :serieExercicioInstance.exercicio.id, minutos:serieExercicioInstance.minutos])
    }

    def edit(SerieExercicio serieExercicioInstance) {
        SerieExercicio serieExercicio = SerieExercicio.findById(params.id )

        respond serieExercicioInstance:serieExercicio
    }

    @Transactional
    def update(SerieExercicio serieExercicioInstance) {
        if (serieExercicioInstance == null) {
            notFound()
            return
        }

        if (serieExercicioInstance.hasErrors()) {
            respond serieExercicioInstance.errors, view: 'edit'
            return
        }

        serieExercicioInstance.save flush: true

        redirect(controller: "treino", action: "edit")
    }

    @Transactional
    def delete(SerieExercicio serieExercicioInstance) {

        if (serieExercicioInstance == null) {
            notFound()
            return
        }

        serieExercicioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SerieExercicio.label', default: 'SerieExercicio'), serieExercicioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'serieExercicio.label', default: 'SerieExercicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
