//
//  ChangePasswordViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ChangePasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var newpasswordTextField: UITextField!
    
    @IBOutlet weak var repeatpasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.cornerRadius = 10
    
        newpasswordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        newpasswordTextField.layer.borderWidth = 2
        newpasswordTextField.layer.cornerRadius = 10
        
        repeatpasswordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        repeatpasswordTextField.layer.borderWidth = 2
        repeatpasswordTextField.layer.cornerRadius = 10
        
        saveButton.layer.cornerRadius = 10
        
        self.repeatpasswordTextField.delegate = self
        self.newpasswordTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
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
   
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
