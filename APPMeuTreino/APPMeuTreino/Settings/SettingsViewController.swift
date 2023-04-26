//
//  SettingsViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class SettingsViewController: UIViewController {
  
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var changeDataButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSettingsView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configSettingsView() {
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor(named: "BlueMeuTreino")?.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        
        changeDataButton.layer.cornerRadius = 8
        changePasswordButton.layer.cornerRadius = 8
        exitButton.layer.cornerRadius = 8
    }
 
    @IBAction func tappedChangeDataButton(_ sender: UIButton) {
        let vc: DataChangeViewController? = UIStoryboard(name: String(describing: DataChangeViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: DataChangeViewController.self)) as? DataChangeViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedChangePasswordButton(_ sender: UIButton) {
        let vc: ChangePasswordViewController? = UIStoryboard(name: String(describing: ChangePasswordViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ChangePasswordViewController.self)) as? ChangePasswordViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
   
    @IBAction func tappedExitButton(_ sender: UIButton) {
        tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
}
