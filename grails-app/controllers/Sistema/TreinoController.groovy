package Sistema



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TreinoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static Aluno aluno

    def listarTreino() {
        if (aluno == null) {
            aluno = Aluno.findById(params.id)
        }

        if (aluno != null) {
            Treino treinos = []

            treinos = Treino.findAllByAluno(aluno)

            render(view: "listar",model: [treinos:treinos])
        }
    }

    def adicionarSerieExercicio(){
        Exercicio exerc = Exercicio.findById(params.int("exercicioId"))

        SerieExercicio serieExercicio = new SerieExercicio()

        if (params.ateFalha != "false") {
            serieExercicio.ateFalha = true
        }else{
            serieExercicio.ateFalha = false
        }

        serieExercicio.tempoIntervalo = params.int("tempoIntervalo")
        serieExercicio.repeticao = params.int("repeticao")
        serieExercicio.quantidadeRepeticao = params.int("quantidadeRepeticao")
        serieExercicio.minutos = params.int("minutos")
        serieExercicio.status = true
        serieExercicio.exercicio = exerc

        treinos.addToSeriesExercicios(serieExercicio)

        render(view: "listarTreino")
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Treino.list(params), model:[treinoInstanceCount: Treino.count()]
    }

    def show(Treino treinoInstance) {
        respond treinoInstance
    }

    def create() {
        respond new Treino(params)
    }

    @Transactional
    def save(Treino treinoInstance) {
        if (treinoInstance == null) {
            notFound()
            return
        }

        if (treinoInstance.hasErrors()) {
            respond treinoInstance.errors, view:'create'
            return
        }

        treinoInstance.aluno = aluno

        treinoInstance.save flush:true

        render(view: "listarTreino")
        /*
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'treino.label', default: 'Treino'), treinoInstance.id])
                redirect treinoInstance
            }
            '*' { respond treinoInstance, [status: CREATED] }
        }*/
    }

    def edit(Treino treinoInstance) {
        respond treinoInstance
    }

    @Transactional
    def update(Treino treinoInstance) {
        if (treinoInstance == null) {
            notFound()
            return
        }

        if (treinoInstance.hasErrors()) {
            respond treinoInstance.errors, view:'edit'
            return
        }

        treinoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Treino.label', default: 'Treino'), treinoInstance.id])
                redirect treinoInstance
            }
            '*'{ respond treinoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Treino treinoInstance) {

        if (treinoInstance == null) {
            notFound()
            return
        }

        treinoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Treino.label', default: 'Treino'), treinoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'treino.label', default: 'Treino'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
