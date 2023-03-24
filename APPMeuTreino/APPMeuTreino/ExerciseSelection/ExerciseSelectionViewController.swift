//
//  ExerciseSelectionViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class ExerciseSelectionViewController: UIViewController {
    
    @IBOutlet weak var exerciseSelectionCollectionView: UICollectionView!
    private var dataWorkouts: [String] = ["AbdominalAlpinista", "AbdominalDeclinado", "AbdominalEmBancoDeclinado", "AbdominalEmV", "AbdominalNaBola"]
    private var exerciseName: [String] = ["Abdominal Alpinista", "Abdominal Declinado", "Abdominal Em Banco Declinado", "Abdominal Em V", "Abdominal Na Bola"]

    var itemSelected = false
    
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
        cell?.delegate(delegate: self)
        cell?.setupCell(nameImage: dataWorkouts[indexPath.row], exerciseName: exerciseName[indexPath.row])
        return cell ?? UICollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(view.frame.width)
        return CGSize(width:view.frame.width, height: view.frame.width/3)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if itemSelected{
            collectionView.cellForItem(at: indexPath)?.backgroundColor = .white
            itemSelected = true
        } else {
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(named: "OrangeMeuTreino")
            itemSelected = false
        }
    
        
        //assinar o delegate do protocolo igual a self
//        if let vc = UIStoryboard(name: "CreateTrainingViewController", bundle: nil).instantiateViewController(withIdentifier: "CreateTrainingViewController") as? CreateTrainingViewController {
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
     //   }
        //print(names[indexPath.row])
    }
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        collectionView.cellForItem(at: indexPath)?.backgroundColor = .orange
//    }
    
    
    
}
//criar extension com assinatura do protocolo e método
//dentro do método criar uma vc e mostrala

extension ExerciseSelectionViewController: CustomExerciseSelectionCollectionViewCellProtocol{
    func addExerciseInformations(name: String) {
        if let vc = UIStoryboard(name: "DataExerciseViewController", bundle: nil).instantiateViewController(withIdentifier: "DataExerciseViewController") as? DataExerciseViewController{
            vc.name = name
            if name == "Séries" {
                vc.placeholder = "Nº de Séries"
            } else if name == "Reps"{
                vc.placeholder = "Nº de Repetições"
            } else {
                vc.placeholder = "Carga em Kg"            }
            present(vc, animated: true)
        }
        
    }
}
