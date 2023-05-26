//
//  ExerciseSelectionCollectionViewCell.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 24/03/23.
//

import UIKit

protocol ExerciseSelectionCollectionViewCellProtocol: AnyObject {
    func addExerciseInformations(name: String)
}

class ExerciseSelectionCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var weightSelectionButton: UIButton!
    @IBOutlet weak var numberSeriesSelectionButton: UIButton!
    @IBOutlet weak var numberRepetitionsSelectionButton: UIButton!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var exerciseSelecionImageView: UIImageView!
    
           
    private var delegate: ExerciseSelectionCollectionViewCellProtocol?
    
    func delegate(delegate:ExerciseSelectionCollectionViewCellProtocol){
        self.delegate = delegate
    }
    
    static let identifier: String = String(describing: ExerciseSelectionCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configExerciseSelectionView()
    }
    
    func configExerciseSelectionView() {
        exerciseSelecionImageView.contentMode = .scaleAspectFill
        weightSelectionButton.layer.cornerRadius = 8
        numberSeriesSelectionButton.layer.cornerRadius = 8
        numberRepetitionsSelectionButton.layer.cornerRadius = 8
    }
    
    func setupCell(exercise: Exercise) {
        exerciseSelecionImageView.image = UIImage(named: exercise.exerciseImage ?? "")
        exerciseLabel.text = exercise.exerciseName
    }

    @IBAction func tappedSelectionButton(_ sender: UIButton) {
        delegate?.addExerciseInformations(name: sender.titleLabel?.text ?? "")
    }
}
