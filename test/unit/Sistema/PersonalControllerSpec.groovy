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

}
