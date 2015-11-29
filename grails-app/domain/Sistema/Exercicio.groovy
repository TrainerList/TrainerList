package Sistema

import com.sun.org.apache.xpath.internal.operations.Bool
import sun.management.jmxremote.ConnectorBootstrap

class Exercicio {

    String nome
    String descricao
    String video
    Boolean cardio
    Boolean status

    static hasMany = [imagensExercicio: ImagemExercicio, classesExercicio : ClasseExercicio]

    static constraints = {
        descricao maxSize: 1000
    }
}
