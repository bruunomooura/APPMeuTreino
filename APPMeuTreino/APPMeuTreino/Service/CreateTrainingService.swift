//
//  CreateTrainingService.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 26/05/23.
//

import UIKit

class CreateTrainingService {
    func getCreateTrainingDataJson(completion: @escaping (CreateTrainingData?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: JSONFile.createTrainingData.rawValue, withExtension: JSONFile.json.rawValue) {
            do {
                let data = try Data(contentsOf: url)
                let createTrainingData: CreateTrainingData = try JSONDecoder().decode(CreateTrainingData.self, from: data)
                completion(createTrainingData, nil)
            } catch  {
                completion(nil, error)
            }
        }

    }

}
