import UIKit

class DividerViewController: UIViewController {

    // MARK: - Properties
    
    var stackView = UIStackView()
    let emptyDivider = Divider()
    let orDivider = Divider(text: "or")
    let textDivider = Divider(text: R.string.dsLocalizable.locationDividerTitle())
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
        
        stackView.addArrangedSubview(emptyDivider)
        stackView.addArrangedSubview(orDivider)
        stackView.addArrangedSubview(textDivider)
    }
}
