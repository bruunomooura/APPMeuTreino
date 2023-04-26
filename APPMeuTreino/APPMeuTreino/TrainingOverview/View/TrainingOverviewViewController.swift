//
//  TrainingOverviewViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class TrainingOverviewViewController: UIViewController {
    
    @IBOutlet weak var trainingTableView: UITableView!
    @IBOutlet weak var addTrainingButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    private var viewModel: TrainingOverviewViewModel = TrainingOverviewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTrainingTableView()
        configCell()
        
    }
    
    func configureTrainingTableView(){
        trainingTableView.delegate = self
        trainingTableView.dataSource = self
        trainingTableView.register(TrainingCell.nib(), forCellReuseIdentifier: TrainingCell.identifier)
        
    }
    
    func configCell(){
        addTrainingButton.layer.cornerRadius = 10
        trainingTableView.separatorStyle = .none
        trainingTableView.isEditing = false
        trainingTableView.allowsSelectionDuringEditing = true
    
        
        let borderPicture = UIColor(named: "BlueMeuTreino")
        
        profileImage.layer.borderWidth = 2
                profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = borderPicture?.cgColor
                profileImage.layer.cornerRadius = profileImage.frame.height/2
                profileImage.clipsToBounds = true
        
    }
    
    @IBAction func tappedAddTrainingButton(_ sender: UIButton) {
        
        let vc: NameTrainingViewController? = UIStoryboard(name: "NameTrainingViewController", bundle: nil).instantiateViewController(withIdentifier: "NameTrainingViewController") as? NameTrainingViewController
        //vc?.modalPresentationStyle = .formSheet
        present(vc ?? UIViewController(), animated: true)
        
    }
    
    }
    
    extension TrainingOverviewViewController: UITableViewDelegate, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = trainingTableView.dequeueReusableCell(withIdentifier: "TrainingCell", for: indexPath) as? TrainingCell{
                cell.configureCell()
                cell.setupCell(training: viewModel.getTraining(index: indexPath.row))
                return cell
            }
            return UITableViewCell()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.arraySize
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 105
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let vc = UIStoryboard(name: "ExecutionTrainingViewController", bundle: nil).instantiateViewController(withIdentifier: "ExecutionTrainingViewController") as? ExecutionTrainingViewController{
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
            }
        }
        
        //funcao para deslizar e deletar
        //1. Implemente o método tableView(_:canEditRowAt:) no seu delegate da table view para permitir que as células sejam editáveis:
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        //2.Implemente o método tableView(_:commit:forRowAt:) no seu delegate da table view para lidar com a exclusão da célula:
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
            }
        }
        
        //3.Implemente o método tableView(_:trailingSwipeActionsConfigurationForRowAt:) no seu delegate da table view para adicionar a opção de deletar deslizando a célula para a esquerda:
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Deletar") { _, _, completionHandler in
                completionHandler(true)
                self.viewModel.deleteTraining(index: indexPath.row)
                self.trainingTableView.reloadData()
            }
            
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
        }
    }
    

