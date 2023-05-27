//
//  ForgotPasswordViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    private var viewModel: ForgotPasswordViewModel = ForgotPasswordViewModel()
    private var loadingViewController: LoadingViewController?
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var backgroundDetailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configForgotPasswordView()
        viewModel.delegate(delegate: self)
    }
    
    func configForgotPasswordView(){
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        emailTextField.clipsToBounds = true
        
        self.emailTextField.delegate = self
        
        changePasswordButton.layer.cornerRadius = 10
        changePasswordButton.isEnabled = false
        emailTextField.text = "leandro.bruno81@gmail.com"
    }
    
    private func showLoadingScreen() {
        loadingViewController = LoadingViewController()
        present(loadingViewController!, animated: true, completion: nil)
    }

    private func hideLoadingScreen() {
        loadingViewController?.dismiss(animated: true, completion: nil)
        loadingViewController = nil
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedChangePassword(_ sender: UIButton) {
        viewModel.sendPasswordResetEmail(email: emailTextField.text ?? "")
        showLoadingScreen()
    }
}

extension ForgotPasswordViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.emailTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if emailTextField.hasText{
            textField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            changePasswordButton.isEnabled = true
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            changePasswordButton.isEnabled = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewModelProtocol{
    func successSendEmail() {
        hideLoadingScreen()
        Alert(controller: self).alertInformation(title: "Tudo certo!", message: "Te enviamos um e-mail com instruções de redefinição de senha. Verifique a sua caixa de entrada e SPAM para concluir o processo.") {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func errorSendEmail(errorMessage: String) {
        hideLoadingScreen()
        Alert(controller: self).alertInformation(title: "Ops! Algo deu errado!", message: errorMessage)
    }
}
