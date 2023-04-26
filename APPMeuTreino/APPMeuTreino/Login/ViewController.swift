//
//  ViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLoginView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configLoginView(){
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        emailTextField.clipsToBounds = true
        
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        passwordTextField.clipsToBounds = true
        
        loginButton.layer.cornerRadius = 10
        loginButton.isEnabled = false
        
        registerButton.layer.cornerRadius = 10
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        let vc: TabBarControllerViewController? = UIStoryboard(name: String(describing: TabBarControllerViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarControllerViewController.self)) as? TabBarControllerViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedSignupButton(_ sender: UIButton) {
        let vc: RegisterViewController? = UIStoryboard(name: String(describing: RegisterViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: RegisterViewController.self)) as? RegisterViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        let vc: ForgotPasswordViewController? = UIStoryboard(name: String(describing: ForgotPasswordViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ForgotPasswordViewController.self)) as? ForgotPasswordViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField{
            self.passwordTextField.becomeFirstResponder()
        } else {
            self.passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if emailTextField.hasText && passwordTextField.hasText {
            loginButton.isEnabled = true
            
            emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            passwordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        } else {
            loginButton.isEnabled = false
            if textField.hasText == false{
                textField.layer.borderColor = UIColor.red.cgColor
            }else{
                textField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
