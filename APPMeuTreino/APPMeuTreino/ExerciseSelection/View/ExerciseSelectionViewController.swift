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
    
    @IBOutlet weak var exerciseTypeLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var selectedExercisesTypesButton: UIButton!
    @IBOutlet weak var exerciseSelectionCollectionView: UICollectionView!
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    private var viewModel: ExerciseSelecionViewModel = ExerciseSelecionViewModel()

    private var selectedExerciseCount = 0 {
        didSet {
            var title = ""
            if selectedExerciseCount == 0{
                title = ""
            }else{
                title = "\(selectedExerciseCount) Exercício(s) selecionado(s)"
            }
            selectedExercisesTypesButton.setTitle(title, for: .normal)
            selectedExercisesTypesButton.titleLabel?.font = UIFont(name: "Didot", size: 18)
        }
    }
    
    private weak var delegate: ExerciseSelectionViewControllerProtocol?
    
    public func delegate (delegate: ExerciseSelectionViewControllerProtocol?) {
        self.delegate = delegate
    }
    
    private var isCellSelected = false

    private var SelectedCells = Set<IndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configExerciseSelectionView()
    }
    
    func configExerciseSelectionView() {
        addButton.layer.cornerRadius = 10
        addButton.isEnabled = false
        
        exerciseSelectionCollectionView.allowsMultipleSelection = true
        exerciseSelectionCollectionView.delegate = self
        exerciseSelectionCollectionView.dataSource = self
        exerciseSelectionCollectionView.register(ExerciseSelectionCollectionViewCell.nib(), forCellWithReuseIdentifier: ExerciseSelectionCollectionViewCell.identifier)
        
        if let layout = exerciseSelectionCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.estimatedItemSize = .zero
            layout.itemSize = CGSize(width: 300, height: 300)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedAddExerciseButton(_ sender: UIButton) {
        delegate?.transferExerciseSelected(quantity: selectedExerciseCount)
        dismiss(animated: true)
    }
}

extension ExerciseSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.arraySize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseSelectionCollectionViewCell.identifier, for: indexPath) as! ExerciseSelectionCollectionViewCell
        cell.setupCell(exercise: viewModel.getExercise(index: indexPath.row))
        cell.delegate(delegate: self)
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ExerciseSelectionCollectionViewCell{
            cell.backgroundColor =  UIColor(named: "OrangeMeuTreino")
            SelectedCells.insert(indexPath)
            selectedExerciseCount += 1
            cell.numberSeriesSelectionButton.isEnabled = true
            cell.numberRepetitionsSelectionButton.isEnabled = true
            cell.weightSelectionButton.isEnabled = true
        }
        if selectedExerciseCount == 0{
            addButton.isEnabled = false
        } else {
            addButton.isEnabled = true
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ExerciseSelectionCollectionViewCell{
            cell.backgroundColor = .white
            SelectedCells.remove(indexPath)
            selectedExerciseCount -= 1
            cell.numberSeriesSelectionButton.isEnabled = false
            cell.numberRepetitionsSelectionButton.isEnabled = false
            cell.weightSelectionButton.isEnabled = false
        }
        
        if selectedExerciseCount == 0{
            addButton.isEnabled = false
        } else {
            addButton.isEnabled = true
        }
    }
}

extension ExerciseSelectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(view.frame.width)
        return CGSize(width:view.frame.width - 20, height: view.frame.width/3)
    }
}

extension ExerciseSelectionViewController: ExerciseSelectionCollectionViewCellProtocol{
    func addExerciseInformations(name: String) {
        if let vc = UIStoryboard(name: String(describing: DataExerciseViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: DataExerciseViewController.self)) as? DataExerciseViewController{
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
