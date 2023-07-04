import UIKit

class TrainingOverviewViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var trainingTableView: UITableView!
    @IBOutlet weak var addTrainingButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    private var viewModel: TrainingOverviewViewModel = TrainingOverviewViewModel()
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTrainingTableView()
        configCell()
        configureUserInfo()
        startUpdatingDate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopUpdatingDate()
    }
    
    func configureUserInfo() {
        if let userName = UserDefaults.standard.string(forKey: "UserName") {
            greetingLabel.text = "Olá, \(userName)!"
        }

        if let imageData = UserDefaults.standard.data(forKey: "UserImage") {
            let userImage = UIImage(data: imageData)
            profileImageView.image = userImage
        }
    }
    
    func startUpdatingDate() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateDate), userInfo: nil, repeats: true)
        timer?.tolerance = 0.1
        timer?.fire()
    }
    
    func stopUpdatingDate() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateDate() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E dd/MM/yyyy"
            let currentDate = Date()
            var formattedDate = dateFormatter.string(from: currentDate)
            if let firstChar = formattedDate.first {
                formattedDate.replaceSubrange(formattedDate.startIndex...formattedDate.startIndex, with: String(firstChar).capitalized)
            }
            dateLabel.text = formattedDate
        }
    
    func configureTrainingTableView(){
        trainingTableView.delegate = self
        trainingTableView.dataSource = self
        trainingTableView.register(TrainingCell.nib(), forCellReuseIdentifier: TrainingCell.identifier)
    }
    
    func configCell(){
        addTrainingButton.layer.cornerRadius = 10
        
        trainingTableView.separatorStyle = .none
        trainingTableView.isEditing = false
        trainingTableView.allowsSelectionDuringEditing = true

        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.blueMeuTreino.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
    }
    
    @IBAction func tappedAddTrainingButton(_ sender: UIButton) {
        let vc: NameTrainingViewController? = UIStoryboard(name: String(describing: NameTrainingViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: NameTrainingViewController.self)) as? NameTrainingViewController
        present(vc ?? UIViewController(), animated: true)
        
    }
    
}

extension TrainingOverviewViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = trainingTableView.dequeueReusableCell(withIdentifier: String(describing: TrainingCell.self), for: indexPath) as? TrainingCell{
            cell.configureCell()
            cell.setupCell(training: viewModel.getTraining(index: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arraySize
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: String(describing: ExecutionTrainingViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ExecutionTrainingViewController.self)) as? ExecutionTrainingViewController{
            vc.modalPresentationStyle = .fullScreen
            vc.delegate(delegate: self)
            present(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Deletar") { _, _, completionHandler in
                completionHandler(true)
            self.viewModel.deleteTraining(index: indexPath.row)
            self.trainingTableView.reloadData()
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}

extension TrainingOverviewViewController: ExecutionTrainingViewControllerProtocol{
    func configureTabBarIndex() {
        tabBarController?.selectedIndex = 0
    }
}
