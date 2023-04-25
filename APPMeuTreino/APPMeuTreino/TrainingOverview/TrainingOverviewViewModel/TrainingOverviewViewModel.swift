//
//  TrainingOverviewViewModel.swift
//  APPMeuTreino
//
//  Created by Barbara Silva on 2023-04-25.
//

import Foundation

class TrainingOverviewViewModel{
    
    private var trainingList: [Training] = [Training(nameTraining: "TREINO 1", numberOfExercise: 5), Training(nameTraining: "TREINO 2", numberOfExercise: 6)]
    
    var arraySize: Int {
        return trainingList.count
    }
    
    func getTraining(index: Int) -> Training {
        return trainingList[index]
    }
    
    func deleteTraining(index: Int){
        trainingList.remove(at: index)
    }
    
}

