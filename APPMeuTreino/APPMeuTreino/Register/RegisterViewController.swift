//
//  RegisterViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit
import MobileCoreServices
import Firebase
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    private var viewModel: RegisterViewModel = RegisterViewModel()
    private var loadingViewController: LoadingViewController?
    private var alert: Alert?
    private var auth: Auth?
    private var firestore: Firestore?

    
    
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
    
    var nameOfUser: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configRegisterView()
        alert = Alert(controller: self)
        viewModel.delegate(delegate: self)
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
    }
    
    
    func configTextField(textField: UITextField){
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        textField.clipsToBounds = true
        
        textField.delegate = self
    }
    
    func configRegisterView(){
        editPhotoImageView.image = UIImage(systemName: "person.circle")
        editPhotoImageView.tintColor = .blueMeuTreino
        
        configTextField(textField: nameTextField)
        configTextField(textField: birthdayTextField)
        configTextField(textField: emailTextField)
        configTextField(textField: passwordTextField)
        configTextField(textField: confirmPasswordTextField)
        
        signUpConfirmButton.layer.cornerRadius = 10
        signUpConfirmButton.backgroundColor = UIColor.blueMeuTreino
        
        editPhotoImageView.layer.borderWidth = 2
        editPhotoImageView.layer.cornerRadius = editPhotoImageView.frame.size.height/2
        editPhotoImageView.layer.borderColor = UIColor.blueMeuTreino.cgColor
    }
    
    func configureImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
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
        showLoadingScreen()
        viewModel.registerUser(name: nameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
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
            nameTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
            birthdayTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
            emailTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
            passwordTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
            confirmPasswordTextField.layer.borderColor = UIColor.blueMeuTreino.cgColor
        } else {
            if textField.hasText == false{
                textField.layer.borderColor = UIColor.red.cgColor
            } else {
                textField.layer.borderColor = UIColor.blueMeuTreino.cgColor
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let editedImage = info[.editedImage] as? UIImage {
            editPhotoImageView.image = editedImage
            
            if let imageData = editedImage.jpegData(compressionQuality: 1.0) {
                UserDefaults.standard.set(imageData, forKey: "UserImage")
            }
        } else if let originalImage = info[.originalImage] as? UIImage {
            editPhotoImageView.image = originalImage
            
            if let imageData = originalImage.jpegData(compressionQuality: 1.0) {
                UserDefaults.standard.set(imageData, forKey: "UserImage")
            }
        }
    }
}

extension RegisterViewController: RegisterViewModelProtocol {
    func sucessRegister() {
        hideLoadingScreen()
        let vc: TabBarControllerViewController? = UIStoryboard(name: String(describing: TabBarControllerViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarControllerViewController.self)) as? TabBarControllerViewController
        navigationController?.popToRootViewController(animated: true)
    }
    
    func errorRegister(errorMessage: String) {
        hideLoadingScreen()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
            self.alert?.alertInformation(title: "Ops! Algo deu errado!", message: errorMessage)
        })
    }
}
