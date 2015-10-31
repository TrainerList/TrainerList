package Sistema

import grails.converters.JSON

class PerfilController {

    def logar(){
        def resposta = [:]

        Perfil perfil = Perfil.findBySenhaAndEmail(params.senha, params.email)

        if (perfil != null){
            if (perfil.class == Personal){
                Personal personal = Personal.findById(perfil.id)

                render(view: "areaPersonal",model: [personal: personal])
            } else if(perfil.class == Aluno){
                Aluno aluno = Aluno.findById(perfil.id)

                render(view: "/aluno/areaAluno",model: [aluno: aluno])
            }
        } else {
            resposta["mensagem"] = "ERRO"

            render resposta as JSON
        }
    }

    def index() {
        render(view: "login")
    }
}
