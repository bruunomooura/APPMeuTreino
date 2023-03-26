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
        trainingCellView.layer.cornerRadius = 12
        
        //configuraçao da borda sombreada

        trainingCellView.layer.masksToBounds = false //Isso permite que a sombra seja exibida fora da borda da view. Se essa propriedade estiver definida como true, a sombra será cortada na borda da view.
        trainingCellView.layer.shadowColor = UIColor.lightGray.cgColor //cor da sombra
        trainingCellView.layer.shadowOffset = CGSize(width: 0, height: 3) //direcao e deslocamento da sombra
        trainingCellView.layer.shadowOpacity = 1 // opacidade
        trainingCellView.layer.shadowRadius = 4 // raio da sombra
        trainingCellView.layer.borderWidth = 0.2// largura da borda view
        trainingCellView.layer.borderColor = UIColor.gray.cgColor //cor da borda da view
        
        
        
        
        
        
    
    }
    
}
