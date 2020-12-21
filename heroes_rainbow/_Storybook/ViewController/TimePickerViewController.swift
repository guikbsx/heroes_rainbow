//
//  TimePickerViewController.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 21/12/2020.
//

import UIKit

class TimePickerViewController: UIViewController {
    
    // MARK: - Properties

    var stackView = UIStackView()
    
    let timePicker = TimePicker()

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
        stackView.addArrangedSubview(timePicker)
    }
    
}
