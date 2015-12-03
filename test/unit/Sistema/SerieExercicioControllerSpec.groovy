package Sistema


import grails.test.mixin.*
import spock.lang.*

@TestFor(SerieExercicioController)
@Mock([SerieExercicio, Exercicio])
class SerieExercicioControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "criar Serie"(){
        when:
        Exercicio exercicio = new Exercicio()

        exercicio.nome = "Peito"
        exercicio.descricao = "aaaaaa"
        exercicio.video = "aaaa"
        exercicio.cardio = true
        exercicio.status = true

        exercicio.validate()

        if (!exercicio.hasErrors())
        {
            exercicio.save(flush: true)
        }

        exercicio = Exercicio.findById(1)

        SerieExercicio serie = new SerieExercicio()

        serie.exercicio = exercicio
        serie.repeticao = 10
        serie.quantidadeRepeticao = 10
        serie.ateFalha = true
        serie.tempoIntervalo = 10
        serie.minutos = 10
        serie.status = true

        serie.validate()

        if(!serie.hasErrors() && serie.exercicio != 0)
        {
            serie.save(flush: true)
        }

        serie = SerieExercicio.findById(1)

        then:
        serie != null
    }

}
