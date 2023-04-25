//
//  ForgotPasswordViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var changePasswordButton: UIButton!
    
    @IBOutlet weak var backgroundDetailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configForgotPasswordView()
    }
    
    func configForgotPasswordView(){
        
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        emailTextField.clipsToBounds = true
        
        changePasswordButton.layer.cornerRadius = 10
        changePasswordButton.isEnabled = false
        
        self.emailTextField.delegate = self
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedChangePassword(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
   
}

extension ForgotPasswordViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.emailTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //delegate?.passExerciseSettingsData(value:textField.text!)
        
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
