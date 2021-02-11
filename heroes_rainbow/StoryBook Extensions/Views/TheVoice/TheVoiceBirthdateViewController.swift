import UIKit

class TheVoiceBirthdateViewController: UIViewController {
    
    // MARK: - Properties

    var stackView = UIStackView()
    
    let birthdayField = InputBirthday()
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
        
        stackView.addArrangedSubview(birthdayField)
        stackView.addArrangedSubview(actionBtn)
    }
}

extension TheVoiceBirthdateViewController: PrimaryBtnDelegate {
    func didTapPrimaryBtn() {
        self.delegate?.didTapBtn()
    }
}
