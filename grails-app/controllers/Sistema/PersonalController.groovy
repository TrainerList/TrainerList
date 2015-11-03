package Sistema



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import Sistema.Aluno

@Transactional(readOnly = true)
class PersonalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def teste(){
        Aluno aluno = Aluno.findById(4)
        Personal personal = Personal.findById(1)

        Exercicio exerc = Exercicio.findById(1)

        SerieExercicio serie = new SerieExercicio()

        serie.exercicio = exerc
        serie.ateFalha = false
        serie.minutos = 0
        serie.quantidadeRepeticao = 3
        serie.repeticao = 12
        serie.status = true
        serie.tempoIntervalo = 60


        Treino treino = new Treino()

        treino.addToSeriesExercicios(serie)
        treino.aluno = aluno
        treino.status = true
        treino.dataInicio = new Date()
        treino.dataTermino = new Date() + 30
        treino.descricao = "teste"

        AvaliacaoFisica avaliacaoFisica = new AvaliacaoFisica()

        avaliacaoFisica.status = true
        avaliacaoFisica.aluno = aluno
        avaliacaoFisica.personal = personal
        avaliacaoFisica.status = true
        avaliacaoFisica.data = new Date()
        avaliacaoFisica.abdomen = 10
        avaliacaoFisica.antebracoDireito = 10
        avaliacaoFisica.antebracoEsquerdo = 10
        avaliacaoFisica.bicepsDireito = 10
        avaliacaoFisica.bicepsEsquerdo = 10
        avaliacaoFisica.cintura = 10
        avaliacaoFisica.coxaDireita = 10
        avaliacaoFisica.coxaEsquerda = 10
        avaliacaoFisica.panturilhaDireita = 10
        avaliacaoFisica.panturilhaEsquerda = 10
        avaliacaoFisica.peito = 10
        avaliacaoFisica.peso = 100
        avaliacaoFisica.quadril = 10
        avaliacaoFisica.gorduraCorporal = 10
        avaliacaoFisica.massaMuscular = 10
        avaliacaoFisica.pressao = 12.8

        aluno.addToAvalicoesFisicas(avaliacaoFisica)
        aluno.addToTreinos(treino)

        personal.addToAlunos(aluno)

        personal.validate()

        personal.save(flush: true)
    }

    def areaPersonal(){
        def alunos = []

        alunos = Personal.findById(params.id).alunos

        render(view:"areaPersonal", model: [alunos: alunos, alunosCount: alunos.size()])
    }

    def adicionarAlunoLista(){
        Personal personal = Personal.findById(session.userId)

        //personal.alunos = Personal.findAllById(personal.id).alunos

        if (personal != null){
            Aluno aluno = Aluno.findById(params.id)

            if (aluno != null){
                //aluno.addToPersonais(personal)

                personal.addToAlunos(aluno)

                personal.validate()

                if (!personal.hasErrors()){
                    personal.save(flush: true)

                    render(view: "areaPersonal", params:[id: personal.id])
                }
            }
        }
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

        personalInstance.validate()

        if (personalInstance.hasErrors()) {
            respond personalInstance.errors, view:'create'
            return
        }

        personalInstance.senha = personalInstance.senha.encodeAsSHA256()

        personalInstance = personalInstance.save flush:true

        def userId = session["userId"]

        session["userId"] = personalInstance.id

        redirect(controller: "personal",action: "areaPersonal", params: [id: personalInstance.id])

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
