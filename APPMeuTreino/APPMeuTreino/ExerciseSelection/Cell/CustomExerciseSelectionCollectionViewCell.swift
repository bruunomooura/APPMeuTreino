//
//  CustomExerciseSelectionCollectionViewCell.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 19/03/23.
//

import UIKit

class CustomExerciseSelectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var exerciseSelecionImageView: UIImageView!
    static let identifier: String = "CustomExerciseSelectionCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        exerciseSelecionImageView.contentMode = .scaleAspectFill
    }
    func setupCell(nameImage: String) {
        exerciseSelecionImageView.image = UIImage(named: nameImage)
    }
}
