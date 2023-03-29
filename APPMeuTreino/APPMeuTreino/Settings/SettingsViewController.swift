//
//  SettingsViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var backgroundTextField1: UIButton!
    
    @IBOutlet weak var backgroundTextField2: UIButton!
    
    @IBOutlet weak var backgroundTextField3: UIButton!
    
    override func viewDidLoad() {        super.viewDidLoad()
        imageProfile.layer.borderWidth = 2
        imageProfile.layer.masksToBounds = false
        imageProfile.layer.borderColor = UIColor(named: "BlueMeuTreino")?.cgColor
        imageProfile.layer.cornerRadius = imageProfile.frame.height/2
        imageProfile.clipsToBounds = true
        
        backgroundTextField1.layer.cornerRadius = 8
        backgroundTextField2.layer.cornerRadius = 8
        backgroundTextField3.layer.cornerRadius = 8
        
    }
    
    

}


