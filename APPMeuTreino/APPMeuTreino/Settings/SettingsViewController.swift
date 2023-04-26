//
//  SettingsViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class SettingsViewController: UIViewController {
  
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var backgroundTextField1: UIButton!
    @IBOutlet weak var backgroundTextField2: UIButton!
    @IBOutlet weak var backgroundTextField3: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSettingsView()
    }
    
    func configSettingsView() {
        imageProfile.layer.borderWidth = 2
        imageProfile.layer.masksToBounds = false
        imageProfile.layer.borderColor = UIColor(named: "BlueMeuTreino")?.cgColor
        imageProfile.layer.cornerRadius = imageProfile.frame.height/2
        imageProfile.clipsToBounds = true
        
        backgroundTextField1.layer.cornerRadius = 8
        backgroundTextField2.layer.cornerRadius = 8
        backgroundTextField3.layer.cornerRadius = 8
    }
 
    @IBAction func tappedExitButton(_ sender: UIButton) {
        tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func tappedDataChangeButton(_ sender: UIButton) {
        let vc: DataChangeViewController? = UIStoryboard(name: String(describing: DataChangeViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: DataChangeViewController.self)) as? DataChangeViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedChangePasswordButton(_ sender: UIButton) {
        let vc: ChangePasswordViewController? = UIStoryboard(name: String(describing: ChangePasswordViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ChangePasswordViewController.self)) as? ChangePasswordViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
}
