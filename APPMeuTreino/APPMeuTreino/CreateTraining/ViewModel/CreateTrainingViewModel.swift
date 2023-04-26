//
//  CreateTrainingViewModel.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 22/04/23.
//

import Foundation

class CreateTrainingViewModel {
    
    private var exerciseTypeList: [ExerciseType] = [
        ExerciseType(exerciseTypeImage: "Abdominais"),
        ExerciseType(exerciseTypeImage: "Aeróbico"),
        ExerciseType(exerciseTypeImage: "Bíceps"),
        ExerciseType(exerciseTypeImage: "CostasOmbros"),
        ExerciseType(exerciseTypeImage: "MembrosInferiores"),
        ExerciseType(exerciseTypeImage: "Peito"),
        ExerciseType(exerciseTypeImage: "Triceps")
    ]
    
    func getExerciseType(index: Int) -> ExerciseType {
        return exerciseTypeList[index]
    }
    
    var arraySize: Int {
        return exerciseTypeList.count
    }
}

