package Sistema


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AvaliacaoFisicaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static Aluno aluno

    def listarAvaliacoesFisicas() {
        if ((aluno == null || aluno.id != params.id) && (params.id != null)) {
            aluno = Aluno.findById(params.id)
        }

        if (aluno != null) {
            aluno.avalicoesFisicas = AvaliacaoFisica.findAllByAlunoAndStatus(aluno, true)
        }

        render(view: "listar",model: [avaliacoesFisicas: aluno.avalicoesFisicas,TipoUser:session["userTipo"]])
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AvaliacaoFisica.list(params), model: [avaliacaoFisicaInstanceCount: AvaliacaoFisica.count()]
    }

    def show(AvaliacaoFisica avaliacaoFisicaInstance) {


        respond avaliacaoFisicaInstance, model:[TipoUser:session["userTipo"]]
    }

    def create() {
        respond new AvaliacaoFisica(params)
    }

    @Transactional
    def save(AvaliacaoFisica avaliacaoFisicaInstance) {
        if (avaliacaoFisicaInstance == null) {
            notFound()
            return
        }

        Personal personal = Personal.findById(session["userId"])

        avaliacaoFisicaInstance.status = true
        avaliacaoFisicaInstance.aluno = aluno
        avaliacaoFisicaInstance.personal = personal

        if (avaliacaoFisicaInstance.abdomen == null){
            avaliacaoFisicaInstance.abdomen = 0
        }

        if (avaliacaoFisicaInstance.pressao == null){
            avaliacaoFisicaInstance.pressao = 0
        }

        if (avaliacaoFisicaInstance.bicepsDireito == null){
            avaliacaoFisicaInstance.bicepsDireito = 0
        }

        if (avaliacaoFisicaInstance.bicepsEsquerdo == null){
            avaliacaoFisicaInstance.bicepsEsquerdo = 0
        }

        if (avaliacaoFisicaInstance.antebracoDireito == null){
            avaliacaoFisicaInstance.antebracoDireito = 0
        }

        if (avaliacaoFisicaInstance.antebracoEsquerdo == null){
            avaliacaoFisicaInstance.antebracoEsquerdo = 0
        }

        if (avaliacaoFisicaInstance.peito == null){
            avaliacaoFisicaInstance.peito = 0
        }

        if (avaliacaoFisicaInstance.abdomen == null){
            avaliacaoFisicaInstance.abdomen = 0
        }

        if (avaliacaoFisicaInstance.cintura == null){
            avaliacaoFisicaInstance.cintura = 0
        }

        if (avaliacaoFisicaInstance.quadril == null){
            avaliacaoFisicaInstance.quadril = 0
        }

        if (avaliacaoFisicaInstance.coxaDireita == null){
            avaliacaoFisicaInstance.coxaDireita = 0
        }

        if (avaliacaoFisicaInstance.coxaEsquerda == null){
            avaliacaoFisicaInstance.coxaEsquerda = 0
        }

        if (avaliacaoFisicaInstance.panturilhaDireita == null){
            avaliacaoFisicaInstance.panturilhaDireita = 0
        }

        if (avaliacaoFisicaInstance.panturilhaEsquerda == null){
            avaliacaoFisicaInstance.panturilhaEsquerda = 0
        }

        if (avaliacaoFisicaInstance.gorduraCorporal == null){
            avaliacaoFisicaInstance.gorduraCorporal = 0
        }

        if (avaliacaoFisicaInstance.massaMuscular == null){
            avaliacaoFisicaInstance.massaMuscular = 0
        }

        avaliacaoFisicaInstance.validate()
        avaliacaoFisicaInstance.save(flush: true)

        redirect(action: "listarAvaliacoesFisicas")
    }

    def edit(AvaliacaoFisica avaliacaoFisicaInstance) {
        respond avaliacaoFisicaInstance
    }

    @Transactional
    def update(AvaliacaoFisica avaliacaoFisicaInstance) {
        if (avaliacaoFisicaInstance == null) {
            notFound()
            return
        }

        if (avaliacaoFisicaInstance.hasErrors()) {
            respond avaliacaoFisicaInstance.errors, view: 'edit'
            return
        }

        avaliacaoFisicaInstance.save(flush: true)

        redirect(action: "listarAvaliacoesFisicas")
    }

    @Transactional
    def delete(AvaliacaoFisica avaliacaoFisicaInstance) {

        if (avaliacaoFisicaInstance == null) {
            notFound()
            return
        }

        avaliacaoFisicaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AvaliacaoFisica.label', default: 'AvaliacaoFisica'), avaliacaoFisicaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'avaliacaoFisica.label', default: 'AvaliacaoFisica'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
