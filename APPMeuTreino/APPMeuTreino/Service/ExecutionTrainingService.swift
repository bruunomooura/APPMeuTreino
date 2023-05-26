//
//  ExecutionTrainingService.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 26/05/23.
//

import UIKit

class ExecutionTrainingService {
    
    func getExecutionTrainingDataJson(completion: @escaping (ExecutionTrainingData?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: "ExecutionTrainingData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let executionTrainingData: ExecutionTrainingData = try JSONDecoder().decode(ExecutionTrainingData.self, from: data)
                completion(executionTrainingData, nil)
            } catch  {
                completion(nil, error)
            }
        }
    }
}
