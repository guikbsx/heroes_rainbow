import UIKit
import Hero

protocol DSTheVoiceDelegate {
    func didTapBtn()
}

class TheVoiceViewController: UIViewController {
    
    // MARK: - Properties

    var stackView = UIStackView()
    
    private var topBar: TopBar!
    private var voiceView: TheVoice!
    
    private let subTitleArray = [
        "Ok, let’s start!",
        "Code sent to 612 433 2658",
        "Tell us a bit more about you",
        "Hi Pantéa ! Nice to meet you."]
    
    private let titleArray = [
        "What's your phone\nnumber?",
        "Enter the code\nwe texted you",
        "What's your\nbirthday?",
        "What's your\nname?"]
    
    private var actualStep = 0
    
    private var bodyView: UIView = UIView()

    // MARK: - Init
    
    override func viewDidLoad() {
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        voiceView.layoutSubviews()
        super.viewDidLayoutSubviews()
    }

    // MARK: - Properties
    
    private func configure() {
        view.backgroundColor = .white
        view.addSubview(stackView)

        topBar = TopBar(backBtn: false, text: subTitleArray[actualStep], actionBtn: .none)
        voiceView = TheVoice(actualStep: (actualStep + 1), numberOfStep: 4, title: titleArray[actualStep])
        
        stackView.anchor(top: view.layoutMarginsGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        stackView.axis = .vertical
        stackView.addArrangedSubview(topBar)
        stackView.addArrangedSubview(voiceView)
        stackView.addArrangedSubview(bodyView)

        let vc = TheVoiceFullNameViewController()
        vc.delegate = self
        bodyView.addSubview(vc.view)
        vc.view.fillSuperview()
    }
    
    private func manageStep() {
        
        if actualStep == 4 {
            self.dismiss(animated: true, completion: nil)
        } else {
            voiceView.animate(step: (actualStep + 1), title: titleArray[actualStep])
            topBar.edit(text: subTitleArray[actualStep])
        }
        
        bodyView.fadeOut(during: 0.2) {
            self.bodyView.removeAllSubViews()
            var newBody: UIView
            
            switch self.actualStep {
            case 0,2:
                let vc = TheVoiceFullNameViewController()
                vc.delegate = self
                newBody = vc.view
                break
            case 1,3:
                let vc = TheVoiceBirthdateViewController()
                vc.delegate = self
                newBody = vc.view
                break
            default:
                let vc = TheVoiceFullNameViewController()
                vc.delegate = self
                newBody = vc.view
            }
            
            self.bodyView.alpha = 0
            self.bodyView.addSubview(newBody)
            newBody.fillSuperview()
            self.bodyView.fadeIn(during: 0.2)
        }
    }
}

extension TheVoiceViewController: DSTheVoiceDelegate {
    func didTapBtn() {
        actualStep = actualStep + 1

        manageStep()
    }
}
