//
//  CreateTrainingViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class CreateTrainingViewController: UIViewController {
    
    @IBOutlet weak var exerciseCountButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var createTrainingCollectionView: UICollectionView!
    @IBOutlet weak var searchExerciseSearchBar: UISearchBar!
    
    private let viewModel: CreateTrainingViewModel = CreateTrainingViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configCreateTrainingView()
    }
    
    func configCreateTrainingView(){
        finishButton.layer.cornerRadius = 10
        finishButton.isEnabled = false
    
        searchExerciseSearchBar.delegate = self
        searchExerciseSearchBar.placeholder = "Buscar exercício"

        createTrainingCollectionView.delegate = self
        createTrainingCollectionView.dataSource = self
        createTrainingCollectionView.register(CreateTrainingCollectionViewCell.nib(), forCellWithReuseIdentifier: CreateTrainingCollectionViewCell.identifier)
        
        if let layout = createTrainingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.estimatedItemSize = .zero
            layout.itemSize = CGSize(width: 100, height: 100)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func tappedConclusionButton(_ sender: UIButton) {
        if let tabBarController = UIStoryboard(name: String(describing: TabBarControllerViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarControllerViewController.self)) as? TabBarControllerViewController {
            tabBarController.selectedViewController = tabBarController.viewControllers?[1]
            present(tabBarController, animated: true)
        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateTrainingCollectionViewCell.identifier, for: indexPath) as? CreateTrainingCollectionViewCell
        cell?.setupCell(exerciseType: viewModel.getExerciseType(index: indexPath.row))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: String(describing: ExerciseSelectionViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ExerciseSelectionViewController.self)) as? ExerciseSelectionViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.delegate(delegate: self)
            present(vc, animated: true)
        }
    }
}

extension CreateTrainingViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(view.frame.size.width - 30)/2, height: (view.frame.size.width - 30)/2)
    }
}

extension CreateTrainingViewController : ExerciseSelectionViewControllerProtocol {
    
    func transferExerciseSelected(quantity: Int) {
        if quantity == 0{
            finishButton.isEnabled = false
        } else {
            finishButton.isEnabled = true
        }
        exerciseCountButton.setTitle("\(quantity) Exercício(s) selecionado(s)", for: .normal)
    }
}


