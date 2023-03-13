//
//  ChangePasswordViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var newpasswordTextField: UITextField!
    
    @IBOutlet weak var repeatpasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    passwordTextField.layer.borderColor = UIColor.orange.cgColor
    passwordTextField.layer.borderWidth = 1.0
    newpasswordTextField.layer.borderColor = UIColor.orange.cgColor
    newpasswordTextField.layer.borderWidth = 1.0
    repeatpasswordTextField.layer.borderColor = UIColor.orange.cgColor
    repeatpasswordTextField.layer.borderWidth = 1.0
    saveButton.layer.cornerRadius = 8
        
        // Do any additional setup after loading the view.
    }
   
}
