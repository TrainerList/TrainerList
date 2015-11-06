package Sistema



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class TreinoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static Aluno aluno
    static Treino newTreino
    static Boolean editar = false

    def listarTreino() {
        if (aluno == null) {
            aluno = Aluno.findById(params.id)

            if (aluno != null) {
                aluno.treinos = Treino.findAllByAlunoAndStatus(aluno, true)
            }
        }

        render(view: "listar",model: [treinos: aluno.treinos])
    }

    def adicionarSerieExercicio(){
        if (newTreino == null){
            newTreino = new Treino()
        }

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

        newTreino.addToSeriesExercicios(serieExercicio)

        if (editar == true){
            render(view: "edit", model: [treinoInstance:newTreino])
        } else {
            render(view: "create", model: [treinoInstance:newTreino])
        }
    }

    def inativar(){
        Treino treino = Treino.findById(params.id)

        if (treino != null){

            treino.status = false

            treino.validate()

            if (!treino.hasErrors()){
                treino.save(flush: true)

                aluno.treinos = Treino.findAllByAlunoAndStatus(aluno, true)

                redirect(action: "listarTreino")// render( : "listar",model: [treinos: aluno.treinos])
            }
        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Treino.list(params), model:[treinoInstanceCount: Treino.count()]
    }

    def show(Treino treinoInstance) {
        respond treinoInstance
    }

    def create() {
        editar = false

        newTreino = new Treino()

        render(view: "create", model: [treinoInstance:newTreino])
    }

    @Transactional
    def save(Treino treinoInstance) {
        newTreino.aluno = aluno
        newTreino.descricao   = treinoInstance.descricao
        newTreino.dataInicio  = treinoInstance.dataInicio
        newTreino.dataTermino = treinoInstance.dataTermino

        aluno.addToTreinos(newTreino)

        newTreino.validate()

        if (!newTreino.hasErrors()){

            newTreino.save(flash: true)

            render(view: "listarTreino")
        }
    }

    def edit(Treino treinoInstance) {
        editar = true

        if (newTreino == null){
            newTreino = treinoInstance
        }

        respond newTreino
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
