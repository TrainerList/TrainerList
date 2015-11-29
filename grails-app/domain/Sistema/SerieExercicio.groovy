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
        minutos nullable: true
        ateFalha nullable: true
        quantidadeRepeticao nullable: true
        repeticao nullable: true
    }

    static mapping = {
        minutos defaultValue: 0
        ateFalha defaultValue: 0
        quantidadeRepeticao defaultValue: 0
        repeticao defaultValue: 0
    }

    def beforeInsert(){
        status = true

        if (minutos == null){
            minutos = 0
        }

        if (ateFalha == null){
            ateFalha = 0
        }

        if (quantidadeRepeticao == null){
            quantidadeRepeticao = 0
        }

        if (repeticao == null){
            repeticao = 0
        }
    }
}
