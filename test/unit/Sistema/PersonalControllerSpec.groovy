package Sistema


import grails.test.mixin.*
import spock.lang.*

@TestFor(PersonalController)
@Mock([Personal, AvaliacaoFisica, Aluno])
class PersonalControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "US02 - cadastrar personal com sucesso"() {

        when:
        def resposta

        Personal personal = new Personal()

        personal.nome = nome
        personal.dataNascimento = dtNasci
        personal.email = email
        personal.senha = senha

        personal.validate()


        if (!personal.hasErrors())
        {
            personal.save(flush: true)
        }

        personal = Personal.findById(1)

        if (personal != null)
        {
            resposta = "Salvo com Sucesso"
        }


        then:
        resposta == "Salvo com Sucesso"
        personal != null

        where:
        nome | dtNasci | email | senha
        "carlos" | new Date() | "carlos.668@hotmail.com" | "12345678"
        "dias" | new Date() | "carlosDias.668@hotmail.com" | "12345678"
    }

    void "US18 - Personal Visualizar Avaliacao fisica ativa dos alunos"(){

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

        resposta = AvaliacaoFisica.findAllByPersonalAndStatus(personal, true)

        then:
        resposta != null
        avaliacao != null
        personal != null
        aluno != null

        where:
        nome | dtNasci | email | senha | praticaAtividade | fumante | diabetico | hipertencao | observacao | status
        "carlos" | new Date() | "carlos.668@hotmail.com" | "12345678" | true | false | true | false | "aaaaaaa" | true

    }

    void "US32 - Personal Visualizar Avaliacao fisica ativa de um aluno"(){

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

        resposta = AvaliacaoFisica.findAllByAlunoAndStatus(aluno, true)

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
