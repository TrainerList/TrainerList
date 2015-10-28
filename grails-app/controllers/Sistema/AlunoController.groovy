package Sistema

class AlunoController {

    def index(Integer personalId) {
        def alunos = []
        int alunosCount

        personalId = 1

        alunos = Personal.findById(personalId).alunos

        alunosCount = 0//alunos.Count()

        render(view:"listar",model:[alunos: alunos,alunosCount: alunosCount]);
    }
}
