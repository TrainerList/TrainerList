package Sistema

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class TreinoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static Aluno aluno
    static Treino newTreino
    static Boolean editar = false
    static def seriesRemover = []

    def listarTreino() {
        if ((aluno == null || aluno.id != params.id) && (params.id != null)) {
            aluno = Aluno.findById(params.id)
        }

        if (aluno != null) {
            aluno.treinos = Treino.findAllByAlunoAndStatus(aluno, true)
        }

        render(view: "listar",model: [treinos: aluno.treinos,TipoUser:session["userTipo"]])
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

        if (params.tempoIntervalo == ""){
            serieExercicio.tempoIntervalo = 0
        }else{
            serieExercicio.tempoIntervalo = params.int("tempoIntervalo")
        }

        if (params.repeticao == ""){
            serieExercicio.repeticao = 0
        }else{
            serieExercicio.repeticao = params.int("repeticao")
        }

        if (params.quantidadeRepeticao == ""){
            serieExercicio.quantidadeRepeticao = 0
        }else{
            serieExercicio.quantidadeRepeticao = params.int("quantidadeRepeticao")
        }

        if (params.minutos == ""){
            serieExercicio.minutos = 0
        }else{
            serieExercicio.minutos = params.int("minutos")
        }

        if (params.tempoIntervalo == ""){
            serieExercicio.tempoIntervalo = 0
        }else{
            serieExercicio.tempoIntervalo = params.int("tempoIntervalo")
        }

        serieExercicio.status = true
        serieExercicio.exercicio = exerc
        serieExercicio.treino = newTreino

        newTreino.addToSeriesExercicios(serieExercicio)

        if (editar == true){
            render(view: "edit", model: [treinoInstance:newTreino])
        } else {
            render(view: "create", model: [treinoInstance:newTreino])
        }
    }

    def removerSerieExercicio(Treino treinoInstance){
        if (treinoInstance != null) {
            for (int i =0; i < treinoInstance.seriesExercicios.size(); i++) {
                if (treinoInstance.seriesExercicios[i].id == params.int("serieID")){
                    treinoInstance.removeFromSeriesExercicios(treinoInstance.seriesExercicios[i])

                    seriesRemover.add(params.int("serieID"))

                    break;
                }
            }
        }

        if (treinoInstance == null) {
            render(view: "create", model: [treinoInstance: treinoInstance])
        }else{
            render(view: "edit", model: [treinoInstance: treinoInstance])
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
        respond treinoInstance, model:[TipoUser:session["userTipo"]]
    }

    def create() {
        editar = false

        seriesRemover = []

        newTreino = new Treino()

        render(view: "create", model: [treinoInstance:newTreino])
    }

    @Transactional
    def save(Treino treinoInstance) {
        def resposta = [:]

        if (newTreino.seriesExercicios != null) {
            if (newTreino.seriesExercicios.size() > 0) {
                newTreino.aluno = aluno
                newTreino.descricao = treinoInstance.descricao
                newTreino.dataInicio = treinoInstance.dataInicio
                newTreino.dataTermino = treinoInstance.dataTermino

                aluno.addToTreinos(newTreino)

                newTreino.validate()

                if (!newTreino.hasErrors()) {
                    resposta["ok"] = true
                    resposta["url"] = "/TrainerList/treino/listarTreino"

                    newTreino.save(flash: true)
                }
            } else {
                resposta["ok"] = false
                resposta["msg"] = "Nenhum exercício informado!"
            }
        } else {
            resposta["ok"] = false
            resposta["msg"] = "Nenhum exercício informado!"
        }

        render resposta as JSON
    }

    def edit(Treino treinoInstance) {
        editar = true

        seriesRemover = []

        treinoInstance.seriesExercicios = Treino.findById(treinoInstance.id).seriesExercicios

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

        if (seriesRemover != null){
            for (int i = 0; i < seriesRemover.size(); i++){
                for (int j = (treinoInstance.seriesExercicios.size()-1); j >= 0; j--){
                    if (treinoInstance.seriesExercicios[j].id == seriesRemover[i]){
                        treinoInstance.seriesExercicios.remove(treinoInstance.seriesExercicios[j])

                        SerieExercicio serieExercicio = SerieExercicio.findById(seriesRemover[i])

                        serieExercicio.delete();
                    }
                }
            }
        }

        treinoInstance.save(flush:true)

        redirect(action: "listarTreino")
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
