//
//  CollectionExecutionTrainingViewCell.swift
//  APPMeuTreino
//
//  Created by Leonardo Lacerda on 27/03/23.
//

import UIKit

protocol ExecutionTrainingCollectionViewCellProtocol: AnyObject {
    func addExerciseInformation(name: String)
}

class ExecutionTrainingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var checkMarkButton: UIButton!
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var seriesButton: UIButton!
    @IBOutlet weak var repsButton: UIButton!
    @IBOutlet weak var exerciseView: UIView!
    
    var isButtonSelected: Bool = false
    
    private var delegate: ExecutionTrainingCollectionViewCellProtocol?
    
    func delegate(delegate:ExecutionTrainingCollectionViewCellProtocol){
        self.delegate = delegate
    }
    
    static let identifier: String = String(describing: ExecutionTrainingCollectionViewCell.self)
    
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configExecutionTrainingView()
    }
    
    func configExecutionTrainingView() {
        exerciseImageView.contentMode = .scaleAspectFill
        
        weightButton.layer.cornerRadius = 10
        
        seriesButton.layer.cornerRadius = 10
        
        repsButton.layer.cornerRadius = 10
        
        exerciseView.layer.cornerRadius = 10
        exerciseView.layer.shadowColor = UIColor.lightGray.cgColor
        exerciseView.layer.shadowRadius = 2
        exerciseView.layer.shadowOffset = CGSize.zero
        exerciseView.layer.shadowOpacity = 0.7
        exerciseView.layer.masksToBounds = false
    }
    
    func setupCell(exercise: Exercise) {
        exerciseLabel.text = exercise.exerciseName
        exerciseImageView.image = UIImage(named: exercise.exerciseImage ?? "")
    }
    
    @IBAction func tappedCheckBoxButton(_ sender: UIButton) {
        if isButtonSelected == true {
            checkMarkButton.setImage(UIImage(named: "CheckBoxNo"), for: .normal)
            isButtonSelected = false
        }else{
            checkMarkButton.setImage(UIImage(named: "CheckBoxYes"), for: .normal)
            isButtonSelected = true
        }
    }
    
    @IBAction func tappedWeightButton(_ sender: UIButton) {
        delegate?.addExerciseInformation(name: sender.titleLabel?.text ?? "")
    }
}
