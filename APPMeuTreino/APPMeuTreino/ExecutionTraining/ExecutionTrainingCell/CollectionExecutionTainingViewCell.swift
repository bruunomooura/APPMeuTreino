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
    
    static let identifier: String = "CollectionExecutionTainingViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        exerciseImageView.contentMode = .scaleAspectFill
    }
    
    func configureCell(name: String, nameImage: String){
        label.text = name
        exerciseImageView.image = UIImage(named: nameImage)
    }
}
