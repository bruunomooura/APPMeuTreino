//
//  ViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        emailTextField.clipsToBounds = true
        
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        passwordTextField.clipsToBounds = true
        
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        let vc: TabBarControllerViewController? = UIStoryboard(name: "TabBarControllerViewController", bundle: nil).instantiateViewController(withIdentifier: "TabBarControllerViewController") as? TabBarControllerViewController
        //vc?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedSignupButton(_ sender: UIButton) {
        let vc: RegisterViewController? = UIStoryboard(name: "RegisterViewController", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        //vc?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        let vc: ForgotPasswordViewController? = UIStoryboard(name: "ForgotPasswordViewController", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        //vc?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
}

