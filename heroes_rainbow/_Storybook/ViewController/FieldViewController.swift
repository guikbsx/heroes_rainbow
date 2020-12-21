import UIKit

class FieldViewController: UIViewController {
    
    // MARK: - Properties
    
    var stackView = UIStackView()
    
    let firstNameTextField = InputText(placeholder: "First name")
    let lastNameTextField = InputText(placeholder: "Last name")
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
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.anchor(top: view.layoutMarginsGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        stackView.axis = .vertical
        stackView.addArrangedSubview(firstNameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        stackView.addArrangedSubview(birthdayField)
        stackView.addArrangedSubview(phoneField)
        stackView.addArrangedSubview(inputPicker)
        
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
