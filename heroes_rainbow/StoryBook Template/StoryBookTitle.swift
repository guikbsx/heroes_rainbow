//
//  StoryBookTitle.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 13/01/2021.
//

import UIKit

class StoryBookTitle: UIView {

    lazy private var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "This is a test"
        label.font = R.font.gilroyBold(size: 32)
        label.textColor = .black
        return label
    }()
    
    init(title: String, bigTitle: Bool = false) {
        super.init(frame: .zero)
        titleLbl.text = title
        titleLbl.font = R.font.gilroyBold(size: bigTitle ? 42 : 32)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configure() {
        clipsToBounds = true
        
        addSubview(titleLbl)
        titleLbl.fillSuperview(padding: .init(top: 12, left: 20, bottom: 12, right: 20))
    }

}
