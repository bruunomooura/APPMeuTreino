//
//  DemonstrationExerciseViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class DemonstrationExerciseViewController: UIViewController {
    
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var demonstrationViewImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }    
}
