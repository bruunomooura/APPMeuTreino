//
//  ExerciseSelectionViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

protocol ExerciseSelectionViewControllerProtocol: AnyObject {
    func transferExerciseSelected (quantity: Int)
        
    
}


class ExerciseSelectionViewController: UIViewController {
    
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var selectedExercisesTypesButton: UIButton!
    @IBOutlet weak var exerciseSelectionCollectionView: UICollectionView!
    private var dataWorkouts: [String] = ["AbdominalAlpinista", "AbdominalDeclinado", "AbdominalEmBancoDeclinado", "AbdominalEmV", "AbdominalNaBola"]
    private var exerciseName: [String] = ["Abdominal Alpinista", "Abdominal Declinado", "Abdominal Em Banco Declinado", "Abdominal Em V", "Abdominal Na Bola"]
    private var selectedExerciseCount = 0 {
        didSet {
            let title = "\(selectedExerciseCount) Exercício(s) selecionado(s)"
            selectedExercisesTypesButton.setTitle(title, for: .normal)
            selectedExercisesTypesButton.titleLabel?.font = UIFont(name: "Didot", size: 18)
        }
    }
//    private var selectedCells: [IndexPath] = []
    private weak var delegate: ExerciseSelectionViewControllerProtocol?
    public func delegate (delegate: ExerciseSelectionViewControllerProtocol?) {
        self.delegate = delegate
    }


    var itemSelected = false
    
    private var isCellSelected = false

    private var SelectedCells = Set<IndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configExerciseSelectionCollectionView()
            exerciseSelectionCollectionView.allowsMultipleSelection = true
            
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedAddExerciseButton(_ sender: UIButton) {
        delegate?.transferExerciseSelected(quantity: selectedExerciseCount)
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
            addButton.layer.cornerRadius = 10
        }
        exerciseSelectionCollectionView.register(CustomExerciseSelectionCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomExerciseSelectionCollectionViewCell.identifier)
    }
}



extension ExerciseSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataWorkouts.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomExerciseSelectionCollectionViewCell.identifier, for: indexPath) as? CustomExerciseSelectionCollectionViewCell
//        cell?.delegate(delegate: self)
//        cell?.setupCell(nameImage: dataWorkouts[indexPath.row], exerciseName: exerciseName[indexPath.row])
//        return cell ?? UICollectionViewCell()
//
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomExerciseSelectionCollectionViewCell.identifier, for: indexPath) as! CustomExerciseSelectionCollectionViewCell
        cell.delegate(delegate: self)
        cell.setupCell(nameImage: dataWorkouts[indexPath.row], exerciseName: exerciseName[indexPath.row])
        if SelectedCells.contains(indexPath) {
            cell.backgroundColor = UIColor(named: "OrangeMeuTreino")
            isCellSelected = true

        } else {
            cell.backgroundColor = .white
            isCellSelected = false
        }
        cell.numberSeriesSelectionButton.isEnabled = isCellSelected
        cell.numberRepetitionsSelectionButton.isEnabled = isCellSelected
        cell.weightSelectionButton.isEnabled = isCellSelected
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 2
        cell.layer.shadowOffset = CGSize.zero
        cell.layer.shadowOpacity = 0.7
        cell.layer.masksToBounds = false
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(view.frame.width)
        return CGSize(width:view.frame.width - 20, height: view.frame.width/3)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomExerciseSelectionCollectionViewCell{
            cell.backgroundColor =  UIColor(named: "OrangeMeuTreino")
            SelectedCells.insert(indexPath)
            selectedExerciseCount += 1
            cell.numberSeriesSelectionButton.isEnabled = true
            cell.numberRepetitionsSelectionButton.isEnabled = true
            cell.weightSelectionButton.isEnabled = true
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomExerciseSelectionCollectionViewCell{
            cell.backgroundColor = .white
            SelectedCells.remove(indexPath)
            selectedExerciseCount -= 1
            cell.numberSeriesSelectionButton.isEnabled = false
            cell.numberRepetitionsSelectionButton.isEnabled = false
            cell.weightSelectionButton.isEnabled = false
        }
    }
    
        func updateSelectionCount() {
            let count = exerciseSelectionCollectionView.indexPathsForSelectedItems?.count ?? 0
            print("Number of selected items: \(count)")
        }
        
    }

        //assinar o delegate do protocolo igual a self
//        if let vc = UIStoryboard(name: "CreateTrainingViewController", bundle: nil).instantiateViewController(withIdentifier: "CreateTrainingViewController") as? CreateTrainingViewController {
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
     //   }
        //print(names[indexPath.row])
//    }
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        collectionView.cellForItem(at: indexPath)?.backgroundColor = .orange
//    }
    
    
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
