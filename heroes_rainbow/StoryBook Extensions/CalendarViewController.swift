import UIKit
import SwiftDate

class CalendarViewController: UIViewController {
    
    // MARK: - Properties
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let monthView = MonthView()
    let topBar = TopBar(backBtn: true, text: "Set up your hiring event")
    let theVoice = TheVoice(actualStep: 1, numberOfStep: 1, title: "what day is your\nhiring event ?")
    var stackView = UIStackView()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Properties
    
    private func configure() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.anchor(top: view.layoutMarginsGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        stackView.axis = .vertical
        stackView.addArrangedSubview(topBar)
        stackView.addArrangedSubview(theVoice)
        stackView.addArrangedSubview(monthView)
        stackView.addArrangedSubview(contentView)
        
        let vc = DatePickerVC()
        contentView.addSubview(vc.view)
        vc.view.fillSuperview()
    }
    
}

extension CalendarViewController: MonthDatePickerDelegate {
    func didTapDate(date: Date) {
        print("date is \(date)")
    }
    
    
}
