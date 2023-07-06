//
//  HomeViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var borderHomeView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var borderProgressBarView: UIView!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var receiveName: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHomeView()
        configNameLabel()
        configUserImage()
    }
    
    func configUserImage() {
        if let imageData = UserDefaults.standard.data(forKey: "UserImage") {
            let image = UIImage(data: imageData)
            userImageView.image = image
        }
    }
    
    func configNameLabel() {
        if let name = UserDefaults.standard.string(forKey: "UserName") {
            userNameLabel.text = name
        }
    }
    
    func configHomeView(){
        
        addButton.layer.cornerRadius = 10
        
        userImageView.layer.borderWidth = 2
        userImageView.layer.masksToBounds = false
        userImageView.layer.borderColor = UIColor.blueMeuTreino.cgColor
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.clipsToBounds = true
        
        borderProgressBarView.layer.cornerRadius = 8
        borderProgressBarView.layer.shadowColor = UIColor.lightGray.cgColor
        borderProgressBarView.layer.shadowOffset = CGSize.zero
        borderProgressBarView.layer.shadowOpacity = 0.7
        borderProgressBarView.layer.masksToBounds = false
        borderProgressBarView.layer.shadowRadius = 3
        
        borderHomeView.layer.borderWidth = 2
        borderHomeView.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        borderHomeView.clipsToBounds = true
        borderHomeView.layer.cornerRadius = 8
    }
    
    @IBAction func tappedAddTrainingButton(_ sender: UIButton) {
        let vc: NameTrainingViewController? = UIStoryboard(name: String(describing: NameTrainingViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: NameTrainingViewController.self)) as? NameTrainingViewController
        vc?.setViewControllerDelegate(self)
        present(vc ?? UIViewController(), animated: true)
    }
}

extension HomeViewController: NameTrainingViewControllerProtocol{
    func configureTabBarIndex() {
        tabBarController?.selectedIndex = 1
    }
}
