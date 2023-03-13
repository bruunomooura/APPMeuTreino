//
//  DataChangeViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class DataChangeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var alteracaodedadosLabel: UILabel!
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var fullnameTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
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
        
        imageProfile.layer.borderWidth = 1
        imageProfile.layer.masksToBounds = false
        imageProfile.layer.borderColor = UIColor.blue.cgColor
        imageProfile.layer.cornerRadius = imageProfile.frame.size.height/2
        imageProfile.clipsToBounds = true
        
        saveButton.layer.cornerRadius = 8
        
        fullnameTextField.layer.borderColor = UIColor.orange.cgColor
        fullnameTextField.layer.borderWidth = 1.0
        
        birthdayTextField.layer.borderColor = UIColor.orange.cgColor
        birthdayTextField.layer.borderWidth = 1.0
        
        emailTextField.layer.borderColor = UIColor.orange.cgColor
        emailTextField.layer.borderWidth = 1.0
        
    }
    
}

