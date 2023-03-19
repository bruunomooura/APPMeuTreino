//
//  ExerciseSelectionViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ExerciseSelectionViewController: UIViewController {
    
    @IBOutlet weak var exerciseSelectionCollectionView: UICollectionView!
    var dataWorkouts: [String] = ["AbdominalAlpinista", "AbdominalDeclinado", "AbdominalEmBancoDeclinado", "AbdominalEmV", "AbdominalNaBola"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configExerciseSelectionCollectionView()
    
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedAddExerciseButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func configExerciseSelectionCollectionView() {
        exerciseSelectionCollectionView.delegate = self
        exerciseSelectionCollectionView.dataSource = self
        if let layout = exerciseSelectionCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.estimatedItemSize = .zero
            layout.itemSize = CGSize(width: 300, height: 300)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            
        }
        exerciseSelectionCollectionView.register(CustomExerciseSelectionCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomExerciseSelectionCollectionViewCell.identifier)
    }
}



extension ExerciseSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataWorkouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomExerciseSelectionCollectionViewCell.identifier, for: indexPath) as? CustomExerciseSelectionCollectionViewCell
        cell?.setupCell(nameImage: dataWorkouts[indexPath.row])
        return cell ?? UICollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.frame.width, height: view.frame.width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "CreateTrainingViewController", bundle: nil).instantiateViewController(withIdentifier: "CreateTrainingViewController") as? CreateTrainingViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
        //print(names[indexPath.row])
    }
    
    
    
}
