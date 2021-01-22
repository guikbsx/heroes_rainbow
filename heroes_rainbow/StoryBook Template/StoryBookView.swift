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
        label.font = R.font.gilroyBold(size: 16)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    lazy private var mainView = UIView()
    private var contentView: UIView!
    
    init(view: UIView? = nil, title: String, color: UIColor = .white) {
        if let _ = view {
            self.contentView = view
        } else {
            self.contentView = UIView()
            contentView.sizeThatFits(.init(width: 0, height: 80))
        }
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
        mainView.anchor(top: titleLbl.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 8, right: 0))
        mainView.addShadowToView(shadowColor: R.color.lightBlueGrey()!, offset: .zero, shadowRadius: 0, shadowOpacity: 0.25, cornerRadius: 0)
        mainView.clipsToBounds = true
        
        mainView.addSubview(contentView)
        contentView.fillSuperview()
    }
}
