package Sistema

class Aluno extends Perfil {

    String observacao
    Boolean praticaAtividadeFisica
    Boolean fumante
    Boolean diabetico
    Boolean hipertenso

    static hasMany = [treinos: Treino, avalicoesFisicas: AvaliacaoFisica]

    static belongsTo = [Personal]

    static constraints = {
        observacao nullable: true
    }

    static mapping = {
        discriminator value: "Aluno";
    }

    def beforeInsert (){
        dataCadastro = new Date();
        status = true
    }
}
