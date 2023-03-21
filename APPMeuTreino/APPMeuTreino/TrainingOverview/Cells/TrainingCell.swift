//
//  TrainingCell.swift
//  APPMeuTreino
//
//  Created by Barbara Silva on 2023-03-20.
//

import UIKit

class TrainingCell: UITableViewCell {

    @IBOutlet weak var trainingCellView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    static let identifier: String = "TrainingCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(){
        startButton.layer.cornerRadius = 8
        trainingCellView.layer.cornerRadius = 25
       // testeLabel.text = "Barbara"
        //testeView.layer.cornerRadius = 20
    
    }
    
}
