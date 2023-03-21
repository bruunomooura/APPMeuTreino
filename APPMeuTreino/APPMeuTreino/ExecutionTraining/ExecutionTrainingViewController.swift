//
//  ExecutionTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ExecutionTrainingViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var trainingLabel: UILabel!
    
    @IBOutlet weak var finishTrainingButton: UIButton!
    
    //Delegate DataSource
    @IBOutlet weak var tableView: UITableView!
    
    let exercisesArray: Array = ["Exercício 1", "Exercício 2", "Exercício 3", "Exercício 4", "Exercício 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishTrainingButton.layer.cornerRadius = 10
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension ExecutionTrainingViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de linha nas sessões
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesArray.count
    }
    
    //Numero de células por linhas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = exercisesArray[indexPath.row]
        return cell
    }
    
    //Numero de sessão (Grupos de linhas, como está separado nas configuracoes do iphone) Por padrão o valor vem 1, entao se for só 1 nao precisa implementar essa funçao
    
    //Se quiser permitir o usuario excluir celulas
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath ){
//
//    }
}
