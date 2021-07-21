import UIKit
import Lottie
import Emojica
import SwiftUI
import Hero

class HomeViewController: UIViewController {
    
	let launchScreen = UIImageView(image: R.image.graphic_overlay())
	let contentView = UIView(backgroundColor: R.color.lightGrey()!)
    
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
    
    private var animation = AnimationView(name: "heart")
	private var hasAnimated = false
    private var theVoice = StoryBookTitle(title: "Rainbow", bigTitle: true)
	private var subtitle = Subtitle(text: "Design System for Heroes", type: .bold)
	
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
		self.hero.isEnabled = true
        view.addSubview(contentView)
        contentView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		animate()
	}

    private func configure() {
                
		contentView.addSubview(launchScreen)
		launchScreen.fillSuperview()
		launchScreen.alpha = 0
		
        contentView.addSubview(tableView)
		tableView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 170, left: 0, bottom: 0, right: 0))
        tableView.backgroundColor = .clear
		tableView.alpha = 0
		
		contentView.addSubview(animation)
		animation.frame = .init(x: 0, y: 0, width: 300, height: 300)
		animation.center = view.center
		
		contentView.addSubview(theVoice)
		theVoice.alpha = 0
		
		contentView.addSubview(subtitle)
		subtitle.anchor(top: nil, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: contentView.safeAreaLayoutGuide.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 0))
    }
	
	private func animate() {
		animation.play(completion: {_ in
			UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: {
				self.animation.frame = .init(x: -10, y: 40, width: 150, height: 150)
				if !self.hasAnimated {
					self.theVoice.frame = .init(x: 40, y: 0, width: UIScreen.main.bounds.width, height: 150)
					self.theVoice.center.y = self.animation.center.y
					self.theVoice.transform = .init(translationX: 50, y: 0)
				}
			})
			UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.7, options: [.curveEaseOut], animations: {
				self.theVoice.alpha = 1
				self.subtitle.alpha = 0
				self.theVoice.transform = .identity
				if !self.hasAnimated {
					self.tableView.alpha = 1
					self.tableView.reloadData()
				}
			}, completion: { _ in
				self.hasAnimated = true
				self.test()

			})
			
		})
	}
	
	func test() {
		let vc = UIHostingController(rootView: ConnectionView())
		vc.modalPresentationStyle = .overCurrentContext
		self.present(vc, animated: true, completion: nil)
	}
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
            let stackView = UIStackView(arrangedSubviews: [
                Subtitle(attributedText: Emojica(font: R.font.gilroyBold(size: 18)!).convert(string: "✨ New ✨\n🛠 Work in progress 🛠\n🚧 Being repaired 🚧")),
                Subtitle(attributedText: Emojica(font: R.font.gilroySemibold(size: 18)!).convert(string: "Created with 💜 by best iOS Team ever")),
				Subtitle(attributedText: Emojica(font: R.font.gilroyBold(size: 18)!).convert(string: "Rainbow Fwk v\(AppInfos.shortVersion) - build n°\(AppInfos.buildNumber)")),
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
    }
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		let animation = AnimationFactory.makeMoveUpWithFade(rowHeight: cell.frame.height, duration: 0.2, delayFactor: 0.05)
		let animator = Animator(animation: animation)
		animator.animate(cell: cell, at: indexPath, in: tableView)
	}
    
}

struct HomeVCPreview: PreviewProvider {
	
	static var previews: some View {
		HomeVCContainerView()
			.edgesIgnoringSafeArea(.all)
	}
	
	struct HomeVCContainerView: UIViewControllerRepresentable {
		func makeUIViewController(context: UIViewControllerRepresentableContext<HomeVCPreview.HomeVCContainerView>) -> UIViewController {
			return HomeViewController()
		}
		
		func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<HomeVCPreview.HomeVCContainerView>) {
			
		}
		
		typealias UIViewControllerType = UIViewController
	}
}
