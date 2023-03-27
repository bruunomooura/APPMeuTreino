//
//  DemonstrationExerciseViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class DemonstrationExerciseViewController: UIViewController {

    @IBOutlet weak var BorderDemonstrationExercise: UIView!
    @IBOutlet weak var concluidoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let borderDemonstration = UIColor.lightGray
        
        BorderDemonstrationExercise.layer.cornerRadius = 8
        BorderDemonstrationExercise.layer.shadowColor = borderDemonstration.cgColor
        BorderDemonstrationExercise.layer.shadowOffset = CGSize.zero
        BorderDemonstrationExercise.layer.shadowOpacity = 0.7
        BorderDemonstrationExercise.layer.masksToBounds = false
        BorderDemonstrationExercise.layer.shadowRadius = 3
        
        concluidoButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
