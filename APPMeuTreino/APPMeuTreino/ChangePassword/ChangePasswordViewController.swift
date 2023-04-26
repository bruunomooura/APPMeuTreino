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
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configChangePasswordView()
        
        self.repeatpasswordTextField.delegate = self
        self.newpasswordTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func configChangePasswordView() {
        passwordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.clipsToBounds = true

        newpasswordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        newpasswordTextField.layer.borderWidth = 2
        newpasswordTextField.layer.cornerRadius = 10
        newpasswordTextField.clipsToBounds = true
        
        repeatpasswordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        repeatpasswordTextField.layer.borderWidth = 2
        repeatpasswordTextField.layer.cornerRadius = 10
        repeatpasswordTextField.clipsToBounds = true

        saveButton.layer.cornerRadius = 10
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
            newpasswordTextField.becomeFirstResponder()
        }else if textField == newpasswordTextField{
            repeatpasswordTextField.becomeFirstResponder()
        }else if textField == repeatpasswordTextField{
            repeatpasswordTextField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
