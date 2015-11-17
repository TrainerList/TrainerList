package Sistema

class Aluno extends Perfil {

    String observacao
    Boolean praticaAtividadeFisica
    Boolean fumante
    Boolean diabetico
    Boolean hipertenso

    static hasMany = [personais:Personal, treinos: Treino, avalicoesFisicas: AvaliacaoFisica]

    static belongsTo = [Personal]

    Aluno() {
        dataCadastro = new Date();
        status = true
    }

    static constraints = {
        observacao nullable: true
    }

    static mapping = {
        discriminator value: "Aluno";
    }
}
