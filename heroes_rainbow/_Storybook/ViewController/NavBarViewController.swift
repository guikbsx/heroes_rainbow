import UIKit

class NavBarViewController: UIViewController {

    // MARK: - Properties
    
    var stackView = UIStackView()

    // MARK: - Init
    
    override func viewDidLoad() {
        configure()
    }
    
    // MARK: - Properties
    
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.anchor(top: view.layoutMarginsGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        let navbar1 = TopBar(backBtn: true)
        navbar1.delegate = self
        stackView.addArrangedSubview(navbar1)
        
        let navbar2 = TopBar(backBtn: true, text: "C'est un test")
        navbar2.delegate = self
        stackView.addArrangedSubview(navbar2)
        
        let navbar3 = TopBar(backBtn: true, actionBtn: .skip)
        navbar3.delegate = self
        stackView.addArrangedSubview(navbar3)
        
        let navbar4 = TopBar(backBtn: true, text: "Test skip", actionBtn: .skip)
        navbar4.delegate = self
        stackView.addArrangedSubview(navbar4)
        stackView.axis = .vertical
        
        let navbar5 = TopBar(backBtn: true, text: "Test delete", actionBtn: .delete)
        navbar5.delegate = self
        stackView.addArrangedSubview(navbar5)
        stackView.axis = .vertical
    }

}

extension NavBarViewController: TopBarDelegate {
    func didTapLeftBtn() {
        print("You tap back button man!!")
    }
    
    func didTapRightBtn() {
        print("You tap action button man!!")
    }
}
