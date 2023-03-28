//
//  ExecutionTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ExecutionTrainingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var finishButton: UIButton!
    
    var imagesArray: [String] = [ "Exercicio1","Exercicio2","Exercicio3","Exercicio4","Exercicio5"]
    
    var namesArray: [String] = ["Abdominal Em V","Cabo De Guerra - Ondas Alternadas","Biceps Alternado Com Máquina","Agachamento Com Halteres","Desenvolvimento Com Halteres" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        finishButton.layer.cornerRadius = 10
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedFinishButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionExecutionTainingViewCell.nib(), forCellWithReuseIdentifier: CollectionExecutionTainingViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
        collectionView.collectionViewLayout = layout
    }
    
    
}

extension ExecutionTrainingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionExecutionTainingViewCell.identifier, for: indexPath) as? CollectionExecutionTainingViewCell{
            cell.configureCell(name: namesArray[indexPath.row], nameImage: imagesArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "DemonstrationExerciseViewController", bundle: nil).instantiateViewController(withIdentifier: "DemonstrationExerciseViewController") as? DemonstrationExerciseViewController{
            vc.modalPresentationStyle = .fullScreen
              present(vc, animated: true)
           }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let vc = UIStoryboard(name: "ExecutionTrainingViewController", bundle: nil).instantiateViewController(withIdentifier: "ExecutionTrainingViewController") as? ExecutionTrainingViewController{
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
//        }
//    }
}
