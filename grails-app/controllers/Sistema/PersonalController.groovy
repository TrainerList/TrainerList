package Sistema



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import Sistema.Aluno

@Transactional(readOnly = false)
class PersonalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def areaPersonal(){
        def alunos = []

        alunos = Personal.findById(session.userId).alunos

        if (alunos != null) {
            alunos.sort{it.nome}
        }

        render(view:"areaPersonal", model: [alunos: alunos, alunosCount: alunos.size()])
    }

    def inativarAluno(){
        Personal personal = Personal.findById(session.userId)

        if (personal != null){
            Aluno aluno = Aluno.findById(params.id)

            if (aluno != null){
                personal.removeFromAlunos(aluno)

                personal.validate()

                if (!personal.hasErrors()){
                    personal.save(flush: true)

                    redirect(action: "areaPersonal", params:[id: personal.id])
                }
            }
        }
    }

    def adicionarAlunoLista(){
        def resposta = [:]

        Personal personal = Personal.findById(session.userId)

        if (personal != null){
            Aluno aluno = Aluno.findById(params.id)

            if (aluno != null){
                //aluno.addToPersonais(personal)

                if (!personal.alunos.contains(aluno)){
                    personal.addToAlunos(aluno)

                    personal.validate()

                    if (!personal.hasErrors()){
                        personal.save(flush: true)

                        redirect(action:"areaPersonal", params:[id: personal.id])
                    }
                }else{
                    redirect(controller: "aluno", action: "listar", params:{id:"O aluno j� se encontra na lista"})
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

        String swapLink = new Date().toString() + personalInstance.email + personalInstance.dataNascimento

        personalInstance.linkAtivacao = swapLink.encodeAsSHA256()

        personalInstance = personalInstance.save(flush: true)

        swapLink = "http://localhost:8080/TrainerList/personal/confirmarCadastro/"+swapLink.encodeAsSHA256()

        //def userId = session["userId"]
        //session["userId"] = personalInstance.id
        //redirect(controller: "personal",action: "areaPersonal", params: [id: personalInstance.id])

        render(view: "confirmarCadastro", model: [emailConfirmacao: personalInstance.email, linkAtivacao:swapLink])
    }

    def confirmarCadastro(){

        if (params.id != null) {
            Personal personal = Personal.findByLinkAtivacao(params.id)

            if (personal != null) {
                personal.status = true
                personal.linkAtivacao = ""

                personal.save(flush: true)

                render(view: "cadastroConfirmado")

                //def userId = session["userId"]
                //session["userId"] = personal.id
                //redirect(controller: "personal", action: "areaPersonal", params: [id: personal.id])
            }
        }
    }

    def edit() {
        Personal personalInstance = Personal.findById(session.userId)

        if (personalInstance != null){
            respond personalInstance
        }
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

        redirect(action: "areaPersonal")
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
