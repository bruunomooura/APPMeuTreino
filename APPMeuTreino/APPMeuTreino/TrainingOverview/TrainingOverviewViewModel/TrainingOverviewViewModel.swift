//
//  TrainingOverviewViewModel.swift
//  APPMeuTreino
//
//  Created by Barbara Silva on 2023-04-25.
//

import Foundation
import UIKit

protocol TrainingOverviewViewModelProtocol: AnyObject{
    func sucess()
    func error()
}

class TrainingOverviewViewModel{
    
    private var trainingList: [Training] = [Training(nameTraining: "TREINO 1", numberOfExercise: 5), Training(nameTraining: "TREINO 2", numberOfExercise: 6)]
    
    private var fireStoreManager = FirestoreManager.shared
    
    private var objectList: [Exercise] = []
    
    private var delegate: TrainingOverviewViewModelProtocol?
    
    var arraySize: Int {
        return trainingList.count
    }
    
    public func delegate(delegate:TrainingOverviewViewModelProtocol){
        self.delegate = delegate
    }
    
    func getTraining(index: Int) -> Training {
        return trainingList[index]
    }
    
    func deleteTraining(index: Int){
        trainingList.remove(at: index)
    }
    
    func fetchWorkouts() {
        fireStoreManager.getObjectData(collection: "user", forObjectType: User.self) { result in
            switch result {
            case.success(let sucess):
                self.objectList = sucess.workoutList
                self.delegate?.sucess()
            case.failure(let error):
                print(error)
                self.delegate?.error()
            }
        }
    }
    
}

