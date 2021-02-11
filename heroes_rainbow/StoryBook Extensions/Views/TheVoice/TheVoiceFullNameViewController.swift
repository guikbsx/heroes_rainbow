import UIKit

class TheVoiceFullNameViewController: UIViewController {
    
    // MARK: - Properties

    var stackView = UIStackView()
    
    let firstNameTextField = InputText(placeholder: "First name")
    let lastNameTextField = InputText(placeholder: "Last name")
    let actionBtn = PrimaryBtn(text: "Animate !", state: .enabled)

    var delegate: DSTheVoiceDelegate?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        configure()
        actionBtn.delegate = self
    }

    // MARK: - Properties
    
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.anchor(top: view.layoutMarginsGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(firstNameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        stackView.addArrangedSubview(actionBtn)
    }
}

extension TheVoiceFullNameViewController: PrimaryBtnDelegate {
    func didTapPrimaryBtn() {
        self.delegate?.didTapBtn()
    }
}
