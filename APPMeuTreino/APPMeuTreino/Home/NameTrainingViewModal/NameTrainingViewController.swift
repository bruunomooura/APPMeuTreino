//
//  NameTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 26/03/23.
//

import UIKit

protocol NameTrainingViewControllerProtocol: AnyObject {
    func configureTabBarIndex()
}

class NameTrainingViewController: UIViewController {

    @IBOutlet weak var nameTrainingTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var newTrainingView: UIView!
    
    private weak var viewControllerDelegate: NameTrainingViewControllerProtocol?
      
    public func setViewControllerDelegate(_ delegate: NameTrainingViewControllerProtocol?) {
          self.viewControllerDelegate = delegate
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNameTrainingView()
    }
    
    func configNameTrainingView(){
        nameTrainingTextField.delegate = self

        nameTrainingTextField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        nameTrainingTextField.layer.borderWidth = 2
        nameTrainingTextField.clipsToBounds = true
        nameTrainingTextField.layer.cornerRadius = 10
        
        cancelButton.layer.cornerRadius = 10
        
        saveButton.layer.cornerRadius = 10
        saveButton.isEnabled = false
        
        newTrainingView.layer.cornerRadius = 10
        newTrainingView.layer.masksToBounds = false
        newTrainingView.layer.shadowColor = UIColor.lightGray.cgColor
        newTrainingView.layer.shadowOffset = CGSize(width: 1, height: 1)
        newTrainingView.layer.shadowOpacity = 1
        newTrainingView.layer.shadowRadius = 8
        newTrainingView.layer.borderWidth = 2
        newTrainingView.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        newTrainingView.backgroundColor = .white
        newTrainingView.clipsToBounds = true
    }
    
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        let vc: CreateTrainingViewController? = UIStoryboard(name: String(describing: CreateTrainingViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: CreateTrainingViewController.self)) as? CreateTrainingViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedCancelButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        }
}

extension NameTrainingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTrainingTextField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.hasText == true {
            textField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
            saveButton.isEnabled = true
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            saveButton.isEnabled = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension NameTrainingViewController: CreateTrainingViewControllerProtocol{
    func configureTabBarIndex() {
        viewControllerDelegate?.configureTabBarIndex()
        print("teste")
    }
}
