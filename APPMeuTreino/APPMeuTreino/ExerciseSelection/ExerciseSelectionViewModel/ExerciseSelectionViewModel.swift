//
//  ExerciseSelectionViewModel.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 22/04/23.
//

import Foundation

class ExerciseSelecionViewModel {
    private var dataWorkouts : [Exercise] = [
        Exercise(exerciseName: "Abdominal Alpinista", exerciseImage: "AbdominalAlpinista"),
        Exercise(exerciseName: "Abdominal Declinado", exerciseImage: "AbdominalDeclinado"),
        Exercise(exerciseName: "Abdominal Em Banco Declinado", exerciseImage: "AbdominalEmBancoDeclinado"),
        Exercise(exerciseName: "Abdominal Em V", exerciseImage: "AbdominalEmV"),
        Exercise(exerciseName: "Abdominal Na Bola", exerciseImage: "AbdominalNaBola")
    ]
    
    func getExercise(index: Int) -> Exercise {
        return dataWorkouts[index]
    }
    
    var arraySize: Int {
        return dataWorkouts.count
    }    
}
