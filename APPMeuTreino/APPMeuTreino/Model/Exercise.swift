//
//  Exercise.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 22/04/23.
//

import Foundation

struct Exercise: Codable {
    var exerciseName: String
    var category: String
    var details: String
    var exerciseImage: String?
    var exerciseVideoURL: String?
}
