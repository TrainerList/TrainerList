package Sistema


import grails.test.mixin.*
import spock.lang.*

@TestFor(SerieExercicioController)
@Mock(SerieExercicio)
class SerieExercicioControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

}
