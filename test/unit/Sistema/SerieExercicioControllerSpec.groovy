package Sistema


import grails.test.mixin.*
import spock.lang.*

@TestFor(SerieExercicioController)
@Mock([SerieExercicio, Exercicio, Treino, Aluno])
class SerieExercicioControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "US09 - criar Serie"(){
        when:
        Exercicio exercicio = new Exercicio()

        exercicio.nome = "Peito"
        exercicio.descricao = "aaaaaa"
        exercicio.video = "aaaa"
        exercicio.cardio = false
        exercicio.status = true

        exercicio.validate()

        if (!exercicio.hasErrors())
        {
            exercicio.save(flush: true)
        }

        exercicio = Exercicio.findById(1)

        Aluno aluno = new Aluno()

        aluno.nome = "carlos dias"
        aluno.dataNascimento = new Date()
        aluno.email = "carlosdias.668@hotmail.com"
        aluno.praticaAtividadeFisica = true
        aluno.fumante = false
        aluno.diabetico = false
        aluno.hipertenso = false
        aluno.observacao = "asdfghjkl"
        aluno.validate()

        if (!aluno.hasErrors()) {
            aluno.save(flush: true)
        }

        aluno = Aluno.findById(1)

        Treino treino = new Treino()

        treino.descricao = "Peitoral"
        treino.aluno = aluno
        treino.dataInicio = new Date()
        treino.dataTermino = new Date()
        treino.status = true

        if (!treino.hasErrors()) {
            treino.save(flush: true)
        }

        treino = Treino.findById(1)


        SerieExercicio serie = new SerieExercicio()

        serie.exercicio = exercicio
        serie.repeticao = 10
        serie.quantidadeRepeticao = 10
        serie.ateFalha = true
        serie.tempoIntervalo = 10
        serie.minutos = 10
        serie.status = true
        serie.treino = treino

        serie.validate()

        if(!serie.hasErrors() && serie.exercicio != null)
        {
            serie.save(flush: true)
        }

        serie = SerieExercicio.findById(1)

        then:
        serie != null
    }

    void "US10 - editar Serie"(){
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

        Aluno aluno = new Aluno()

        aluno.nome = "carlos dias"
        aluno.dataNascimento = new Date()
        aluno.email = "carlosdias.668@hotmail.com"
        aluno.praticaAtividadeFisica = true
        aluno.fumante = false
        aluno.diabetico = false
        aluno.hipertenso = false
        aluno.observacao = "asdfghjkl"
        aluno.validate()

        if (!aluno.hasErrors()) {
            aluno.save(flush: true)
        }

        aluno = Aluno.findById(1)

        Treino treino = new Treino()

        treino.descricao = "Peitoral"
        treino.aluno = aluno
        treino.dataInicio = new Date()
        treino.dataTermino = new Date()
        treino.status = true

        if (!treino.hasErrors()) {
            treino.save(flush: true)
        }

        treino = Treino.findById(1)

        SerieExercicio serie = new SerieExercicio()

        serie.exercicio = exercicio
        serie.repeticao = 10
        serie.quantidadeRepeticao = 10
        serie.ateFalha = true
        serie.tempoIntervalo = 10
        serie.minutos = 10
        serie.status = true
        serie.treino = treino

        serie.validate()

        if(!serie.hasErrors() && serie.exercicio != 0)
        {
            serie.save(flush: true)
        }

        serie = SerieExercicio.findById(1)

        serie.exercicio = exercicio
        serie.repeticao = 5
        serie.quantidadeRepeticao = 5
        serie.ateFalha = true
        serie.tempoIntervalo = 5
        serie.minutos = 5
        serie.status = true

        if(!serie.hasErrors() && serie.exercicio != 0)
        {
            controller.edit()
        }

        serie = SerieExercicio.findById(1)

        then:
        serie != null
        serie.repeticao == 5
    }

}
