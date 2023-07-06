//
//  CreateTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

protocol CreateTrainingViewControllerProtocol: AnyObject {
    func configureTabBarIndex()
}

class CreateTrainingViewController: UIViewController {
    
    
    @IBOutlet weak var exerciseCountButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var createTrainingCollectionView: UICollectionView!
    @IBOutlet weak var searchExerciseSearchBar: UISearchBar!
    
    private let viewModel: CreateTrainingViewModel = CreateTrainingViewModel()
    
    private var selectedExerciseCount = 0 {
        didSet {
            var title = ""
            if selectedExerciseCount == 0{
                title = ""
            }else{
                title = "\(selectedExerciseCount) Exercício(s) selecionado(s)"
            }
            exerciseCountButton.setTitle(title, for: .normal)
            exerciseCountButton.titleLabel?.font = UIFont(name: "Didot", size: 18)
        }
    }
    
    private weak var delegate: CreateTrainingViewControllerProtocol?
    public func delegate(delegate: CreateTrainingViewControllerProtocol?) {
        self.delegate = delegate
    }
    
    private var isCellSelected = false

    private var SelectedCells = Set<IndexPath>()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configCreateTrainingView()
        viewModel.fetchAllRequest()
//        viewModel.delegate(delegate: self)
//        viewModel.fetch()
    }
    
    func configCreateTrainingView(){
        finishButton.layer.cornerRadius = 10
        finishButton.isEnabled = false
    
        searchExerciseSearchBar.delegate = self
        searchExerciseSearchBar.placeholder = "Buscar exercício"
        
        createTrainingCollectionView.allowsMultipleSelection = true
        createTrainingCollectionView.delegate = self
        createTrainingCollectionView.dataSource = self
        createTrainingCollectionView.register(CreateTrainingCollectionViewCell.nib(), forCellWithReuseIdentifier: CreateTrainingCollectionViewCell.identifier)
        
        if let layout = createTrainingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
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

    @IBAction func tappedConclusionButton(_ sender: UIButton) {
        delegate?.configureTabBarIndex()
        var presentingViewController = self.presentingViewController
        while presentingViewController?.presentingViewController != nil {
            presentingViewController = presentingViewController?.presentingViewController
        }
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension CreateTrainingViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchExerciseSearchBar.resignFirstResponder()
        searchExerciseSearchBar.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension CreateTrainingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.arraySize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateTrainingCollectionViewCell.identifier, for: indexPath) as! CreateTrainingCollectionViewCell
        cell.setupCell(exercise: viewModel.getExerciseType(index: indexPath.row))
        cell.delegate(delegate: self)
        if SelectedCells.contains(indexPath) {
            cell.backgroundColor = .orangeMeuTreino
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
        if let cell = collectionView.cellForItem(at: indexPath) as? CreateTrainingCollectionViewCell{
            cell.backgroundColor = .orangeMeuTreino
            SelectedCells.insert(indexPath)
            selectedExerciseCount += 1
            cell.numberSeriesSelectionButton.isEnabled = true
            cell.numberRepetitionsSelectionButton.isEnabled = true
            cell.weightSelectionButton.isEnabled = true
        }
        if selectedExerciseCount == 0{
            finishButton.isEnabled = false
        } else {
            finishButton.isEnabled = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CreateTrainingCollectionViewCell{
            cell.backgroundColor = .white
            SelectedCells.remove(indexPath)
            selectedExerciseCount -= 1
            cell.numberSeriesSelectionButton.isEnabled = false
            cell.numberRepetitionsSelectionButton.isEnabled = false
            cell.weightSelectionButton.isEnabled = false
        }
        if selectedExerciseCount == 0{
            finishButton.isEnabled = false
        } else {
            finishButton.isEnabled = true
        }
    }
}
        
extension CreateTrainingViewController: UICollectionViewDelegateFlowLayout{
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                print(view.frame.width)
                return CGSize(width:view.frame.width - 20, height: view.frame.width/3)
            }
        }
        
//extension CreateTrainingViewController: CreateTrainingViewModelProtocol {
//            func success() {
//                print("sucess")
//            }
//
//            func error() {
//                print("error")
//            }
//    }

extension CreateTrainingViewController: CreateTrainingCollectionViewCellProtocol{
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
