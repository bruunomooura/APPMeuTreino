//
//  ExerciseSelectionViewModel.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 22/04/23.
//

import Foundation

class ExerciseSelecionViewModel {
    private var dataWorkouts : [Exercise] = [
        Exercise(exerciseName: "Abdominal Alpinista", exercisaImage: "AbdominalAlpinista"),
        Exercise(exerciseName: "Abdominal Declinado", exercisaImage: "AbdominalDeclinado"),
        Exercise(exerciseName: "Abdominal Em Banco Declinado", exercisaImage: "AbdominalEmBancoDeclinado"),
        Exercise(exerciseName: "Abdominal Em V", exercisaImage: "AbdominalEmV"),
        Exercise(exerciseName: "Abdominal Na Bola", exercisaImage: "AbdominalNaBola")
    ]
    func getExercise(index: Int) -> Exercise {
        return dataWorkouts[index]
    }
    
    var arraySize: Int {
        return dataWorkouts.count
    }
    
}
