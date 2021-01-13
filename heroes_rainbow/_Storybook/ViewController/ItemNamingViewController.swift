//
//  DSItemNamingViewController.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 09/12/2020.
//

import UIKit

class ItemNamingViewController: UIViewController {

    // MARK: - Properties
    
    var stackView = UIStackView()
    let candidateNaming = ItemNaming(user: .candidate, mainLbl: "Pierre Dupont", secondaryLbl: "Sales Associate")
        
    // MARK: - Init
    
    override func viewDidLoad() {
        configure()
    }
    
    // MARK: - Properties
    
    private func configure() {
        view.backgroundColor = .gray
        
        view.addSubview(stackView)
        stackView.anchor(top: view.layoutMarginsGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(candidateNaming)
    }
}
//
//extension ItemNamingViewController: ControlBarDelegate {
//    func didTapMeetBtn() {
//        print("toutouch")
//    }
//}
