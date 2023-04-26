//
//  TrainingConclusionViewController.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 29/03/23.
//

import UIKit

class TrainingConclusionViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTrainingConclusionView()
    }
    
    func configTrainingConclusionView() {
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor(named: "BlueMeuTreino")?.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.clipsToBounds = true
    }
    
    @IBAction func tappedExitButton(_ sender: UIButton) {
        let vc: TabBarControllerViewController? = UIStoryboard(name: String(describing: TabBarControllerViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarControllerViewController.self)) as? TabBarControllerViewController
        present(vc ?? UIViewController(), animated: true)
    }
}
