//
//  DataExerciseCollectionViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 23/03/23.
//

import UIKit

protocol DataExerciseProtocol: AnyObject {
    func passExerciseSettingsData(value: String)
}

class DataExerciseViewController: UIViewController {

    @IBOutlet weak var dataExerciseView: UIView!
    
    @IBOutlet weak var titleExerciseSettingsLabel: UILabel!
    //nome do dados que o app está solicitando do usuário. Ex: Carga, Serie ou Repetições
    @IBOutlet weak var exerciseSettingsTextField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    let customColorOrange = UIColor(named: "OrangeMeuTreino")

    var name: String = ""
    var placeholder: String = ""
    weak private var delegate:
    DataExerciseProtocol?
    
    public func delegate(delegate:
                         DataExerciseProtocol?) {
        self.delegate = delegate
    }
    
    @IBOutlet weak var confirmeSettingsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
     configTextField()
        configTitle()
        exerciseSettingsTextField.keyboardType = UIKeyboardType.numbersAndPunctuation
        exerciseSettingsTextField.layer.borderColor = customColorOrange?.cgColor
        exerciseSettingsTextField.layer.borderWidth = 2
        exerciseSettingsTextField.layer.cornerRadius = 10
        exerciseSettingsTextField.clipsToBounds = true
        
        confirmeSettingsButton.isEnabled = false
        
        dataExerciseView.layer.cornerRadius = 10
        
        confirmButton.layer.cornerRadius = 10
        
    }
    func configTextField() {
        exerciseSettingsTextField.delegate = self
    }
    func configTitle(){
        titleExerciseSettingsLabel.text = "\(name):"
        exerciseSettingsTextField.placeholder = placeholder
    }
    
    @IBAction func tappedConfirmeSettingsButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}

extension DataExerciseViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        exerciseSettingsTextField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.passExerciseSettingsData(value:textField.text!)
        if exerciseSettingsTextField.hasText == true {
            confirmeSettingsButton.isEnabled = true
        } else {
            confirmeSettingsButton.isEnabled = false
        }
    }
    func DataExerciseProtocol(_ textField: UITextField) -> Bool {
        dismiss(animated: true)
        resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
