package Sistema

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Perfil)
class PerfilSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Usuário Inativo"() {
        given:
        def perfilMock = mockFor(PerfilController)
        controller.VeiculoController = perfilMock.createMock()

        when:
        Perfil perfil = new Perfil()

        String senha = "123123123"

        perfil.nome = "Teste"
        perfil.email = "inativo@inativo.com"
        perfil.senha = senha.encodeAsSHA256()
        perfil.dataNascimento = new Date()
        perfil.linkAtivacao = ''

        perfil.save(flush: true)

        params.email = "inativo@inativo.com"
        params.senha = senha

        controller.logar()

        then:
        response.json.mensagem == "Usuário inativo"
    }
}
