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
    
    @IBOutlet weak var borderTextField3: UITextField!
    
    @IBOutlet weak var borderButtonSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageProfile.layer.borderWidth = 1
//        imageProfile.layer.masksToBounds = false
        imageProfile.layer.borderColor = UIColor.blue.cgColor
        imageProfile.layer.cornerRadius = imageProfile.frame.size.height/2
        imageProfile.clipsToBounds = true
        
        fullnameTextField.layer.borderColor = UIColor.red.cgColor
        
        borderButtonSave.layer.cornerRadius = 8
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func editarimagembutton(_ sender: UIButton) {
        
        imageProfile.image = UIImage(systemName: "heart")
        alteracaodedadosLabel.text = "Barbara"
    }
    
    
}
