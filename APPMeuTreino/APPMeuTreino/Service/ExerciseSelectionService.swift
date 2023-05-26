//
//  ExerciseSelectionService.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 26/05/23.
//

import UIKit

class ExerciseSelectionService {
    
    func getExerciseSelectionDataJson(completion: @escaping (ExerciseSelectionData?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: "ExerciseSelectionData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let exerciseSelectionData: ExerciseSelectionData = try JSONDecoder().decode(ExerciseSelectionData.self, from: data)
                completion(exerciseSelectionData, nil)
            } catch  {
                completion(nil, error)
            }
        }
    }
}


