//
//  RegisterViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private var viewModel: RegisterViewModel = RegisterViewModel()
    private var loadingViewController: LoadingViewController?
    private var alert: Alert?
    
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
        alert = Alert(controller: self)
        viewModel.delegate(delegate: self)
        
    }
    
    
    func configTextField(textField: UITextField){
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
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
        editPhotoImageView.layer.borderColor = UIColor.blueMeuTreino.cgColor
    }
    
    func configureImagePicker(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func showLoadingScreen() {
        loadingViewController = LoadingViewController()
        present(loadingViewController!, animated: true, completion: nil)
    }
    
    private func hideLoadingScreen() {
        loadingViewController?.dismiss(animated: true, completion: nil)
        loadingViewController = nil
    }
    
    @IBAction func tappedEditImageButton(_ sender: UIButton) {
        configureImagePicker()
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedSignUpConfirmButton(_ sender: UIButton) {
        viewModel.registerUser(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        showLoadingScreen()
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
            nameTextField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
            birthdayTextField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
            emailTextField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
            passwordTextField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
            confirmPasswordTextField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        } else {
            signUpConfirmButton.isEnabled = false
            if textField.hasText == false{
                textField.layer.borderColor = UIColor.red.cgColor
            } else {
                textField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
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

extension RegisterViewController: RegisterViewModelProtocol {
    func sucessRegister() {
        hideLoadingScreen()
        let vc: TabBarControllerViewController? = UIStoryboard(name: String(describing: TabBarControllerViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarControllerViewController.self)) as? TabBarControllerViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func errorRegister(errorMessage: String) {
        hideLoadingScreen()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.alert?.alertInformation(title: "Ops! Algo deu errado!", message: errorMessage)
        })
    }
}
