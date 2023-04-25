//
//  TrainingCell.swift
//  APPMeuTreino
//
//  Created by Barbara Silva on 2023-03-20.
//

import UIKit

class TrainingCell: UITableViewCell {

    @IBOutlet weak var trainingCellView: UIView!
    
    @IBOutlet weak var nameTrainingLabel: UILabel!
    
    @IBOutlet weak var numberOfExerciseLabel: UILabel!
    
    static let identifier: String = "TrainingCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(){
        trainingCellView.layer.cornerRadius = 12
        
        trainingCellView.layer.masksToBounds = false
        trainingCellView.layer.shadowColor = UIColor.lightGray.cgColor
        trainingCellView.layer.shadowOffset = CGSize(width: 0, height: 1)
        trainingCellView.layer.shadowOpacity = 1
        trainingCellView.layer.shadowRadius = 4
        trainingCellView.layer.borderWidth = 0.2
        trainingCellView.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    func setupCell(training: Training){
        nameTrainingLabel.text = training.nameTraining
        numberOfExerciseLabel.text = "\(training.numberOfExercise) exercícios"
    }
    
}
