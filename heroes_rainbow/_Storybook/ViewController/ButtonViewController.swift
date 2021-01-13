import UIKit

class ButtonViewController: UIViewController {

    // MARK: - Properties
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var stackView = UIStackView()
    private var topBar = TopBar(backBtn: true, text: "This is a test")
    private var titleLbl = StoryBookTitle(title: "This is a test")
    
    let items = ["Enabled", "Disabled", "Loading", "Final step"]
    lazy private var stateSlots: UISegmentedControl = {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.sendActions(for: UIControl.Event.valueChanged)
        control.addTarget(self, action: #selector(segmentSelected(sender:)), for: .valueChanged)
        return control
    }()
    
    private let okBtn = PrimaryBtn(text: "Ok", state: .enabled)
    private let letsGoBtn = PrimaryBtn(text: "OK, let's go!", state: .enabled)
    private let tooLongBtn = PrimaryBtn(text: "This is a way too long button to be displayed", state: .enabled)
    private let optionalBtn = PrimaryBtn(text: "CONTINUE", subtext: "You've got one last step left", state: .enabled)
    private let bottomBtn = PrimaryBtn(text: "Forget me please", whiteShadow: true, state: .enabled, animated: true)
    
    // MARK: - Init
    
    override func viewDidLoad() {
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
    }
    
    // MARK: - Properties
    
    private func configure() {
        view.addSubview(topBar)
        topBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        view.addSubview(titleLbl)
        titleLbl.anchor(top: topBar.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        view.addSubview(scrollView)
        scrollView.anchor(top: titleLbl.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        view.backgroundColor = R.color.lightGrey()
        
        scrollView.addSubview(stackView)
        stackView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        let components: [StoryBookPackage] = [
            .init(title: "Button with a short text",         view: okBtn),
            .init(title: "Button with a medium text",        view: letsGoBtn),
            .init(title: "Button with a truncated text",     view: tooLongBtn),
            .init(title: "Button with a optional subtitle",  view: optionalBtn),
            .init(title: "Button with a shadow background",  view: bottomBtn)
        ]
        
        
        components.forEach { component in
            let storybook = StoryBookView(view: component.view, title: component.title)
            stackView.addArrangedSubview(storybook)
        }
        
//        view.backgroundColor = R.color.lightGrey()
//
//        view.addSubview(stateSlots)
//        stateSlots.anchor(top: view.layoutMarginsGuide.topAnchor , leading: view.layoutMarginsGuide.leadingAnchor, bottom: nil, trailing: view.layoutMarginsGuide.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 40))
//
//        view.addSubview(stackView)
//        stackView.anchor(top: stateSlots.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
//        stackView.axis = .vertical
//
//        stackView.addArrangedSubview(StoryBookView(okBtn, text: "Button with a short text"))
//        okBtn.delegate = self
//        stackView.addArrangedSubview(StoryBookView(letsGoBtn, text: "Button with a medium text"))
//        letsGoBtn.delegate = self
//        stackView.addArrangedSubview(StoryBookView(tooLongBtn, text: "Button with a cut text"))
//        tooLongBtn.delegate = self
//        stackView.addArrangedSubview(StoryBookView(optionalBtn, text: "Button with optional text"))
//        optionalBtn.delegate = self
//
//        view.addSubview(bottomBtn)
//        bottomBtn.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
//        bottomBtn.delegate = self
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
