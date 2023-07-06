//
//  CreateTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import Foundation

class CreateTrainingViewModel {
    
    private var service: GetExerciseService = GetExerciseService()
    private var exercises: [Exercise] = []
    private var filteredExercises: [Exercise] = []
    private var searchText: String = ""
    
    func fetchAllRequest(completion: @escaping () -> Void) {
        service.getExercise { [weak self] result, error in
            guard let self else { return }
            if let result = result {
                self.updateExercises(data: result)
                completion()
            } else {
                // Handle error
                completion()
            }
        }
    }
    
    func filterExercises(with searchText: String) {
        self.searchText = searchText
        if searchText.isEmpty {
            filteredExercises = exercises
        } else {
            filteredExercises = exercises.filter { $0.exerciseName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    private func updateExercises(data: ExerciseData) {
        exercises = data.map { exerciseDatum in
            let exerciseImage = exerciseDatum.exerciseName?.replacingOccurrences(of: " ", with: "_")
            return Exercise(id: exerciseDatum.id ?? 0,
                            exerciseName: exerciseDatum.exerciseName ?? "",
                            category: exerciseDatum.category?.rawValue ?? "",
                            details: exerciseDatum.details ?? "",
                            exerciseImage: exerciseImage,
                            exerciseVideoURL: exerciseDatum.youtubeURL)
        }
        self.exercises = exercises.filter({$0.exerciseVideoURL != nil})
        self.filteredExercises = self.exercises
    }
    
    var numberOfRowsInSection: Int {
        return filteredExercises.count
    }
    
    func loadCurrentExercice(indexPath: IndexPath) -> Exercise {
        return filteredExercises[indexPath.row]
    }
    
    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 0
    }

    func selectedItem(indexPath: IndexPath) {
        let id = filteredExercises[indexPath.row].id
        for (index,value) in exercises.enumerated() {
            if value.id == id {
                exercises[index].isSelected = !exercises[index].isSelected
            }
        }
        filterExercises(with: searchText)
    }
    
    var numberOfSelectedItem: Int {
        return exercises.filter({$0.isSelected == true}).count
    }
    
}
