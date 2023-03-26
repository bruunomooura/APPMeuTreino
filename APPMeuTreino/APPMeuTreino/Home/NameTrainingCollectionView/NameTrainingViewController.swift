//
//  NameTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 26/03/23.
//

import UIKit

class NameTrainingViewController: UIViewController {

    
    @IBOutlet weak var nameTrainingTextField: UITextField!
    
    let customColorOrange = UIColor(named: "OrangeMeuTreino")
    
    
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTrainingTextField.delegate = self
        saveButton.isEnabled = false 
        
        
        nameTrainingTextField.layer.borderColor = customColorOrange?.cgColor
        nameTrainingTextField.layer.borderWidth = 2
        nameTrainingTextField.clipsToBounds = true
        nameTrainingTextField.layer.cornerRadius = 8
    }
    
    
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedCancelButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NameTrainingViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
 
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTrainingTextField.hasText == true {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
//    func DataExerciseProtocol(_ textField: UITextField) -> Bool {
//        dismiss(animated: true)
//        resignFirstResponder()
//        return true
    //}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
