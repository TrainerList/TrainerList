package Sistema

class Personal extends Perfil {

    static hasMany = [alunos: Aluno]

    static constraints = {
    }

    static mapping = {
        discriminator value: "Personal";
    }

    def beforeInsert(){
        dataCadastro = new Date();
        status = true
    }
}
