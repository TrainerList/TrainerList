package Sistema

class Personal extends Perfil {

    static hasMany = [alunos: Aluno]

    Personal(){
        dataCadastro = new Date();
        status = false
    }

    static constraints = {
    }

    static mapping = {
        discriminator value: "Personal";
    }
}
