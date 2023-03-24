//
//  ExecutionTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ExecutionTrainingViewController: UIViewController {
    
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var trainingLabel: UILabel!
    
    @IBOutlet weak var finishTrainingButton: UIButton!
      
    @IBOutlet weak var tableView: UITableView!
    
    struct Exercise {
        let title: String
        let imageName: String
    }
    
    let exercise: [Exercise] = [
        Exercise(title: "Abdominal em V", imageName: "Exercicio1"),
        Exercise(title: "Cabo de Guerra - Ondas Alternadas", imageName: "Exercicio2"),
        Exercise(title: "Bíceps alternado com máquina", imageName: "Exercicio3"),
        Exercise(title: "Agachamento com halteres", imageName: "Exercicio4"),
        Exercise(title: "Desenvolvimento com halteres", imageName: "Exercicio5")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishTrainingButton.layer.cornerRadius = 10
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExecutionTableViewCell.nib(), forCellReuseIdentifier: ExecutionTableViewCell.identifier)
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension ExecutionTrainingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped on row: \(indexPath.row)!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exercise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ExecutionTableViewCell", for: indexPath) as? ExecutionTableViewCell{
            cell.configureCell(exerciseName: exercise[indexPath.row].title, exerciseImage: exercise[indexPath.row].imageName)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
}
