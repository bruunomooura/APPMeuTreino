//
//  CreateTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import Foundation

protocol CreateTrainingViewModelProtocol: AnyObject {
    func successSave()
    func failureSave()
}

class CreateTrainingViewModel {
    
    private var service: GetExerciseService = GetExerciseService()
    private var exercises: [Exercise] = []
    private var filteredExercises: [Exercise] = []
    private var searchText: String = ""
    
    private weak var delegate: CreateTrainingViewModelProtocol?
    
    public func delegate(delegate: CreateTrainingViewModelProtocol?) {
        self.delegate = delegate
    }
    
    func fetchAllRequest(completion: @escaping () -> Void) {
        service.getExercise { [weak self] result, error in
            guard let self else { return }
            if let result = result {
                self.updateExercises(data: result)
                completion()
            } else {
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
    
    func saveWorkout() {
        FirestoreManager.shared.addWorkout(workout: Workout(name: "TREINO 1", exerciseList: listSelectExercise)) { result in
            switch result {
            case .success(_):
                self.delegate?.successSave()
            case .failure(_):
                self.delegate?.failureSave()
            }
        }
    }
    
    private var listSelectExercise: [Exercise] {
        return exercises.filter({$0.isSelected == true})
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
