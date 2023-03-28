//
//  CollectionExecutionTainingViewCell.swift
//  APPMeuTreino
//
//  Created by Leonardo Lacerda on 27/03/23.
//

import UIKit

protocol CollectionExecutionTainingViewCellProtocol: AnyObject {
    func addExerciseInformations(name: String)
}

class CollectionExecutionTainingViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var exerciseImageView: UIImageView!
    
    @IBOutlet weak var checkMarkButton: UIButton!
    
    @IBOutlet weak var weightButton: UIButton!
    
    @IBOutlet weak var seriesButton: UIButton!
    
    @IBOutlet weak var repsButton: UIButton!
    
    @IBOutlet weak var exerciseView: UIView!
    
    private var delegate:CollectionExecutionTainingViewCellProtocol?
    func delegate(delegate:CollectionExecutionTainingViewCellProtocol){
        self.delegate = delegate
    }
    
    static let identifier: String = "CollectionExecutionTainingViewCell"
    
    var isButtonSelected: Bool = false
    
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        exerciseImageView.contentMode = .scaleAspectFill
        weightButton.layer.cornerRadius = 10
        seriesButton.layer.cornerRadius = 10
        repsButton.layer.cornerRadius = 10
        exerciseView.layer.cornerRadius = 10
        exerciseView.layer.shadowColor = UIColor.lightGray.cgColor
        exerciseView.layer.shadowRadius = 2
//        exerciseView.layer.borderWidth = 1
//        exerciseView.layer.borderColor = UIColor.lightGray.cgColor
        
        exerciseView.layer.shadowOffset = CGSize.zero
        exerciseView.layer.shadowOpacity = 0.7
        exerciseView.layer.masksToBounds = false
    }
    
    func configureCell(name: String, nameImage: String){
        label.text = name
        exerciseImageView.image = UIImage(named: nameImage)
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
        delegate?.addExerciseInformations(name: sender.titleLabel?.text ?? "")
    }
}
