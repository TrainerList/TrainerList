package Sistema

import grails.converters.JSON

class PerfilController {

    def logar(){
        def resposta = [:]

        String senha = params.senha

        Perfil perfil = Perfil.findBySenhaAndEmail(senha.encodeAsSHA256(), params.email)

        if (perfil != null){
            if (perfil.status == true){
                if (perfil.class == Personal){
                    redirect(controller: "personal",action: "areaPersonal", params: [id: perfil.id])
                } else if(perfil.class == Aluno){
                    redirect(controller: "aluno", action: "areaAluno", params: [id: perfil.id])
                }
            }else if (perfil.status == false){
                render(view: "index", model: [mensagem: "Usuario inativo!", email:params.email])
            }
        } else {
            render(view: "index", model: [mensagem: "e-mail/senha invalido!", email:params.email])
        }
    }

    def index() {
        render(action: "index", model:[mensagem:""])
    }
}
