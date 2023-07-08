//
//  ViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: LoginViewModel = LoginViewModel()
    private var loadingViewController: LoadingViewController?
    private var alert: Alert?
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLoginView()
        alert = Alert(controller: self)
        viewModel.delegate(delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configLoginView(){
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        emailTextField.clipsToBounds = true
        
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        passwordTextField.clipsToBounds = true
        
        loginButton.layer.cornerRadius = 10
        
        registerButton.layer.cornerRadius = 10
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
       emailTextField.text = "testeVai@outlook.com"
       passwordTextField.text = "123456"
    }
    
    private func showLoadingScreen() {
        loadingViewController = LoadingViewController()
        present(loadingViewController!, animated: true, completion: nil)
    }
    
    private func hideLoadingScreen() {
        loadingViewController?.dismiss(animated: true, completion: nil)
        loadingViewController = nil
    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        viewModel.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        showLoadingScreen()
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
            
            emailTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
            passwordTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
        } else {
            if textField.hasText == false{
                textField.layer.borderColor = UIColor.red.cgColor
            }else{
                textField.layer.borderColor = UIColor.blueMeuTreino.cgColor
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension ViewController: LoginViewModelProtocol {
    func successLogin() {
        hideLoadingScreen()
        let vc: TabBarControllerViewController? = UIStoryboard(name: String(describing: TabBarControllerViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarControllerViewController.self)) as? TabBarControllerViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func errorLogin(errorMessage: String) {
        hideLoadingScreen()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
            self.alert?.alertInformation(title: "Ops! Algo deu errado!", message: errorMessage)
        })
    }
}
