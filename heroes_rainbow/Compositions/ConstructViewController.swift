//
//  TestViewController.swift
//  heroes_swiftui
//
//  Created by PATRICK LESAINT on 29/04/2020.
//  Copyright © 2020 PATRICK LESAINT. All rights reserved.
//

import UIKit
import SwiftUI

class ConstructViewController: UIViewController {

    // MARK: - Properties

    lazy private var titleLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "ceci est un carré..."
        return label
    }()

    
    lazy private var centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(titleLbl)
        view.addSubview(centerView)

        centerView.centerInSuperview()
        centerView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 100, height: 100))
        
        titleLbl.centerXToSuperview()
        titleLbl.anchor(top: nil, leading: nil, bottom: centerView.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 50, right: 0))
    }

}

struct ConstructVCPreview: PreviewProvider {
    
    static var previews: some View {
        ConstructVCContainerView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .edgesIgnoringSafeArea(.all)
//        ConstructVCContainerView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
//            .edgesIgnoringSafeArea(.all)
//        TestVCContainerView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE (1st generation)"))
//            .edgesIgnoringSafeArea(.all)
    }
    
    struct ConstructVCContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<ConstructVCPreview.ConstructVCContainerView>) -> UIViewController {
            return ConstructViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ConstructVCPreview.ConstructVCContainerView>) {
        
        }
        
        typealias UIViewControllerType = UIViewController
    }
}
