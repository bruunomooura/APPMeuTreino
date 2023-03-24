//
//  ExecutionTableViewCell.swift
//  APPMeuTreino
//
//  Created by Leonardo Lacerda on 23/03/23.
//

import UIKit

class ExecutionTableViewCell: UITableViewCell {
    
    let weight: [String] = ["1 kg","2 kg", "3 kg","4 kg","5 kg", "6 kg","7 kg","8 kg", "9 kg","10 kg"]

    @IBOutlet weak var label: UILabel!
        
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var weightPickerView: UIPickerView!
    
    @IBOutlet weak var workoutPickerView: UIPickerView!
    
    @IBOutlet weak var exerciseImageView: UIImageView!
    
    static let identifier: String = "ExecutionTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(exerciseName: String, exerciseImage: String){
        label.text = exerciseName
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        weightPickerView.delegate = self
        weightPickerView.dataSource = self
        weightPickerView.layer.cornerRadius = 10
        workoutPickerView.delegate = self
        workoutPickerView.dataSource = self
        workoutPickerView.layer.cornerRadius = 10
        exerciseImageView.image = UIImage(named: exerciseImage)
    }
    
}

extension ExecutionTableViewCell: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        weight.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }

        label.font = UIFont(name: "Futura Bold", size: 10)
        label.textColor = UIColor.white
        label.text = weight[row]
        label.textAlignment = NSTextAlignment.center
        return label

    }
    
}
