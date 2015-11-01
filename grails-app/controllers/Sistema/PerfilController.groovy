package Sistema

import grails.converters.JSON

class PerfilController {

    def logar(){
        def resposta = [:]

        String senha = params.senha

        Perfil perfil = Perfil.findBySenhaAndEmail(senha.encodeAsSHA256(), params.email)

        if (perfil != null){
            if (perfil.class == Personal){
                redirect(controller: "personal",action: "areaPersonal", params: [id: perfil.id])
            } else if(perfil.class == Aluno){
                redirect(controller: "aluno", action: "areaAluno", params: [id: perfil.id])
            }
        } else {
            resposta["mensagem"] = "ERRO"

            render resposta as JSON
        }
    }

    def index() {

    }
}
