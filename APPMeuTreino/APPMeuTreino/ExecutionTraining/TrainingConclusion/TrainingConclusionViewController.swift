import UIKit

protocol TrainingConclusionViewControllerProtocol: AnyObject {
    func configureTabBarIndex()
}

class TrainingConclusionViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var text1Label: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!

    private weak var delegate: TrainingConclusionViewControllerProtocol?
    public func delegate(delegate: TrainingConclusionViewControllerProtocol?) {
        self.delegate = delegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTrainingConclusionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            delegate?.configureTabBarIndex()
            var presentingViewController = self.presentingViewController
            while presentingViewController?.presentingViewController != nil {
                presentingViewController = presentingViewController?.presentingViewController
            }
            presentingViewController?.dismiss(animated: true, completion: nil)
        }

    func configTrainingConclusionView() {
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.blueMeuTreino.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.clipsToBounds = true
    }

    @IBAction func tappedExitButton(_ sender: UIButton) {
        delegate?.configureTabBarIndex()
        var presentingViewController = self.presentingViewController
        while presentingViewController?.presentingViewController != nil {
            presentingViewController = presentingViewController?.presentingViewController
        }
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
