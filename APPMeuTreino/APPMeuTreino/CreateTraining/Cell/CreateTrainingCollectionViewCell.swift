//
//  CreateTrainingCollectionViewCell.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 05/07/23.
//

import UIKit

protocol CreateTrainingCollectionViewCellProtocol: AnyObject {
    func addExerciseInformations(name: String)
}

class CreateTrainingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weightSelectionButton: UIButton!
    @IBOutlet weak var numberSeriesSelectionButton: UIButton!
    @IBOutlet weak var numberRepetitionsSelectionButton: UIButton!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var exerciseSelecionImageView: UIImageView!
    
    private var delegate: CreateTrainingCollectionViewCellProtocol?
    
    func delegate(delegate:CreateTrainingCollectionViewCellProtocol){
        self.delegate = delegate
    }
    
    static let identifier: String = String(describing: CreateTrainingCollectionViewCell.self)
    
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
