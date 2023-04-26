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
    
    private var vielModel: ExecutionTrainingVielModel = ExecutionTrainingVielModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ExecutionTainingCollectionViewCell.nib(), forCellWithReuseIdentifier: ExecutionTainingCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
        collectionView.collectionViewLayout = layout
        
        finishButton.layer.cornerRadius = 10
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedFinishTrainingButton(_ sender: UIButton) {
        let vc: TrainingConclusionViewController? = UIStoryboard(name: String(describing: TrainingConclusionViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TrainingConclusionViewController.self)) as? TrainingConclusionViewController
        present(vc ?? UIViewController(), animated: true)
    }
}

extension ExecutionTrainingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExecutionTainingCollectionViewCell.identifier, for: indexPath) as? ExecutionTainingCollectionViewCell{
            cell.configureCell(exercise: vielModel.getExercise(index: indexPath.row))
            cell.delegate(delegate: self)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vielModel.arraySize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: String(describing: DemonstrationExerciseViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: DemonstrationExerciseViewController.self)) as? DemonstrationExerciseViewController{
            vc.modalPresentationStyle = .pageSheet
            present(vc, animated: true)
        }
    }
}

extension ExecutionTrainingViewController: ExecutionTainingCollectionViewCellProtocol{
    func addExerciseInformation(name: String) {
        if let vc = UIStoryboard(name: String(describing: DataExerciseViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: DataExerciseViewController.self)) as? DataExerciseViewController{
            vc.name = name
            if name == "Séries" {
                vc.placeholder = "Nº de Séries"
            } else if name == "Reps"{
                vc.placeholder = "Nº de Repetições"
            } else {
                vc.placeholder = "Carga em Kg"
            }
            present(vc, animated: true)
        }
    }    
}
