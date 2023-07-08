import UIKit

protocol ExecutionTrainingViewControllerProtocol: AnyObject {
    func configureTabBarIndex()
}

class ExecutionTrainingViewController: UIViewController {
    
    @IBOutlet weak var trainingLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    private var viewModel: ExecutionTrainingViewModel = ExecutionTrainingViewModel()
    private weak var delegate: ExecutionTrainingViewControllerProtocol?
    
    public func delegate(delegate: ExecutionTrainingViewControllerProtocol?) {
        self.delegate = delegate
    }
    
    public func setWorkout(workout: Workout) {
        viewModel.setWorkout(workout: workout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureExecutionTrainingView()
    }
    
    func configureExecutionTrainingView(){
        finishButton.layer.cornerRadius = 10
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ExecutionTrainingCollectionViewCell.nib(), forCellWithReuseIdentifier: ExecutionTrainingCollectionViewCell.identifier)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.estimatedItemSize = .zero
        }
  
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedFinishButton(_ sender: UIButton) {
        let vc: TrainingConclusionViewController? = UIStoryboard(name: String(describing: TrainingConclusionViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TrainingConclusionViewController.self)) as? TrainingConclusionViewController
        vc?.delegate(delegate: self)
        present(vc ?? UIViewController(), animated: true)
    }
}

extension ExecutionTrainingViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.arraySize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExecutionTrainingCollectionViewCell.identifier, for: indexPath) as? ExecutionTrainingCollectionViewCell
        cell?.setupCell(exercise: viewModel.getExercise(index: indexPath.row))
        cell?.delegate(delegate: self)
            return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: String(describing: DemonstrationExerciseViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: DemonstrationExerciseViewController.self)) as? DemonstrationExerciseViewController{
            vc.modalPresentationStyle = .pageSheet
            present(vc, animated: true)
        }
    }
}

extension ExecutionTrainingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width/3)
    }

}

extension ExecutionTrainingViewController: ExecutionTrainingCollectionViewCellProtocol{
    
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

extension ExecutionTrainingViewController: TrainingConclusionViewControllerProtocol{
    func configureTabBarIndex() {
        delegate?.configureTabBarIndex()
    }
}
