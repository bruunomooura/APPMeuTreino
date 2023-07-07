//
//  User.swift
//  APPMeuTreino
//
//  Created by Barbara Silva on 2023-07-06.
//

import Foundation

struct User: Codable {
    var userID: String
    var name: String
    var workoutList: [Exercise]
}
