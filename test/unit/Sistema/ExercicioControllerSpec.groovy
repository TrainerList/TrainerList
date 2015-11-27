package Sistema


import grails.test.mixin.*
import spock.lang.*

@TestFor(ExercicioController)
@Mock(Exercicio)
class ExercicioControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }


}
