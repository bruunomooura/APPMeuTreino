//
//  CreateTrainingViewModel.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 22/04/23.
//

import Foundation

class CreateTrainingViewModel {
    
    private var service: CreateTrainingService = CreateTrainingService()
    private var exerciseType = [ExerciseType]()
    
    func getExerciseType(index: Int) -> ExerciseType {
        return exerciseType[index]
    }
    
    var arraySize: Int {
        return exerciseType.count
    }
    
    public func fetchAllRequest() {
        service.getCreateTrainingDataJson { creatTrainingData, error in
            if error == nil {
                self.exerciseType = creatTrainingData?.exerciseType ?? []
            }
        }
        
    }
}

