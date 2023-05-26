//
//  ExerciseSelectionViewModel.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 22/04/23.
//

import Foundation

class ExerciseSelecionViewModel {
    
    private var service: ExerciseSelectionService = ExerciseSelectionService()
    private var exercise = [Exercise]()
    
    func getExercise(index: Int) -> Exercise {
        return exercise[index]
    }
    
    var arraySize: Int {
        return exercise.count
    }
    
    public func fetchAllRequest() {
        service.getExerciseSelectionDataJson { exerciseSelectionData, error in
            if error == nil {
                self.exercise = exerciseSelectionData?.exercise ?? []
            }
        }
        
    }
}
