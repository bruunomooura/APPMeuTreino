
import Foundation

class CreateTrainingViewModel {
    
    private var service: GetExerciseService = GetExerciseService()
    private var exerciseData: ExerciseData?
    private var exercises: [Exercise] = []
    var filteredExercises: [Exercise] = []
    
    var exerciseCount: Int {
        return exercises.count
    }
    
    func getExercise(at index: Int) -> Exercise? {
        guard index >= 0 && index < exercises.count else {
            return nil
        }
        return exercises[index]
    }
    
    func fetchAllRequest(completion: @escaping () -> Void) {
        service.getExercise { [weak self] result, error in
            if let result = result {
                self?.exerciseData = result
                self?.updateExercises()
                self?.filteredExercises = self?.exercises ?? []
                completion()
            } else {
                // Handle error
                completion()
            }
        }
    }
    
    func filterExercises(with searchText: String) {
        if searchText.isEmpty {
            filteredExercises = exercises
        } else {
            filteredExercises = exercises.filter { $0.exerciseName.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private func updateExercises() {
        guard let exerciseData = exerciseData else {
            return
        }
        
        exercises = exerciseData.map { exerciseDatum in
                let exerciseImage = exerciseDatum.exerciseName?.replacingOccurrences(of: " ", with: "_")
                let exerciseVideoURL = exerciseDatum.videoURL?.first
                return Exercise(exerciseName: exerciseDatum.exerciseName ?? "",
                                category: exerciseDatum.category?.rawValue ?? "",
                                details: exerciseDatum.details ?? "",
                                exerciseImage: exerciseImage,
                                exerciseVideoURL: exerciseVideoURL)
            }
        }
}
