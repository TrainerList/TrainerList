package Sistema


import grails.test.mixin.*
import spock.lang.*

@TestFor(PersonalController)
@Mock(Personal)
class PersonalControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Cadastrar com Sucesso"() {

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
            resposta = "Salvo com Sucesso"
        }

        then:
        resposta == "Salvo com Sucesso"

        where:
        nome | dtNasci | email | senha
        "carlos" | new Date() | "carlos.668@hotmail.com" | "12345678"
        "dias" | new Date() | "carlosDias.668@hotmail.com" | "12345678"
    }

}
