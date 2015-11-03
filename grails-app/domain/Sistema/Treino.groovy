package Sistema

class Treino {

    String descricao
    Aluno aluno
    Date dataInicio
    Date dataTermino
    Boolean status

    static hasMany = [seriesExercicios: SerieExercicio]

    static constraints = {
        status nullable: true
    }

    def beforeInsert(){
        status = true
    }
}
