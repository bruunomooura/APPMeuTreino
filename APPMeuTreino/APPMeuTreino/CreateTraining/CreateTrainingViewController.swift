//
//  CreateTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class CreateTrainingViewController: UIViewController {
    
    
    
    @IBOutlet weak var createTrainingCollectionView: UICollectionView!
    var data: [String] = ["Abdominais", "Aeróbico", "Bíceps", "CostasOmbros", "MembrosInferiores", "Peito", "Triceps"]
    var names: [String] = ["cat", "dog", "bark", "car", "chicken", "cow", "plane"]
    //var names = apenas exemplo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCreateTrainingCollectionView()
    }
    // Do any additional setup after loading the view.
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    func configCreateTrainingCollectionView() {
        createTrainingCollectionView.delegate = self
        createTrainingCollectionView.dataSource = self
        if let layout = createTrainingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.estimatedItemSize = .zero
            layout.itemSize = CGSize(width: 100, height: 100)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            
        }
        createTrainingCollectionView.register(CustomCreateTrainingCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCreateTrainingCollectionViewCell.identifier)
    }
}



extension CreateTrainingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCreateTrainingCollectionViewCell.identifier, for: indexPath) as? CustomCreateTrainingCollectionViewCell
        cell?.setupCell(nameImage: data[indexPath.row])
        return cell ?? UICollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(view.frame.size.width - 30)/2, height: (view.frame.size.width - 30)/2)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "ExerciseSelectionViewController", bundle: nil).instantiateViewController(withIdentifier: "ExerciseSelectionViewController") as? ExerciseSelectionViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
        //print(names[indexPath.row])
    }
}



