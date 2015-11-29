package Sistema


import grails.test.mixin.*
import spock.lang.*

@TestFor(ClasseExercicioController)
@Mock(ClasseExercicio)
class ClasseExercicioControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

}
