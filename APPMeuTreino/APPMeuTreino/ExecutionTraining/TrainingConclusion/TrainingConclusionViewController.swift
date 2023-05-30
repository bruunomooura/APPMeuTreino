import UIKit

protocol TrainingConclusionViewControllerProtocol: AnyObject {
    func configureTabBarIndex()
}

class TrainingConclusionViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var text1Label: UILabel!
    @IBOutlet weak var text2Label: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var shareTrainingLabel: UILabel!
    @IBOutlet weak var facebookImageView: UIImageView!
    @IBOutlet weak var whatsappImageView: UIImageView!
    @IBOutlet weak var instagramImageView: UIImageView!

    private weak var delegate: TrainingConclusionViewControllerProtocol?
    public func delegate(delegate: TrainingConclusionViewControllerProtocol?) {
        self.delegate = delegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTrainingConclusionView()
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
