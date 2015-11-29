package Sistema

class AvaliacaoFisica {

    Aluno aluno
    Personal personal
    Date data
    Double pressao
    Double peso
    Double altura
    Double bicepsDireito
    Double bicepsEsquerdo
    Double antebracoDireito
    Double antebracoEsquerdo
    Double peito
    Double abdomen
    Double cintura
    Double quadril
    Double coxaDireita
    Double coxaEsquerda
    Double panturilhaDireita
    Double panturilhaEsquerda
    Double gorduraCorporal
    Double massaMuscular

    Boolean status

    static constraints = {
        peso nullable: true
        bicepsDireito nullable: true
        bicepsEsquerdo nullable: true
        antebracoDireito nullable: true
        antebracoEsquerdo nullable: true
        peito nullable: true
        abdomen nullable: true
        cintura nullable: true
        quadril nullable: true
        coxaDireita nullable: true
        coxaEsquerda nullable: true
        panturilhaDireita nullable: true
        panturilhaEsquerda nullable: true
        gorduraCorporal nullable: true
        massaMuscular nullable: true
    }
}
