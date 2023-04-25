//
//  NameTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 26/03/23.
//

import UIKit

class NameTrainingViewController: UIViewController {

    @IBOutlet weak var nameTrainingTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var newTrainingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNameTrainingView()
    }
    
    func configNameTrainingView(){
        
        nameTrainingTextField.delegate = self
        saveButton.isEnabled = false
        
        
        nameTrainingTextField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
        nameTrainingTextField.layer.borderWidth = 2
        nameTrainingTextField.clipsToBounds = true
        nameTrainingTextField.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
        
        newTrainingView.layer.cornerRadius = 10
    }
    
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        let vc: CreateTrainingViewController? = UIStoryboard(name: "CreateTrainingViewController", bundle: nil).instantiateViewController(withIdentifier: "CreateTrainingViewController") as? CreateTrainingViewController
        vc?.modalPresentationStyle = .fullScreen
        present(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedCancelButton(_ sender: UIButton) {
        dismiss(animated: true)
        }
}

extension NameTrainingViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.hasText == true {
            textField.layer.borderColor = UIColor(named: "OrangeMeuTreino")?.cgColor
            saveButton.isEnabled = true
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            saveButton.isEnabled = false
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTrainingTextField.resignFirstResponder()
    }
}
