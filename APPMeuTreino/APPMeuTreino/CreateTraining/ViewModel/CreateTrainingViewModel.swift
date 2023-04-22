//
//  CreateTrainingViewModel.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 22/04/23.
//

import Foundation
class CreateTrainingViewModel {
    private var exercises: [Exercise] = [Exercise(exercisaImage: "Abdominais"), Exercise(exercisaImage: "Aeróbico"), Exercise(exercisaImage: "Bíceps"), Exercise(exercisaImage: "CostasOmbros"), Exercise(exercisaImage: "MembrosInferiores"), Exercise(exercisaImage: "Peito"), Exercise(exercisaImage: "Triceps")]
    
    
    func getExercise(index: Int) -> Exercise {
        return exercises[index]
    }
    
    var arraySize: Int {
        return exercises.count
    }
}

