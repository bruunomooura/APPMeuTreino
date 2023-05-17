//
//  RegisterViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private var viewModel: RegisterViewModel = RegisterViewModel()
    //private weak var delegate: RegisterViewModelProtocol
    

    @IBOutlet weak var editPhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpConfirmButton: UIButton!
    @IBOutlet weak var editPhotoButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configRegisterView()
        //RegisterViewModel.delegate(delegate: self)
    }
    
    func configTextField(textField: UITextField){
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        textField.clipsToBounds = true
        
        textField.delegate = self
    }
    
    func configRegisterView(){
        configTextField(textField: nameTextField)
        configTextField(textField: birthdayTextField)
        configTextField(textField: emailTextField)
        configTextField(textField: passwordTextField)
        configTextField(textField: confirmPasswordTextField)

        signUpConfirmButton.layer.cornerRadius = 10
        signUpConfirmButton.isEnabled = false
        
        editPhotoImageView.layer.borderWidth = 2
        editPhotoImageView.layer.cornerRadius = editPhotoImageView.frame.size.height/2
        editPhotoImageView.layer.borderColor = UIColor(named: "BlueMeuTreino")?.cgColor
    }
    
    func configureImagePicker(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tappedEditImageButton(_ sender: UIButton) {
        configureImagePicker()
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedSignUpConfirmButton(_ sender: UIButton) {
//        navigationController?.popViewController(animated: true)
        viewModel.registerUser(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}

extension RegisterViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nameTextField{
            self.birthdayTextField.becomeFirstResponder()
        }else if textField == self.birthdayTextField{
            self.emailTextField.becomeFirstResponder()
        }else if textField == self.emailTextField{
            self.passwordTextField.becomeFirstResponder()
        }else if textField == self.passwordTextField{
            self.confirmPasswordTextField.becomeFirstResponder()
        }else{
            self.confirmPasswordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if nameTextField.hasText && birthdayTextField.hasText && emailTextField.hasText && passwordTextField.hasText && confirmPasswordTextField.hasText && confirmPasswordTextField.hasText {
            signUpConfirmButton.isEnabled = true
            nameTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            birthdayTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            passwordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            confirmPasswordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        } else {
            signUpConfirmButton.isEnabled = false
            if textField.hasText == false{
                textField.layer.borderColor = UIColor.red.cgColor
            } else {
                textField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage{
            editPhotoImageView.image = editedImage
        }else if let originalImage = info[.originalImage] as? UIImage {
            editPhotoImageView.image = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
//extension RegisterViewController: RegisterViewModelProtocol {
//    func sucessRegister() {
//        <#code#>
//    }
//
//    func errorRegister(errorMessage: String) {
//        <#code#>
//    }
//
//
//}
