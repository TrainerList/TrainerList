package Sistema


import grails.test.mixin.*
import spock.lang.*

@TestFor(AvaliacaoFisicaController)
@Mock([AvaliacaoFisica, Aluno, Personal])
class AvaliacaoFisicaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "nao cadastrar caso os campos Peso e Altura nao informado"() {

        when:
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

        then:
        personal != null
        aluno != null
        avaliacao != null

        where:
        nome | dtNasci | email | senha | praticaAtividade | fumante | diabetico | hipertencao | observacao | status
        "carlos" | new Date() | "carlos.668@hotmail.com" | "12345678" | true | false | true | false | "aaaaaaa" | true

    }

    void "Listar Avaliacao fisica ativa"(){

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
            //resposta = "OK"
        }

        then:
        //aluno.avalicoesFisicas !=  null
        resposta != null
        avaliacao != null
        personal != null
        aluno != null

        where:
        nome | dtNasci | email | senha | praticaAtividade | fumante | diabetico | hipertencao | observacao | status
        "carlos" | new Date() | "carlos.668@hotmail.com" | "12345678" | true | false | true | false | "aaaaaaa" | true

    }


}
