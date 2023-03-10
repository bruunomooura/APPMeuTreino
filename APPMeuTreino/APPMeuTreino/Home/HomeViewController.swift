//
//  HomeViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var BorderHomeUIView: UIView!
    @IBOutlet weak var ImageUser: UIImageView!
    @IBOutlet weak var BorderProgressBar: UIView!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Border PictureImageUser
        
        let borderPicture = UIColor(named: "BlueMeuTreino")
        
        ImageUser.layer.borderWidth = 1
                ImageUser.layer.masksToBounds = false
        ImageUser.layer.borderColor = borderPicture?.cgColor
                ImageUser.layer.cornerRadius = ImageUser.frame.height/2
                ImageUser.clipsToBounds = true
        
        // Border Progress
        let borderProgress = UIColor(named: "GrayBorderMeuTreino")
        
        BorderProgressBar.layer.borderWidth = 1
        BorderProgressBar.layer.borderColor = borderProgress?.cgColor
        
        BorderProgressBar.clipsToBounds = true
        BorderProgressBar.layer.cornerRadius = 8
        
        
        // Border Home
        let borderHome = UIColor(named: "OrangeMeuTreino")
        
        BorderHomeUIView.layer.borderWidth = 1
        BorderHomeUIView.layer.borderColor = borderHome?.cgColor
        
        BorderHomeUIView.clipsToBounds = true
        BorderHomeUIView.layer.cornerRadius = 8
        
    }
    
}
