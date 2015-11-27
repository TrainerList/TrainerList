package Sistema



import grails.test.mixin.*
import spock.lang.*

@TestFor(AlunoController)
@Mock([Aluno, Personal])

class AlunoControllerSpec extends Specification {

    void "Adicionar Aluno a Lista"() {

        when:
        def resposta

        Personal personal = new Personal()

        personal.nome = "carlos"
        personal.dataNascimento = new Date()
        personal.email = "carlos.668@hotmail.com"
        personal.validate()
        if (!personal.hasErrors())
        {
            personal.save(flush: true)
        }

        Aluno aluno = new Aluno()

        aluno.nome = "carlos dias"
        aluno.dataNascimento = new Date()
        aluno.email = "carlosdias.668@hotmail.com"
        aluno.praticaAtividadeFisica = true
        aluno.fumante = false
        aluno.diabetico = false
        aluno.hipertenso = false
        aluno.observacao = "asdfghjkl"
        aluno.validate()

        if (!aluno.hasErrors())
        {
            aluno.save(flush: true)
        }

        personal = Personal.findById(1)

        if (personal != null){
            aluno = Aluno.findById(2)

            if (aluno != null){
                personal.addToAlunos(aluno)
                personal.validate()
                personal.save(flush: true)

                if (personal.alunos.contains(aluno)) {
                    resposta = "Aluno já contem na lista"
                }
            }
            else
            {
                resposta = "ZICA"
            }
        }

        then:
        resposta == "Aluno já contem na lista"
        aluno != null
        personal != null

    }
}
