//
//  CreateTrainingCollectionViewCell.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 05/07/23.
//

import UIKit
import AVFoundation

protocol CreateTrainingCollectionViewCellProtocol: AnyObject {
    func addExerciseInformations(name: String)
}

class CreateTrainingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weightSelectionButton: UIButton!
    @IBOutlet weak var numberSeriesSelectionButton: UIButton!
    @IBOutlet weak var numberRepetitionsSelectionButton: UIButton!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var exerciseSelecionImageView: UIImageView!
    
    var celldelegate: CreateTrainingCollectionViewCellProtocol?
    
    func delegate(delegate:CreateTrainingCollectionViewCellProtocol){
        self.celldelegate = delegate
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
        
        if exercise.isSelected {
            contentView.backgroundColor = .red
        } else {
            contentView.backgroundColor = .white
        }
        
        exerciseLabel.text = exercise.exerciseName
        guard let video = exercise.exerciseVideoURL, let url: URL = Utils.getThumbnail(link: video) else { return }
        exerciseSelecionImageView.loadImageFromURL(url, placeholder: UIImage(systemName: "trash"))
    }
    
    @IBAction func tappedSelectionButton(_ sender: UIButton) {
        celldelegate?.addExerciseInformations(name: sender.titleLabel?.text ?? "")
    }
}
 
