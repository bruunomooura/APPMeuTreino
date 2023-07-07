//
//  ChangePasswordViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    private var viewModel: ChangePasswordViewModel = ChangePasswordViewModel()
    private var loadingViewController: LoadingViewController?
    private var alert: Alert?
    
    @IBOutlet weak var changePasswordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configChangePasswordView()
        alert = Alert(controller: self)
        
        self.confirmPasswordTextField.delegate = self
        self.newPasswordTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func configTextField(textField: UITextField){
        textField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.delegate = self
    }
    
    func configChangePasswordView() {
        configTextField(textField: passwordTextField)
        configTextField(textField: newPasswordTextField)
        configTextField(textField: confirmPasswordTextField)
        
        saveButton.layer.cornerRadius = 10
        saveButton.isEnabled = false
    }
    private func showLoadingScreen() {
        loadingViewController = LoadingViewController()
        present(loadingViewController!, animated: true, completion: nil)
    }
    
    private func hideLoadingScreen() {
        loadingViewController?.dismiss(animated: true, completion: nil)
        loadingViewController = nil
    }
    
    private func showSuccessAlert() {
        let alert = UIAlertController(title: "Sucesso!", message: "Senha alterada com sucesso.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        })
        present(alert, animated: true, completion: nil)
    }

    private func showErrorAlert() {
        let alert = UIAlertController(title: "Erro!", message: "Erro ao alterar a senha, verifique a senha informada e tente novamente.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        showLoadingScreen()
        guard let oldPassword = passwordTextField.text, let newPassword = newPasswordTextField.text else {
            return
        }
        
        viewModel.changePassword(oldPassword: oldPassword, newPassword: newPassword) { [weak self] (success) in
            DispatchQueue.main.async {
                if success {
                    self?.hideLoadingScreen()
                    self?.showSuccessAlert()
                } else {
                    self?.hideLoadingScreen()
                    self?.showErrorAlert()
                }
            }
        }
    }
}

extension ChangePasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTextField{
            newPasswordTextField.becomeFirstResponder()
        }else if textField == newPasswordTextField{
            confirmPasswordTextField.becomeFirstResponder()
        }else if textField == confirmPasswordTextField{
            confirmPasswordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if passwordTextField.hasText && newPasswordTextField.hasText && confirmPasswordTextField.hasText{
        if newPasswordTextField.text == confirmPasswordTextField.text {
        passwordTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
        newPasswordTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
        confirmPasswordTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
        saveButton.isEnabled = true
            } else {
        saveButton.isEnabled = false
        newPasswordTextField.layer.borderColor = UIColor.red.cgColor
        confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
                }
            } else{
        saveButton.isEnabled = false
        if textField.hasText{
            textField.layer.borderColor = UIColor.blueMeuTreino.cgColor
            }else{
            textField.layer.borderColor = UIColor.red.cgColor
                }
            }
        if passwordTextField.text == newPasswordTextField.text && newPasswordTextField.text == confirmPasswordTextField.text {
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                newPasswordTextField.layer.borderColor = UIColor.red.cgColor
                confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
                saveButton.isEnabled = false
            }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
