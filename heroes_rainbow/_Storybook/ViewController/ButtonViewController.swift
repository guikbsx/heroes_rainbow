import UIKit

class ButtonViewController: UIViewController {

    // MARK: - Properties
    
    let items = ["Enabled", "Disabled", "Loading", "Final step"]
    
    lazy private var stateSlots: UISegmentedControl = {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.sendActions(for: UIControl.Event.valueChanged)
        control.addTarget(self, action: #selector(segmentSelected(sender:)), for: .valueChanged)
        return control
    }()
    
    private var stackView = UIStackView()
    
    private let okBtn = PrimaryBtn(text: "Ok", state: .enabled)
    private let letsGoBtn = PrimaryBtn(text: "OK, let's go!", state: .enabled)
    private let tooLongBtn = PrimaryBtn(text: "This is a way too long button to be displayed", state: .enabled)
    private let optionalBtn = PrimaryBtn(text: "CONTINUE", subtext: "You've got one last step left", state: .enabled)
    private let bottomBtn = PrimaryBtn(text: "Forget me please", whiteShadow: true, state: .enabled, animated: true)
    
    // MARK: - Init
    
    override func viewDidLoad() {
        configure()
    }
    
    // MARK: - Properties
    
    private func configure() {
        view.backgroundColor = R.color.lightBlueGrey()
        
        view.addSubview(stateSlots)
        stateSlots.anchor(top: view.layoutMarginsGuide.topAnchor , leading: view.layoutMarginsGuide.leadingAnchor, bottom: nil, trailing: view.layoutMarginsGuide.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 40))
        
        view.addSubview(stackView)
        stackView.anchor(top: stateSlots.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        stackView.axis = .vertical

        stackView.addArrangedSubview(okBtn)
        okBtn.delegate = self
        stackView.addArrangedSubview(letsGoBtn)
        letsGoBtn.delegate = self
        stackView.addArrangedSubview(tooLongBtn)
        tooLongBtn.delegate = self
        stackView.addArrangedSubview(optionalBtn)
        optionalBtn.delegate = self
        
        view.addSubview(bottomBtn)
        bottomBtn.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        bottomBtn.delegate = self
    }
    
    @objc private func segmentSelected(sender: UISegmentedControl) {
        
        var state: PrimaryBtnState = .enabled
        
        if sender.selectedSegmentIndex == 1 {
            state = .disabled
        } else if sender.selectedSegmentIndex == 2 {
            state = .loading
        } else if sender.selectedSegmentIndex == 3 {
            state = .finalStep
        }
        
        okBtn.state(state)
        letsGoBtn.state(state)
        tooLongBtn.state(state)
        optionalBtn.state(state)
        bottomBtn.state(state)
    }
    
}

extension ButtonViewController: PrimaryBtnDelegate {
    func didTapPrimaryBtn() {
        print("You press me man !!!")
    }
}
