//
//  CustomTableViewCell.swift
//  APPMeuTreino
//
//  Created by Leonardo Lacerda on 21/03/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var exerciseLabel: UILabel!
    
    //colocar o identificador com o mesmo nome da classe
    static let identifier: String = "CustomTableViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
