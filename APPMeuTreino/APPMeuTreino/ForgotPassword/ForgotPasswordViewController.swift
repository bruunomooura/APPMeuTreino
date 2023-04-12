//
//  ForgotPasswordViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var changePasswordButton: UIButton!
    
    @IBOutlet weak var backgroundDetailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        emailTextField.clipsToBounds = true
        
        changePasswordButton.layer.cornerRadius = 10
        
        self.emailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.emailTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedChangePassword(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
