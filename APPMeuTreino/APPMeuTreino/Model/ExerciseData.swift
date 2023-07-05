//
//  ExerciseData.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 05/07/23.
//

import Foundation

// MARK: - ExerciseDatum
struct ExerciseDatum: Codable {
    var category: Category?
    var difficulty: Difficulty?
    var force: Force?
    var grips: Grips?
    var details, exerciseName: String?
    var id: Int?
    var steps: [String]?
    var target: Target?
    var videoURL: [String]?
    var youtubeURL: String?
    var aka: String?

    enum CodingKeys: String, CodingKey {
        case category = "Category"
        case difficulty = "Difficulty"
        case force = "Force"
        case grips = "Grips"
        case details
        case exerciseName = "exercise_name"
        case id, steps, target, videoURL, youtubeURL
        case aka = "Aka"
    }
}

enum Category: String, Codable {
    case band = "Band"
    case barbell = "Barbell"
    case bodyweight = "Bodyweight"
    case cables = "Cables"
    case dumbbells = "Dumbbells"
    case kettlebells = "Kettlebells"
    case machine = "Machine"
    case medicineBall = "MedicineBall"
    case plate = "Plate"
    case stretches = "Stretches"
    case trx = "TRX"
    case yoga = "Yoga"
}

enum Difficulty: String, Codable {
    case advanced = "Advanced"
    case beginner = "Beginner"
    case intermediate = "Intermediate"
}

enum Force: String, Codable {
    case hold = "Hold"
    case pull = "Pull"
    case push = "Push"
}

enum Grips: String, Codable {
    case neutral = "Neutral"
    case neutralNone = "Neutral None"
    case none = "None"
    case overhand = "Overhand"
    case overhandMixed = "Overhand Mixed"
    case overhandNeutral = "Overhand Neutral"
    case overhandUnderhand = "Overhand Underhand"
    case overhandUnderhandMixed = "Overhand Underhand Mixed"
    case overhandUnderhandNeutral = "Overhand Underhand Neutral"
    case pinchGrip = "Pinch Grip"
    case rotating = "Rotating"
    case underhand = "Underhand"
    case underhandNeutral = "Underhand Neutral"
}

// MARK: - Target
struct Target: Codable {
    var primary, secondary, tertiary: [Ary]?

    enum CodingKeys: String, CodingKey {
        case primary = "Primary"
        case secondary = "Secondary"
        case tertiary = "Tertiary"
    }
}

enum Ary: String, Codable {
    case abdominals = "Abdominals"
    case biceps = "Biceps"
    case calves = "Calves"
    case chest = "Chest"
    case forearms = "Forearms"
    case glutes = "Glutes"
    case hamstrings = "Hamstrings"
    case lats = "Lats"
    case lowerBack = "Lower back"
    case midBack = "Mid back"
    case obliques = "Obliques"
    case quads = "Quads"
    case shoulders = "Shoulders"
    case traps = "Traps"
    case triceps = "Triceps"
}

typealias ExerciseData = [ExerciseDatum]
