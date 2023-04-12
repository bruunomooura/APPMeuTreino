//
//  DataChangeViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class DataChangeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var alteracaodedadosLabel: UILabel!
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var fullnameTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    
    
    @IBAction func editimageButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            // Define a imagem selecionada na sua ImageView
            imageProfile.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            // Define a imagem original na sua ImageView (caso o usuário não tenha editado a imagem)
            imageProfile.image = originalImage
        }
        // Fecha o ImagePickerController
        picker.dismiss(animated: true, completion: nil)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageProfile.layer.borderWidth = 2
        imageProfile.layer.masksToBounds = false
        imageProfile.layer.borderColor = UIColor(named: "BlueMeuTreino")?.cgColor
        imageProfile.layer.cornerRadius = imageProfile.frame.size.height/2
        imageProfile.clipsToBounds = true
        
        saveButton.layer.cornerRadius = 10
        
        fullnameTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        fullnameTextField.layer.borderWidth = 2
        fullnameTextField.layer.cornerRadius = 10
        fullnameTextField.clipsToBounds = true

        
        birthdayTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        birthdayTextField.layer.borderWidth = 2
        birthdayTextField.layer.cornerRadius = 10
        birthdayTextField.clipsToBounds = true

        
        emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.cornerRadius = 10
        emailTextField.clipsToBounds = true

        
        self.fullnameTextField.delegate = self
        self.birthdayTextField.delegate = self
        self.emailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fullnameTextField{
            birthdayTextField.becomeFirstResponder()
        }else if textField == birthdayTextField{
            emailTextField.becomeFirstResponder()
        }else if textField == emailTextField{
            emailTextField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

