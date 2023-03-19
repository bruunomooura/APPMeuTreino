//
//  LoginViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        
        registerButton.layer.cornerRadius = 10
        
        loginButton.layer.cornerRadius = 10
        
        self.emailTextField.delegate = self
        
        self.passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField{
            self.passwordTextField.becomeFirstResponder()
        }else{
            self.passwordTextField.resignFirstResponder()
        }
        return true
    }
}
