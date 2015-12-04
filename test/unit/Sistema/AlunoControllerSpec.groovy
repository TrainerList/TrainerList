package Sistema



import grails.test.mixin.*
import spock.lang.*

@TestFor(AlunoController)
@Mock([Aluno, Personal, AvaliacaoFisica])

class AlunoControllerSpec extends Specification {

    void "US07 - adicionar aluno a lista"() {

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

    void "US04 - cadastrar aluno com sucesso"() {

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

    void "US34 - Listar Todas as Avaliacao fisica ativa do Aluno"(){

        when:
        def resposta
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
        aluno.status = true

        aluno.validate()

        if (!aluno.hasErrors()) {
            aluno.save(flush: true)
        }

        Personal personal = new Personal()

        personal.nome = "carlos"
        personal.dataNascimento = new Date()
        personal.email = "carlos.6668@hotmail.com"

        personal.validate()

        if (!personal.hasErrors()) {
            personal.save(flush: true)
        }

        AvaliacaoFisica avaliacao = new AvaliacaoFisica()

        aluno = Aluno.findById(1)
        personal = Personal.findById(2)

        avaliacao.aluno = aluno
        avaliacao.personal = personal
        avaliacao.data = new Date()
        avaliacao.pressao = 10.0
        avaliacao.peso = 67
        avaliacao.altura = 1.68
        avaliacao.bicepsDireito = 15
        avaliacao.bicepsEsquerdo = 15
        avaliacao.antebracoDireito = 15
        avaliacao.antebracoEsquerdo = 15
        avaliacao.peito = 15
        avaliacao.abdomen = 15
        avaliacao.cintura = 15
        avaliacao.quadril = 15
        avaliacao.coxaDireita = 15
        avaliacao.coxaEsquerda = 15
        avaliacao.panturilhaDireita = 15
        avaliacao.panturilhaEsquerda = 15
        avaliacao.gorduraCorporal = 15
        avaliacao.massaMuscular = 15
        avaliacao.status = true

        avaliacao.validate()

        if (!avaliacao.hasErrors() && avaliacao.peso > 0 && avaliacao.altura > 0) {
            avaliacao.save(flush: true)
        }

        avaliacao = AvaliacaoFisica.findById(1)


        if (aluno != null) {
            resposta = AvaliacaoFisica.findAllByAlunoAndStatus(aluno, true)

        }

        then:
        resposta != null
        avaliacao != null
        personal != null
        aluno != null

        where:
        nome | dtNasci | email | senha | praticaAtividade | fumante | diabetico | hipertencao | observacao | status
        "carlos" | new Date() | "carlos.668@hotmail.com" | "12345678" | true | false | true | false | "aaaaaaa" | true

    }

    void "US16 - Listar Avaliacao fisica ativa do Aluno"(){

        when:
        def resposta
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
        aluno.status = true

        aluno.validate()

        if (!aluno.hasErrors()) {
            aluno.save(flush: true)
        }

        Personal personal = new Personal()

        personal.nome = "carlos"
        personal.dataNascimento = new Date()
        personal.email = "carlos.6668@hotmail.com"

        personal.validate()

        if (!personal.hasErrors()) {
            personal.save(flush: true)
        }

        AvaliacaoFisica avaliacao = new AvaliacaoFisica()

        aluno = Aluno.findById(1)
        personal = Personal.findById(2)

        avaliacao.aluno = aluno
        avaliacao.personal = personal
        avaliacao.data = new Date()
        avaliacao.pressao = 10.0
        avaliacao.peso = 67
        avaliacao.altura = 1.68
        avaliacao.bicepsDireito = 15
        avaliacao.bicepsEsquerdo = 15
        avaliacao.antebracoDireito = 15
        avaliacao.antebracoEsquerdo = 15
        avaliacao.peito = 15
        avaliacao.abdomen = 15
        avaliacao.cintura = 15
        avaliacao.quadril = 15
        avaliacao.coxaDireita = 15
        avaliacao.coxaEsquerda = 15
        avaliacao.panturilhaDireita = 15
        avaliacao.panturilhaEsquerda = 15
        avaliacao.gorduraCorporal = 15
        avaliacao.massaMuscular = 15
        avaliacao.status = true

        avaliacao.validate()

        if (!avaliacao.hasErrors() && avaliacao.peso > 0 && avaliacao.altura > 0) {
            avaliacao.save(flush: true)
        }

        avaliacao = AvaliacaoFisica.findById(1)


        if (aluno != null) {
            resposta = AvaliacaoFisica.findByAlunoAndStatus(aluno, true)

        }

        then:
        resposta != null
        avaliacao != null
        personal != null
        aluno != null

        where:
        nome | dtNasci | email | senha | praticaAtividade | fumante | diabetico | hipertencao | observacao | status
        "carlos" | new Date() | "carlos.668@hotmail.com" | "12345678" | true | false | true | false | "aaaaaaa" | true

    }




}
