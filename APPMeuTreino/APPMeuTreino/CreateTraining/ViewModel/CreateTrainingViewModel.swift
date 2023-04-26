//
//  CreateTrainingViewModel.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 22/04/23.
//

import Foundation

class CreateTrainingViewModel {
    
    private var workoutList: [Workout] = [Workout(exerciseImage: "Abdominais"), Workout(exerciseImage: "Aeróbico"), Workout(exerciseImage: "Bíceps"), Workout(exerciseImage: "CostasOmbros"), Workout(exerciseImage: "MembrosInferiores"), Workout(exerciseImage: "Peito"), Workout(exerciseImage: "Triceps")]
    
    func getWorkout(index: Int) -> Workout {
        return workoutList[index]
    }
    
    var arraySize: Int {
        return workoutList.count
    }
}

