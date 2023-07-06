//
//  CreateTrainingViewModel.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 22/04/23.
//

import Foundation

//protocol CreateTrainingViewModelProtocol: AnyObject {
//    func success()
//    func error()
//}

class CreateTrainingViewModel {
    
    private var service: CreateTrainingService = CreateTrainingService()
    private var exercise = [Exercise]()
    
//    private var testService: GetExerciseService = GetExerciseService()
//    private var exerciseData: ExerciseData?
    
//    private weak var delegate: CreateTrainingViewModelProtocol?
//
//    public func delegate(delegate: CreateTrainingViewModelProtocol?) {
//        self.delegate = delegate
//    }
    
    
    

//    public func fetch() {
//        self.testService.getExercise { result, failure in
//            if let result = result {
//                self.exerciseData = result
//                self.delegate?.success()
//            } else {
//                self.delegate?.error()
//            }
//        }
//
//    }
    
    func getExerciseType(index: Int) -> Exercise {
        return exercise[index]
    }
    
    var arraySize: Int {
        return exercise.count
    }
    
    public func fetchAllRequest() {
        service.getCreateTrainingDataJson { creatTrainingData, error in
            if error == nil {
                self.exercise = creatTrainingData?.exercise ?? []
            }
        }
        
    }
}

