//
//  StoryBookView.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 13/01/2021.
//

import UIKit

class StoryBookView: UIView {
    
    lazy private var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "This is a test"
        label.font = R.font.gilroyBold(size: 12)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    lazy private var mainView = UIView()
    private var contentView: UIView!
    
    init(view: UIView = UIView(), title: String, color: UIColor = .white) {
        self.contentView = view
        super.init(frame: .zero)
        titleLbl.text = title
        mainView.backgroundColor = color
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configure() {
        clipsToBounds = true
        
        addSubview(titleLbl)
        titleLbl.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 20, bottom: 0, right: 20))
        
        addSubview(mainView)
        mainView.anchor(top: titleLbl.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 20, bottom: 8, right: 20))
//        mainView.fillSuperview(padding: .init(top: 12, left: 20, bottom: 12, right: 20))
        mainView.addShadowToView(shadowColor: R.color.lightBlueGrey()!, offset: .zero, shadowRadius: 5, shadowOpacity: 0.25, cornerRadius: 20)
        
        
        mainView.addSubview(contentView)
        contentView.fillSuperview()
    }
}
