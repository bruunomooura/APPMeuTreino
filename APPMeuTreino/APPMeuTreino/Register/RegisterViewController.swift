//
//  RegisterViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
        
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        
        birthdayTextField.layer.cornerRadius = 10
        birthdayTextField.layer.borderWidth = 2
        birthdayTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        
        confirmPasswordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.layer.borderWidth = 2
        confirmPasswordTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
                
        signUpConfirmButton.layer.cornerRadius = 10
        
        editPhotoImageView.layer.borderWidth = 2
        editPhotoImageView.layer.cornerRadius = editPhotoImageView.frame.size.height/2
        editPhotoImageView.layer.borderColor = UIColor(named: "BlueMeuTreino")?.cgColor
        //editPhotoImageView.layer.masksToBounds = false
        //editPhotoImageView.clipsToBounds = true
        
        self.nameTextField.delegate = self
        self.birthdayTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
    }
    
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
    
    @IBAction func tappedEditImageButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage{
            editPhotoImageView.image = editedImage
        }else if let originalImage = info[.originalImage] as? UIImage {
            editPhotoImageView.image = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedConfirmSignUpButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
