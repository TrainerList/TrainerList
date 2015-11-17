package Sistema

import sun.security.util.Password

class Perfil {

    String nome
    Date dataNascimento
    String email
    String senha
    Date dataCadastro
    String linkAtivacao

    Boolean status

    static constraints = {
        email email:true, unique: true
        dataCadastro nullable: true
        status nullable: true
        linkAtivacao nullable: true
    }
}
