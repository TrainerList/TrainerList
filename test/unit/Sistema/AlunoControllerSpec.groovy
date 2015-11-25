package Sistema



import grails.test.mixin.*
import spock.lang.*

@TestFor(AlunoController)
@Mock(Aluno)
class AlunoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Adicionar Aluno a Lista"() {
        when:

        Personal personal = Personal.findById(1)
        Aluno aluno = Aluno.findById(5)
        if (!personal.alunos.contains(aluno)) {
            personal.addToAlunos(aluno)

            personal.validate()

            personal.save(flush: true)
        }

        then:
        personal.hasErrors() == false

    }
}
