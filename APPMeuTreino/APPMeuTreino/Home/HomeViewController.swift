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
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 10
        
        
        // Border PictureImageUser
        
        let borderPicture = UIColor(named: "BlueMeuTreino")
        
        ImageUser.layer.borderWidth = 2
                ImageUser.layer.masksToBounds = false
        ImageUser.layer.borderColor = borderPicture?.cgColor
                ImageUser.layer.cornerRadius = ImageUser.frame.height/2
                ImageUser.clipsToBounds = true
        
        // Border Progress
        let borderProgress = UIColor.lightGray
        
        //BorderProgressBar.layer.borderWidth = 2
        //BorderProgressBar.layer.borderColor = borderProgress?.cgColor
        
        //BorderProgressBar.clipsToBounds = true
        BorderProgressBar.layer.cornerRadius = 8
        BorderProgressBar.layer.shadowColor = borderProgress.cgColor
        BorderProgressBar.layer.shadowOffset = CGSize.zero
        BorderProgressBar.layer.shadowOpacity = 0.7
        BorderProgressBar.layer.masksToBounds = false
        BorderProgressBar.layer.shadowRadius = 3
        
        
        
        // Border Home
        let borderHome = UIColor(named: "OrangeMeuTreino")
        
        BorderHomeUIView.layer.borderWidth = 2
        BorderHomeUIView.layer.borderColor = borderHome?.cgColor
        BorderHomeUIView.layer.backgroundColor = borderHome?.cgColor
        
        BorderHomeUIView.clipsToBounds = true
        BorderHomeUIView.layer.cornerRadius = 8
//        BorderHomeUIView.layer.shadowColor = UIColor.lightGray.cgColor
//        BorderHomeUIView.layer.shadowOffset = CGSize.zero
//        BorderHomeUIView.layer.shadowOpacity = 1
//        BorderHomeUIView.layer.masksToBounds = false
//        BorderHomeUIView.layer.shadowRadius = 3
        
    }
    
}
