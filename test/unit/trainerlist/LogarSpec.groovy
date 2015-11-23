package trainerlist

import Sistema.PerfilController
import Sistema.Personal
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(Personal)
@Mock(Personal)
class LogarSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Usuário Inativo"() {
        when:
        Personal personal = new Personal()

        String senha = "123123123"

        personal.nome = "Teste"
        personal.email = "inativo@inativo.com"
        personal.senha = senha
        personal.dataNascimento = new Date()
        personal.linkAtivacao = ''

        personal = personal.save(flush: true)

        then:
        personal.status == false
    }
}
