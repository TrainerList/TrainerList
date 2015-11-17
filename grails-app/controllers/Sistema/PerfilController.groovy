package Sistema

import grails.converters.JSON

class PerfilController {

    def logar(){
        def resposta = [:]

        if (session["userId"] == null){
            String senha = params.senha

            Perfil perfil = Perfil.findBySenhaAndEmail(senha.encodeAsSHA256(), params.email)

            if (perfil != null){
                if (perfil.status == true){

                    def userId = session["userId"]

                    session["userId"] = perfil.id

                    if (perfil.class == Personal){
                        resposta["ok"] = true
                        resposta["url"] = "/TrainerList/personal/areaPersonal"
                        render resposta as JSON
                    } else if(perfil.class == Aluno){
                        resposta["ok"] = true
                        resposta["url"] = "/TrainerList/aluno/areaAluno"
                        render resposta as JSON
                    }
                }else if (perfil.status == false){
                    resposta["ok"] = false
                    resposta["msg"] = "Usuário inativo"
                    render resposta as JSON
                } else {
                    resposta["ok"] = false
                    resposta["msg"] = "e-mail/senha invalido!"
                    render resposta as JSON
                }
            }else{
                resposta["ok"] = false
                resposta["msg"] = "e-mail/senha invalido!!!"
                render resposta as JSON
            }
        }else{
            Perfil perfil = Perfil.findById(session["userId"])

            if (perfil.class == Personal){
                resposta["ok"] = true
                resposta["url"] = "/TrainerList/personal/areaPersonal"
                render resposta as JSON
            } else if(perfil.class == Aluno){
                resposta["ok"] = true
                resposta["url"] = "/TrainerList/aluno/areaAluno"
                render resposta as JSON
            }
        }
    }

    def logoff(){
        session["userId"] = null

        redirect(action: "index", model:[mensagem:""])
    }

    def index() {
        session["userId"] = null

        render(view: "logar", model:[mensagem:""])
    }
}
