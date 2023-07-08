//
//  GetExerciseService.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 05/07/23.
//

import Foundation
import Alamofire

protocol ExerciseServiceProtocol: GenericService {
    func getExercise( completion: @escaping completion<ExerciseData?>)
   
}

class GetExerciseService: ExerciseServiceProtocol{
    
    
    func getExercise(completion: @escaping completion<ExerciseData?>) {
        let url = "https://musclewiki.p.rapidapi.com/exercises"
        
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": "f350ec1cc3mshd0323c532002528p128790jsn21d365f8a9fa",
            "X-RapidAPI-Host": "musclewiki.p.rapidapi.com"
        ]
        
        AF.request(url, method: .get, headers: headers).validate(statusCode: 200...299).responseDecodable(of: ExerciseData.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                let error = NSError(domain: "MyApp", code: -1, userInfo: [NSLocalizedDescriptionKey: "Ocorreu um erro."])
                completion(nil, error as? Error)
            }
        }
        
    }
}
    
