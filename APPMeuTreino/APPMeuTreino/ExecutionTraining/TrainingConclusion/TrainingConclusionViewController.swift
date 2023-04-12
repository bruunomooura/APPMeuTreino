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

        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor(named: "BlueMeuTreino")?.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.clipsToBounds = true
    }
    
    @IBAction func tappedExitButton(_ sender: UIButton) {
        let vc: TabBarControllerViewController? = UIStoryboard(name: "TabBarControllerViewController", bundle: nil).instantiateViewController(withIdentifier: "TabBarControllerViewController") as? TabBarControllerViewController
        //vc?.modalPresentationStyle = .formSheet
        present(vc ?? UIViewController(), animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
