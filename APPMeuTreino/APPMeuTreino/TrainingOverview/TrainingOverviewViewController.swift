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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTrainingTableView()
        addTrainingButton.layer.cornerRadius = 10
        trainingTableView.separatorStyle = .none
        trainingTableView.isEditing = false
        trainingTableView.allowsSelectionDuringEditing = true
    
        
        // Border PictureImageUser
        
        let borderPicture = UIColor(named: "BlueMeuTreino")
        
        profileImage.layer.borderWidth = 2
                profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = borderPicture?.cgColor
                profileImage.layer.cornerRadius = profileImage.frame.height/2
                profileImage.clipsToBounds = true
        
    }
    
    func configureTrainingTableView(){
        trainingTableView.delegate = self
        trainingTableView.dataSource = self
        trainingTableView.register(TrainingCell.nib(), forCellReuseIdentifier: TrainingCell.identifier)
        
    }
    
    @IBAction func tappedAddTrainingButton(_ sender: UIButton) {
        
        let vc: NameTrainingViewController? = UIStoryboard(name: "NameTrainingViewController", bundle: nil).instantiateViewController(withIdentifier: "NameTrainingViewController") as? NameTrainingViewController
        //vc?.modalPresentationStyle = .formSheet
        present(vc ?? UIViewController(), animated: true)
        
    }
    
    }
    
    extension TrainingOverviewViewController: UITableViewDelegate, UITableViewDataSource{
        
        //configuracao de cada uma das celulas
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = trainingTableView.dequeueReusableCell(withIdentifier: "TrainingCell", for: indexPath) as? TrainingCell{
                cell.configureCell()
                return cell
            }
            return UITableViewCell()
        }
        
        //quantidade de linhas da celula
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        
        //altura das linhas da celula
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
                // Remova a célula do seu array de dados e da table view
                // Exemplo: dataSource.remove(at: indexPath.row)
                //           tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        
        //3.Implemente o método tableView(_:trailingSwipeActionsConfigurationForRowAt:) no seu delegate da table view para adicionar a opção de deletar deslizando a célula para a esquerda:
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Deletar") { _, _, completionHandler in
                completionHandler(true)
            }
            //deleteAction.image = UIImage(systemName: "trash")
            //deleteAction.backgroundColor = .red
            
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
        }
        
        
        
    }
    

