package Sistema

class AlunoController {

    def index(Integer personalId) {
        def alunos = []
        Integer alunosCount

        personalId = 1

        alunos = Personal.findById(personalId).alunos

        alunosCount = alunos.Count()

        render(view:"listar",model:[alunos: alunos,alunosCount: alunosCount]);
    }
}
