package Sistema

class SerieExercicio {

    Exercicio exercicio
    Integer repeticao
    Integer quantidadeRepeticao
    Boolean ateFalha
    Integer tempoIntervalo
    Integer minutos
    Boolean status

    static belongsTo = [Treino]

    static constraints = {
        status nullable: true
        repeticao nullable: true
        quantidadeRepeticao nullable: true
        ateFalha nullable: true
        tempoIntervalo nullable: true
        minutos nullable: true

    }

    def beforeInsert(){
        status = true
    }
}
