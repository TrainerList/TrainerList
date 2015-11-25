package Sistema

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(PerfilController)
@Mock(Personal)
class PerfilControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Logar Ativo"() {
        given:
        def perfilMock = mockFor(PerfilController)
        perfilMock.demand.logar()
        controller.perfilMock = perfilMock.createMock()

        when:
        Personal personal = new Personal()

        String senha
        senha = "123123123"

        personal.nome = "Inativo"
        personal.dataNascimento = new Date()
        personal.email = "inativo@nativo.com"
        personal.senha = senha.encodeAsSHA256()

        personal.Validade()

        personal = personal.save(flush: true)

        params.email = "inativo@nativo.com"
        params.senha = senha;

        controller.logar()

        then:
        response.json.msg == "Usuário inativo"
    }
}
