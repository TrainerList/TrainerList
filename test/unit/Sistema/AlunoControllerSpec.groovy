package Sistema



import grails.test.mixin.*
import spock.lang.*

@TestFor(AlunoController)
@Mock([Aluno, Personal])

class AlunoControllerSpec extends Specification {

    void "adicionar aluno a lista"() {

        when:
        def resposta

        Personal personal = new Personal()

        personal.nome = "carlos"
        personal.dataNascimento = new Date()
        personal.email = "carlos.668@hotmail.com"
        personal.validate()
        if (!personal.hasErrors()) {
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

        if (!aluno.hasErrors()) {
            aluno.save(flush: true)
        }

        personal = Personal.findById(1)

        if (personal != null) {
            aluno = Aluno.findById(2)

            if (aluno != null) {
                personal.addToAlunos(aluno)
                personal.validate()
                personal.save(flush: true)

                if (personal.alunos.contains(aluno)) {
                    resposta = "Aluno já contem na lista"
                }
            } else {
                resposta = "ZICA"
            }
        }

        then:
        resposta == "Aluno já contem na lista"
        aluno != null
        personal != null

    }

    void "cadastrar aluno com sucesso"() {

        when:
        def result

        Aluno aluno = new Aluno()

        aluno.nome = nome
        aluno.dataNascimento = dtNasci
        aluno.email = email
        aluno.senha = senha
        aluno.praticaAtividadeFisica = praticaAtividade
        aluno.fumante = fumante
        aluno.diabetico = diabetico
        aluno.hipertenso = hipertencao
        aluno.observacao = observacao
        aluno.status = status

        aluno.validate()

        if (!aluno.hasErrors()) {
            aluno.save(flush: true)
        }

        aluno = Aluno.findById(1)

        if (aluno != null)
        {
            result = "Salvo com Sucesso"
        }


        then:
        result == "Salvo com Sucesso"
        aluno != null

        where:
        nome | dtNasci | email | senha | praticaAtividade | fumante | diabetico | hipertencao | observacao | status
        "carlos" | new Date() | "carlos.668@hotmail.com" | "12345678" | true | false | true | false | "aaaaaaa" | true
        "dias" | new Date() | "carlosDias.668@hotmail.com" | "12345678" | true | false | true | false | "bbbbbbb" | true
    }
}
