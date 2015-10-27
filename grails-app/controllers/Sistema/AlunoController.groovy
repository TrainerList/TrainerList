package Sistema

class AlunoController {

    def index() {
        def alunos = []

        alunos = Personal.findAll()

        render(view:"listar",model:[alunos: alunos,alunosCount: alunos.count()]);
    }
}
