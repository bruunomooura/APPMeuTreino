//
//  CustomExerciseSelectionCollectionViewCell.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 24/03/23.
//

import UIKit

protocol CustomExerciseSelectionCollectionViewCellProtocol: AnyObject {
    func addExerciseInformations(name: String)
}
class CustomExerciseSelectionCollectionViewCell: UICollectionViewCell {

  
    @IBOutlet weak var weightSelectionButton: UIButton!
    
    
    @IBOutlet weak var numberSeriesSelectionButton: UIButton!
    
    
    @IBOutlet weak var numberRepetitionsSelectionButton: UIButton!
    
    
    @IBOutlet weak var nameExercise: UILabel!
    
    
    @IBOutlet weak var exerciseSelecionImageView: UIImageView!
    
    
    
    private var delegate:CustomExerciseSelectionCollectionViewCellProtocol?
    func delegate(delegate:CustomExerciseSelectionCollectionViewCellProtocol){
        self.delegate = delegate
    }
    
    static let identifier: String = "CustomExerciseSelectionCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        exerciseSelecionImageView.contentMode = .scaleAspectFill
        weightSelectionButton.layer.cornerRadius = 8
        numberSeriesSelectionButton.layer.cornerRadius = 8
        numberRepetitionsSelectionButton.layer.cornerRadius = 8
    }
    func setupCell(exercise: Exercise) {
        exerciseSelecionImageView.image = UIImage(named: exercise.exercisaImage)
        nameExercise.text = exercise.exerciseName
    }

    @IBAction func tappedWeigthSelectionButton(_ sender: UIButton) {
    //chamar o protocolo
        delegate?.addExerciseInformations(name: sender.titleLabel?.text ?? "")
        
    }
}


