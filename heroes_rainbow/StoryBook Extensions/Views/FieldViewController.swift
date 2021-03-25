import UIKit
import Lottie

class FieldViewController: UIViewController {
    
    // MARK: - Properties
        
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var stackView = UIStackView()
    private var topBar = TopBar(backBtn: true)
    private var titleLbl = StoryBookTitle(title: "Input")
    private var components: [StoryBookPackage]?
    
    let firstNameTextField = InputText(placeholder: "Insert placeholder")
    let birthdayField = InputBirthday()
    let phoneField = InputPhone()
    let inputPicker = InputPicker(placeholder: "Duration")
    fileprivate var pickerView : UIPickerView!
    fileprivate let pickerData = ["1-3 months", "4-6 months", "6-9 months","1 year", "2 years", "+3 years"]


    // MARK: - Init
    
    override func viewDidLoad() {
        configure()
    }
    
    // MARK: - Properties
    
    private func configure() {
		view.addSubview(topBar)
		topBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
		topBar.delegate = self
		
		view.addSubview(titleLbl)
		titleLbl.anchor(top: nil, leading: topBar.backBtn.trailingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
		titleLbl.centerYTo(topBar.backBtn.centerYAnchor)
        
        view.addSubview(scrollView)
        scrollView.anchor(top: titleLbl.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        view.backgroundColor = R.color.lightGrey()
        
        scrollView.addSubview(stackView)
        stackView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        components = [
            .init(title: "Text", view: firstNameTextField),
            .init(title: "Birthday", view: birthdayField),
            .init(title: "Phone number", view: phoneField),
            .init(title: "Input Picker (multiple choices)", view: inputPicker),]
        
        components?.forEach { component in
            let storybook = StoryBookView(view: component.view, title: component.title, color: component.color)
            stackView.addArrangedSubview(storybook)
        }
        
        inputPicker.delegate = self
    }
}

extension FieldViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inputPicker.text(pickerData[row])
    }
}

extension FieldViewController: InputDropDelegate {
    func didBeginEditing() {
        pickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: view.frame.size.width, height: 216))
        pickerView.dataSource = self
        pickerView.delegate = self
        inputPicker.inputView(pickerView)

    }
    
    
}

extension FieldViewController: TopBarDelegate {
    func didTapLeftBtn() { self.navigationController?.popViewController(animated: true) }
    func didTapRightBtn() {}
}
