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
    
    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTrainingTableView()
        addTrainingButton.layer.cornerRadius = 10
        trainingTableView.separatorStyle = .none
        beginButton.layer.cornerRadius = 10
        
    
        
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
        
    }
    

