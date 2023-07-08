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

class TrainingOverviewViewModel {
    
    private var fireStoreManager = FirestoreManager.shared
    private var delegate: TrainingOverviewViewModelProtocol?
    private var workoutList: [Workout] = []
    public func delegate(delegate:TrainingOverviewViewModelProtocol){
        self.delegate = delegate
    }
    
    func fetchWorkouts() {
        fireStoreManager.getUserData { result in
            switch result {
            case.success(let sucess):
                self.workoutList = sucess.workoutList
                self.delegate?.sucess()
            case.failure(let error):
                print(error)
                self.delegate?.error()
            }
        }
    }
    
    var isEmpty: Bool {
        workoutList.isEmpty
    }
    
    var numberOfRowsInSection: Int {
        workoutList.count
    }
    
    func loadCurrentWorkoutList(indexPath: IndexPath) -> Workout {
        return workoutList[indexPath.row]
    }
    
}

