import UIKit

class OnboardingViewController: UIViewController {
//MARK: - Private properties -
    private let contentView = OnboardingContentView()
    private let viewModel: OnboardingModel?
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        setupData()
    }
    
    init(viewModel: OnboardingModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private meth -
private extension OnboardingViewController {
    func setupData() {
        guard let viewModel else { return }
        contentView.configure(viewModel: viewModel)
    }
}

//MARK: - OnboardingDelegate -
extension OnboardingViewController: OnboardingDelegate {
    func tapEnter() {
        print("Открыл авторизации экран")
    }
    
    
}
