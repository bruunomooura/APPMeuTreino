//
//  DataChangeViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class DataChangeViewController: UIViewController {

    @IBOutlet weak var dataChangeLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDataChangeView()
    }
    
    func configTextField(textField: UITextField){
        textField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.delegate = self
    }
    
    func configDataChangeView() {
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor(named: "BlueMeuTreino")?.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.clipsToBounds = true
        
        saveButton.layer.cornerRadius = 10
        saveButton.isEnabled = false
        
        configTextField(textField: nameTextField)
        configTextField(textField: birthdayTextField)
        configTextField(textField: emailTextField)
        
    }
    
    func configureImagePicker(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
   
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedEditButton(_ sender: UIButton) {
        configureImagePicker()
        saveButton.isEnabled = true
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension DataChangeViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField{
            birthdayTextField.becomeFirstResponder()
        }else if textField == birthdayTextField{
            emailTextField.becomeFirstResponder()
        }else if textField == emailTextField{
            emailTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.hasText && birthdayTextField.hasText && emailTextField.hasText {
            nameTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            birthdayTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            emailTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            saveButton.isEnabled = true
        } else if editButton.isHighlighted {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
            if textField.hasText{
                textField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension DataChangeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            profileImageView.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            profileImageView.image = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

}
