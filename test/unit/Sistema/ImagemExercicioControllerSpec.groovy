package Sistema



import grails.test.mixin.*
import spock.lang.*

@TestFor(ImagemExercicioController)
@Mock(ImagemExercicio)
class ImagemExercicioControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }


}
