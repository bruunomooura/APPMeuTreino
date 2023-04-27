//
//  ChangePasswordViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var changePasswordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configChangePasswordView()
        
        self.confirmPasswordTextField.delegate = self
        self.newPasswordTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func configTextField(textField: UITextField){
        textField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
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
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
        passwordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        newPasswordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        confirmPasswordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        saveButton.isEnabled = true
            } else {
        saveButton.isEnabled = false
        newPasswordTextField.layer.borderColor = UIColor.red.cgColor
        confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
                }
            } else{
        saveButton.isEnabled = false
        if textField.hasText{
            textField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            }else{
            textField.layer.borderColor = UIColor.red.cgColor
                }
            }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
