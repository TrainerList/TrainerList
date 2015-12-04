package Sistema

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(PerfilController)
@Mock([Aluno, Personal])
class PerfilControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "US01 - logar usuario ativo"() {

        when:
        def result

        Aluno aluno = new Aluno()

        String emailAluno = "carlosdias.668@hotmail.com"
        String senhaAluno = "12345678"

        aluno.nome = "carlos dias"
        aluno.dataNascimento = new Date()
        aluno.email = emailAluno
        aluno.senha = senhaAluno
        aluno.praticaAtividadeFisica = true
        aluno.fumante = false
        aluno.diabetico = false
        aluno.hipertenso = false
        aluno.observacao = "asdfghjkl"
        aluno.status = true
        aluno.validate()

        if (!aluno.hasErrors())
        {
            aluno.save(flush: true)
        }

        Perfil perfil =  Perfil.findBySenhaAndEmail(senhaAluno, emailAluno)

        if(perfil.status == true)
        {
            result = "USUARIO ATIVO E LOGADO COM SUCESSO"
        }
        else
        {
            result = "ZICA"
        }

        then:
        result == "USUARIO ATIVO E LOGADO COM SUCESSO"
    }
}
