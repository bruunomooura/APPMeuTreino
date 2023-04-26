//
//  CreateTrainingCollectionViewCell.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 17/03/23.
//

import UIKit

class CreateTrainingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var groupMuscleTypeImageView: UIImageView!
    
    static let identifier: String = String(describing: CreateTrainingCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(exerciseType: ExerciseType) {
        groupMuscleTypeImageView.image = UIImage(named: exerciseType.exerciseTypeImage)
    }
}
