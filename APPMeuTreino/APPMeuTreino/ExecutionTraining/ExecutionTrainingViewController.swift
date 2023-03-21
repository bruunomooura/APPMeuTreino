//
//  ExecutionTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ExecutionTrainingViewController: UIViewController {
    
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var trainingLabel: UILabel!
    
    @IBOutlet weak var finishTrainingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishTrainingButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
}
