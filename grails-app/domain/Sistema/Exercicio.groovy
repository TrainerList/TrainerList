package Sistema

import com.sun.org.apache.xpath.internal.operations.Bool

class Exercicio {

    String nome
    String descricao
    String video
    Boolean status

    static hasMany = [imagensExercicio: ImagemExercicio, classesExercicio : ClasseExercicio]

    static constraints = {
    }
}
