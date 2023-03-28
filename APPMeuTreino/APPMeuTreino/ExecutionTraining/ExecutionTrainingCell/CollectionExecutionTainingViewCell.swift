//
//  CollectionExecutionTainingViewCell.swift
//  APPMeuTreino
//
//  Created by Leonardo Lacerda on 27/03/23.
//

import UIKit

class CollectionExecutionTainingViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var exerciseImageView: UIImageView!
    
    @IBOutlet weak var checkMarkButton: UIButton!
    
    @IBOutlet weak var weightButton: UIButton!
    
    @IBOutlet weak var seriesButton: UIButton!
    
    @IBOutlet weak var repsButton: UIButton!
    
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
}
