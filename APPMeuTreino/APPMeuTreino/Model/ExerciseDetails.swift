//
//  ExerciseDetails.swift
//  APPMeuTreino
//
//  Created by Barbara Silva on 2023-07-08.
//

import Foundation

struct ExerciseDetails: Decodable {
    var name: String
    var videoURL: URL
    var description: String
    var exerciseVideoURL: String
}
