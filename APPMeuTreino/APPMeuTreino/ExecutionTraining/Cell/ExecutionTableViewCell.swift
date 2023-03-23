//
//  ExecutionTableViewCell.swift
//  APPMeuTreino
//
//  Created by Leonardo Lacerda on 23/03/23.
//

import UIKit

class ExecutionTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
        
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var weightPickerView: UIPickerView!
    
    
    static let identifier: String = "ExecutionTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(exerciseName: String){
        label.text = exerciseName
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
    }
    
}
