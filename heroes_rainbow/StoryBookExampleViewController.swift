//
//  StoryBookExampleViewController.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 13/01/2021.
//

import UIKit

class StoryBookPackage {
    let title: String
    let view: UIView
    let color: UIColor!
    
    init(title: String, view: UIView, color: UIColor = .white) {
        self.title = title
        self.view = view
        self.color = color
    }
}

class StoryBookExampleViewController: UIViewController {

    // MARK: - Properties
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var stackView = UIStackView()
    private var topBar = TopBar(backBtn: true)
    private var titleLbl = StoryBookTitle(title: "Title")
    private var components: [StoryBookPackage]?
    
    init(title: String, components: [StoryBookPackage]) {
        self.components = components
        titleLbl = StoryBookTitle(title: title)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.addSubview(topBar)
        topBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topBar.delegate = self

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
        
        components?.forEach { component in
            let storybook = StoryBookView(view: component.view, title: component.title)
            stackView.addArrangedSubview(storybook)
        }
    }
}

extension StoryBookExampleViewController: TopBarDelegate {
    func didTapLeftBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func didTapRightBtn() {
        
    }
    
    
}
