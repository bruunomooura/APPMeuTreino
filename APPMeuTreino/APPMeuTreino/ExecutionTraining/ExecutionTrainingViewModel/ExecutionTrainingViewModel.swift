//
//  ExecutionTrainingViewModel.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 22/04/23.
//

import Foundation

class ExecutionTrainingViewModel{
    
    private var service: ExecutionTrainingService = ExecutionTrainingService()
    private var exerciseList = [Exercise]()
    
    func getExercise(index: Int) -> Exercise {
        return exerciseList[index]
    }
    
    var arraySize: Int {
        return exerciseList.count
    }
    
    public func fetchAllRequest() {
        service.getExecutionTrainingDataJson { executionTrainingData, error in
            if error == nil {
                self.exerciseList = executionTrainingData?.exercise ?? []
            }
        }
        
    }
}
