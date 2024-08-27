import UIKit

final class OnboardingContentView: UIView {
    
    //MARK: - Private properties -
    private let onboardingImage = UIImageView()
    private let onboardingLabel = UILabel()
    private let clueLabel = UILabel()
    private let buttonStack = UIStackView()
    private let enterButton = UIButton()
    private let registrationButton = UIButton()
    private let inviteButton = UIButton()
    
    weak var delegate: OnboardingDelegate?
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Public -
extension OnboardingContentView {
    func configure(viewModel: OnboardingModel) {
        onboardingImage.image = UIImage(named:viewModel.onboardingImageViewName)
        onboardingLabel.text = viewModel.onboardingLabelText
        clueLabel.text = viewModel.clueLabelText
        enterButton.setTitle(viewModel.enterButtonText, for: .normal)
        registrationButton.setTitle(viewModel.registrationButtonText, for: .normal)
        inviteButton.setTitle(viewModel.inviteButtonText, for: .normal)
    }
}

//MARK: - Private methods -
private extension OnboardingContentView {
    @objc func enterButtonAction() {
        delegate?.tapEnter()
    }
    
    @objc func registrationButtonAction() {
        //TODO: Stub
    }
}

//MARK: - UI -
private extension OnboardingContentView {
    func setupUI() {
        backgroundColor = .white
        addSubviews()
        makeConstraint()
        setupOnboardingImage()
        setupOnboardingLabel()
        setupInviteButton()
        setupButtonStackView()
        setupRegistrationButton()
        setupEnterButton()
        setupClueLabel()
    }
    
    func addSubviews() {
        addSubview(onboardingImage)
        addSubview(onboardingLabel)
        addSubview(clueLabel)
        addSubview(buttonStack)
        buttonStack.addArrangedSubview(enterButton)
        buttonStack.addArrangedSubview(registrationButton)
        addSubview(inviteButton)
        
    }
    
    func setupOnboardingImage() {
        onboardingImage.translatesAutoresizingMaskIntoConstraints = false
        onboardingImage.clipsToBounds = false
    }
    
    func setupOnboardingLabel() {
        onboardingLabel.translatesAutoresizingMaskIntoConstraints = false
        onboardingLabel.textAlignment = .left
        onboardingLabel.font = UIFont.boldSystemFont(ofSize: 36)
        onboardingLabel.textColor = .black
        onboardingLabel.numberOfLines = 2
        onboardingLabel.lineBreakMode = .byWordWrapping
    }
    
    func setupInviteButton() {
        inviteButton.translatesAutoresizingMaskIntoConstraints = false
        inviteButton.setTitleColor(.blue, for: .normal)
        inviteButton.layer.borderWidth = 0
        inviteButton.layer.borderColor = UIColor.clear.cgColor
        inviteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        inviteButton.addTarget(self, action: #selector(registrationButtonAction), for: .touchUpInside)
    }
    
    func setupButtonStackView() {
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .vertical
        buttonStack.spacing = 10
        buttonStack.distribution = .fillEqually
    }
    
    func setupRegistrationButton() {
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.layer.borderWidth = 0.3
        registrationButton.layer.borderColor = UIColor.gray.cgColor
        registrationButton.backgroundColor = .clear
        registrationButton.layer.cornerRadius = 12
        registrationButton.setTitleColor(.black, for: .normal)
        registrationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        registrationButton.addTarget(self, action: #selector(registrationButtonAction), for: .touchUpInside)
    }
    
    func setupEnterButton() {
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.backgroundColor = #colorLiteral(red: 1, green: 0.7494882941, blue: 0.3749371469, alpha: 1)
        enterButton.layer.cornerRadius = 12
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        enterButton.addTarget(self, action: #selector(enterButtonAction), for: .touchUpInside)
    }
    
    func setupClueLabel() {
        clueLabel.translatesAutoresizingMaskIntoConstraints = false
        clueLabel.textColor = #colorLiteral(red: 0.632566154, green: 0.643707633, blue: 0.6621890068, alpha: 1)
        clueLabel.textAlignment = .left
        clueLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    func makeConstraint() {
        NSLayoutConstraint.activate(
            [onboardingImage.topAnchor.constraint(equalTo: topAnchor, constant: 60),
             onboardingImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
             onboardingImage.widthAnchor.constraint(equalToConstant: 160),
             onboardingImage.heightAnchor.constraint(equalToConstant: 50),
             
             inviteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
             inviteButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
             inviteButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
             inviteButton.heightAnchor.constraint(equalToConstant: 50),
             
             buttonStack.bottomAnchor.constraint(equalTo: inviteButton.topAnchor, constant: -20),
             buttonStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
             buttonStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
             buttonStack.heightAnchor.constraint(equalToConstant: 120),
             
             clueLabel.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -30),
             clueLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
             
             onboardingLabel.bottomAnchor.constraint(equalTo: clueLabel.topAnchor, constant: -30),
             onboardingLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
            ])
    }
}
