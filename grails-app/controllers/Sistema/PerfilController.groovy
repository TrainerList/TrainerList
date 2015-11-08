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
                        //redirect(controller: "personal",action: "areaPersonal", params: [id: perfil.id])
                    } else if(perfil.class == Aluno){
                        resposta["ok"] = true
                        resposta["url"] = "/TrainerList/aluno/areaAluno"
                        render resposta as JSON
                        //redirect(controller: "aluno", action: "areaAluno", params: [id: perfil.id])
                    }
                }else if (perfil.status == false){
                    //resposta["status"]="Usuario inativo!";
                    //render resposta as JSON;
                    resposta["ok"] = false
                    resposta["msg"] = "Usuário inativo"
                    render resposta as JSON
                    //render(view: "logar", model:[mensage:"Usuario inativo!",email:params.email])
                } else {
                    //resposta["status"]="e-mail/senha invalido!";
                    //render resposta as JSON;
                    resposta["ok"] = false
                    resposta["msg"] = "e-mail/senha invalido!"
                    render resposta as JSON
                    //render(view: "logar", model:[mensage:"e-mail/senha invalido!",email:params.email])
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
                //redirect(controller: "personal",action: "areaPersonal", params: [id: perfil.id])
            } else if(perfil.class == Aluno){
                resposta["ok"] = true
                resposta["url"] = "/TrainerList/aluno/areaAluno"
                render resposta as JSON
                //redirect(controller: "aluno", action: "areaAluno", params: [id: perfil.id])
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
