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
    @IBOutlet weak var exerciseSettingsTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var confirmeSettingsButton: UIButton!
    
    var name: String = ""
    var placeholder: String = ""
    weak private var delegate: DataExerciseProtocol?
    
    public func delegate(delegate: DataExerciseProtocol?) {
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDataExerciseView()
        addTapGestureToDismiss()
    }
    
    func configDataExerciseView() {
        exerciseSettingsTextField.keyboardType = UIKeyboardType.numbersAndPunctuation
        exerciseSettingsTextField.layer.borderColor = UIColor.orangeMeuTreino.cgColor
        exerciseSettingsTextField.layer.borderWidth = 2
        exerciseSettingsTextField.layer.cornerRadius = 10
        exerciseSettingsTextField.clipsToBounds = true
        exerciseSettingsTextField.delegate = self
        exerciseSettingsTextField.placeholder = placeholder
        
        confirmeSettingsButton.isEnabled = false
        
        dataExerciseView.layer.cornerRadius = 10
        
        confirmButton.layer.cornerRadius = 10
        
        
        
        titleExerciseSettingsLabel.text = "\(name):"
        
        
        confirmeSettingsButton.addTarget(self, action: #selector(tappedConfirmeSettingsButton(_:)), for: .touchUpInside)
    }
    
    func addTapGestureToDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissView(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: view)
        if !dataExerciseView.frame.contains(tapLocation) {
            dismiss(animated: true)
        }
    }
    
    @objc func tappedConfirmeSettingsButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension DataExerciseViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.passExerciseSettingsData(value: textField.text!)
        if exerciseSettingsTextField.hasText == true {
            confirmeSettingsButton.isEnabled = true
        } else {
            confirmeSettingsButton.isEnabled = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


