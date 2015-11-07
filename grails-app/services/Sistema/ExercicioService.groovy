package Sistema

import grails.transaction.Transactional

@Transactional
class ExercicioService {

    def serviceMethod() {

    }

    def isCardio(int exercicioId){
        Sistema.Exercicio exercicio = Sistema.Exercicio.findById(exercicioId)

        if (exercicio != null) {
            return exercicio.cardio
        } else {
            return false
        }
    }

}
