//
//  ExecutionTrainingVielModel.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 22/04/23.
//

import Foundation

class ExecutionTrainingVielModel{
    
    private var exerciseList: [Exercise] = [Exercise(exerciseName: "Abdominal Em V", exerciseImage: "Exercicio1"),
                                            Exercise(exerciseName: "Cabo De Guerra - Ondas Alternadas", exerciseImage: "Exercicio2"),
                                            Exercise(exerciseName: "Biceps Alternado Com Máquina", exerciseImage: "Exercicio3"),
                                            Exercise(exerciseName: "Agachamento Com Halteres", exerciseImage: "Exercicio4"),
                                            Exercise(exerciseName: "Desenvolvimento Com Halteres", exerciseImage: "Exercicio5")]
    
    func getExercise(index: Int) -> Exercise {
        return exerciseList[index]
    }
    
    var arraySize: Int {
        return exerciseList.count
    }
}
