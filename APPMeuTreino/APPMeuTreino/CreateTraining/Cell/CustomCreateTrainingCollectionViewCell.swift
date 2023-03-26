//
//  CustomCreateTrainingCollectionViewCell.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 17/03/23.
//

import UIKit

class CustomCreateTrainingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var groupMuscleTypeImageView: UIImageView!
    
    static let identifier: String = "CustomCreateTrainingCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(nameImage: String) {
        groupMuscleTypeImageView.image = UIImage(named: nameImage)
    }

}
