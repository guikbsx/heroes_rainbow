import UIKit
import Lottie
import Emojica
import SwiftUI

class HomeViewController: UIViewController {
    
    internal let viewModel: DSViewModel!
    
    internal let designSystemsColor: [DesignSystemsColor] = [
        DesignSystemsColor(name: "Turquoise",       backgroundColor: R.color.turquoise()!,     hex: "81FFD7"),
        DesignSystemsColor(name: "Pink",            backgroundColor: R.color.pink()!,          hex: "E46EF8"),
        DesignSystemsColor(name: "Purple",          backgroundColor: R.color.purple()!,        hex: "5F6BEF"),
        DesignSystemsColor(name: "Blue Grey",       backgroundColor: R.color.blueGrey()!,      hex: "5F6BEF"),
        DesignSystemsColor(name: "Light Blue Grey", backgroundColor: R.color.lightBlueGrey()!, hex: "99A3C1"),
        DesignSystemsColor(name: "Black",           backgroundColor: .black,                   hex: "000000"),
        DesignSystemsColor(name: "Bold Grey",       backgroundColor: R.color.boldGrey()!,      hex: "979797"),
        DesignSystemsColor(name: "Light Grey",      backgroundColor: R.color.lightGrey()!,     hex: "F2F2F2"),
        DesignSystemsColor(name: "Light Red",       backgroundColor: R.color.lightRed()!,      hex: "FF6C6C"),
        DesignSystemsColor(name: "White",           backgroundColor: .white,                   hex: "FFFFFF"),
        DesignSystemsColor(name: "Inactive grey",   backgroundColor: R.color.inactiveGrey()!,  hex: "99A3C1")
    ]
    
    var animation = AnimationView(name: "wave")
    
    lazy private var theVoice = StoryBookTitle(title: "Rainbow", bigTitle: true)
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(ItemAction.self, forCellReuseIdentifier: "ItemAction")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layoutIfNeeded()
        tableView.tableFooterView = UIView()
        tableView.layoutMargins = .zero
        tableView.contentInset = .zero
        tableView.backgroundColor = .clear
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        tableView.tableHeaderView = UIView(frame: frame)
        tableView.tableFooterView = UIView(frame: frame)
        return tableView
    }()

    public init(viewModel: DSViewModel = DSViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
//        setSplash()
    }
    
    private func setSplash() {
//        let splashView = UIView()
//        view.addSubview(splashView)
//        splashView.fillSuperview()
//
//        let swiftUIView = GradientView() // swiftUIView is View
//        let controller = UIHostingController(rootView: swiftUIView)
//        addChild(controller)
//        splashView.addSubview(controller.view)
//        controller.didMove(toParent: self)
//        controller.view.centerInSuperview(size: .init(width: 200, height: 200))
        
//        let logo = UIImageView(image: R.image.logo_contour())
//        splashView.addSubview(logo)
//        logo.centerInSuperview(size: .init(width: 200, height: 200))
//        
//        let topView = UIView(backgroundColor: .white)
//        let bottomView = UIView(backgroundColor: .white)
//        let leftView = UIView(backgroundColor: .white)
//        let rightView = UIView(backgroundColor: .white)
//        
//        [topView, bottomView, leftView, rightView].forEach { dir in splashView.addSubview(dir) }
//        
//        topView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: logo.topAnchor, trailing: view.trailingAnchor)
//        bottomView.anchor(top: logo.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
//        leftView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: logo.leadingAnchor)
//        rightView.anchor(top: view.topAnchor, leading: logo.trailingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }

    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(animation)
        animation.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -10, left: 0, bottom: 0, right: 0))
        animation.play()
        animation.loopMode = .autoReverse
        
        view.addSubview(theVoice)
        theVoice.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        view.addSubview(tableView)
        tableView.anchor(top: theVoice.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        tableView.backgroundColor = .clear
        
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) { animation.pause() }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { animation.play() }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) { if !decelerate { animation.play() } }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.section(at: section).name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.section(at: section).designSystems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let designSystem = viewModel.designSystem(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemAction") as! ItemAction
        cell.setup(name: designSystem.label, image: nil)
        if designSystem.type == .modal {
            tableView.cellForRow(at: indexPath)
        }
        return cell
    }
    
    
    fileprivate func presentWithNavigationController(viewController: UIViewController ) {
        let nvc = UINavigationController(rootViewController: viewController)
        nvc.isNavigationBarHidden = true
        nvc.modalPresentationStyle = .overCurrentContext
        
        self.present(nvc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == viewModel.sections.count - 1 {
            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
            let stackView = UIStackView(arrangedSubviews: [
                Subtitle(attributedText: Emojica(font: R.font.gilroyBold(size: 18)!).convert(string: "✨ New ✨\n🛠 Work in progress 🛠\n🚧 Being repaired 🚧")),
                Subtitle(attributedText: Emojica(font: R.font.gilroySemibold(size: 18)!).convert(string: "Created with 💜 by iOS Team\nRainbow Fwk v\(appVersion)")),
            ])
            stackView.axis = .vertical
            return stackView
        } else {
            return UIView(frame: .zero)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        configureSettings(indexPath)
        configureComponents(indexPath)
        configureModules(indexPath)
    }
    
}
