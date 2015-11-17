package Sistema

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class AlunoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static String mensagem

    def listar(){
        def alunos = []
        String mensagemResposta

        if (params.nome == null || params.nome == ""){
            alunos = Aluno.findAllByStatus(true)
        }else {
            alunos = Aluno.findAllByNomeIlikeAndStatus(params.nome, true)
        }

        if (mensagem != ''){
            mensagemResposta = mensagem
            mensagem = ""
        }

        render(view: "listar", model: [alunos:alunos, alunosCount:alunos.size(), mensagem:mensagemResposta])
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

                        redirect(controller: "personal", action:"areaPersonal", params:[id: personal.id])
                    }
                }else{
                    mensagem = "O aluno já se encontra na lista"

                    redirect(action: "listar")
                }
            }
        }
    }

    def listarById(){
        def alunos = []

        if (params.id == null){
            alunos = Aluno.findAllByStatus(true)
        }else {
            alunos = Aluno.findById(params.id)
        }

        render(view: "listar", model: [alunos:alunos,alunosCount:0])
    }

    def pesquisar(){
        def alunos = []

        if (params.nome == ""){
            alunos = Aluno.findAllByStatus(true)
        }else{
            alunos = Aluno.findAllByNomeIlikeAndStatus(params.nome, true)
        }

        render(action: "listarById", model: [alunos:alunos, alunosCount:alunos.size()])
    }

    def areaAluno(){
        Aluno aluno = Aluno.findById(session.userId)

        Treino treinos = Treino.findAllByAluno(aluno)
        
        render(view: "areaAluno",Model:[treinos:treinos])
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Aluno.list(params), model:[alunoInstanceCount: Aluno.count()]
    }

    def show(Aluno alunoInstance) {
        respond alunoInstance
    }

    def create() {
        respond new Aluno(params)
    }

    @Transactional
    def save(Aluno alunoInstance) {
        if (alunoInstance == null) {
            notFound()
            return
        }

        if (alunoInstance.hasErrors()) {
            respond alunoInstance.errors, view:'create'
            return
        }

        alunoInstance.senha = alunoInstance.senha.encodeAsSHA256()

        alunoInstance.validate()

        alunoInstance = alunoInstance.save flush:true

        //redirect(controller: "aluno",action: "listarById", params: [id: alunoInstance.id])
        redirect(controller: "personal", action: "adicionarAlunoLista", params: [id:alunoInstance.id])

        /*
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'aluno.label', default: 'Aluno'), alunoInstance.id])
                redirect alunoInstance
            }
            '*' { respond alunoInstance, [status: CREATED] }
        }*/
    }

    def edit(Aluno alunoInstance) {
        respond alunoInstance
    }

    @Transactional
    def update(Aluno alunoInstance) {
        if (alunoInstance == null) {
            notFound()
            return
        }

        if (alunoInstance.hasErrors()) {
            respond alunoInstance.errors, view:'edit'
            return
        }

        alunoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Aluno.label', default: 'Aluno'), alunoInstance.id])
                redirect alunoInstance
            }
            '*'{ respond alunoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Aluno alunoInstance) {

        if (alunoInstance == null) {
            notFound()
            return
        }

        alunoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Aluno.label', default: 'Aluno'), alunoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluno.label', default: 'Aluno'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
