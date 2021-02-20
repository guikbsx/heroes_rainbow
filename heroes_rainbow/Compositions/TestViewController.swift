import UIKit
import SwiftUI
import Lottie

class TestViewController: UIViewController {
    
    // MARK: - Properties
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var stackView = UIStackView()
    private var topBar = TopBar(backBtn: true)
    private var titleLbl = StoryBookTitle(title: "Title")
    private var components: [StoryBookPackage]?
    var animation = AnimationView(name: "wave")
    
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
        view.addSubview(animation)
        animation.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -40, left: 0, bottom: 0, right: 0))
        animation.pause()
        animation.loopMode = .autoReverse
        
        view.addSubview(topBar)
        topBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topBar.delegate = self
        
        view.addSubview(titleLbl)
        titleLbl.anchor(top: topBar.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        view.addSubview(scrollView)
        scrollView.anchor(top: titleLbl.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        view.backgroundColor = R.color.lightGrey()
        scrollView.delegate = self
        
        scrollView.addSubview(stackView)
        stackView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        components?.forEach { component in
            let storybook = StoryBookView(view: component.view, title: component.title, color: component.color)
            stackView.addArrangedSubview(storybook)
        }
    }
    
}

extension TestViewController: TopBarDelegate {
    func didTapLeftBtn() { self.navigationController?.popViewController(animated: true) }
    func didTapRightBtn() {}
}

extension TestViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) { animation.pause() }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { animation.pause() }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) { if !decelerate { animation.play() } }
}


struct TestVCPreview: PreviewProvider {
    
    static var previews: some View {
        TestVCContainerView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .edgesIgnoringSafeArea(.all)
//        TestVCContainerView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
//            .edgesIgnoringSafeArea(.all)
        //        TestVCContainerView()
        //            .previewDevice(PreviewDevice(rawValue: "iPhone SE (1st generation)"))
        //            .edgesIgnoringSafeArea(.all)
    }
    
    struct TestVCContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<TestVCPreview.TestVCContainerView>) -> UIViewController {
            return TestViewController(
                title: "This is test place",
                components: [
                    .init(title: "Divider", view: Divider()),
                ])
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TestVCPreview.TestVCContainerView>) {
            
        }
        
        typealias UIViewControllerType = UIViewController
    }
}
