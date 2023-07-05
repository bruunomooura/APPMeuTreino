//
//  NoTrainingTableViewCell.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 05/07/23.
//

import UIKit

class NoTrainingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noTrainingCellView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var letsBeginLabel: UILabel!
    @IBOutlet weak var clickToCreateTrainingLabel: UILabel!
    
    static let identifier: String = String(describing: NoTrainingTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    func configureCell(){
        noTrainingCellView.layer.cornerRadius = 8
        noTrainingCellView.layer.masksToBounds = false
        noTrainingCellView.layer.shadowColor = UIColor.lightGray.cgColor
        noTrainingCellView.layer.shadowOffset = CGSize(width: 1, height: 1)
        noTrainingCellView.layer.shadowOpacity = 1
        noTrainingCellView.layer.shadowRadius = 8
        noTrainingCellView.layer.borderWidth = 2
        noTrainingCellView.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        noTrainingCellView.backgroundColor = .white
        noTrainingCellView.clipsToBounds = true
        
        letsBeginLabel.textColor = .orangeMeuTreino
        
        clickToCreateTrainingLabel.textColor = .orangeMeuTreino
    }
    
    func setupCell(text1: String, text2: String){
        letsBeginLabel.text = text1
        clickToCreateTrainingLabel.text = text2
    }
}
