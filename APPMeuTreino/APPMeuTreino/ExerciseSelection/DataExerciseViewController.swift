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

    @IBOutlet weak var titleExerciseSettingsLabel: UILabel!
    //nome do dados que o app está solicitando do usuário. Ex: Carga, Serie ou Repetições
    @IBOutlet weak var exerciseSettingsTextField: UITextField!
    
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
    }
    func configTextField() {
        exerciseSettingsTextField.delegate = self
    }
    func configTitle(){
        titleExerciseSettingsLabel.text = "\(name):"
        exerciseSettingsTextField.placeholder = placeholder
    }
    

    
    @IBAction func tappedConfirmeSettingsButton(_ sender: UIButton) {
    }
    

}

extension DataExerciseViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.passExerciseSettingsData(value:
                                            textField.text!)
    }
    func DataExerciseProtocol(_ textField: UITextField) -> Bool {
        dismiss(animated: true)
        resignFirstResponder()
        return true
    }
}
