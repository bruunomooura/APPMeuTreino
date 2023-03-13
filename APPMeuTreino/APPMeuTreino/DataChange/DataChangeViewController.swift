//
//  DataChangeViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class DataChangeViewController: UIViewController {

    @IBOutlet weak var alteracaodedadosLabel: UILabel!
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var fullnameTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
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
