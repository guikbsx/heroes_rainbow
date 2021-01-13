//
//  HomeViewController.swift
//  heroes_rainbow
//
//  Created by Guillaume Bisiaux on 13/01/2021.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {
    
    private let viewModel: DSViewModel!
    
    var animation = AnimationView(name: "wave")
    
    lazy private var theVoice = StoryBookTitle(title: "Rainbow")
    
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
    }

    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(animation)
        animation.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -60, left: 0, bottom: 0, right: 0))
        animation.play()
        animation.loopMode = .autoReverse
        
        view.addSubview(theVoice)
        theVoice.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        view.addSubview(tableView)
        tableView.anchor(top: theVoice.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        tableView.backgroundColor = .clear
        
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let designSystem = viewModel.designSystem(at: indexPath)
        
        switch designSystem.type {
        /*Settings*/
        case .colors:
            let vc = ColorsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .fonts:
            let vc = UIViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break

        /*Components*/
        case .button:
            let vc = StoryBookExampleViewController(
                title: "Buttons",
                components: [
                    .init(title: "Disabled state",      view: PrimaryBtn(text: "OK", state: .disabled)),
                    .init(title: "Enabled state",       view: PrimaryBtn(text: "Confirm Change", state: .enabled)),
                    .init(title: "Loading state",       view: PrimaryBtn(text: "OK", state: .loading)),
                    .init(title: "Trucated text",       view: PrimaryBtn(text: "This is a way to long text to be displayed", state: .enabled)),
                    .init(title: "Shadow background",   view: PrimaryBtn(text: "Submit"), color: R.color.blueGrey()!),
                ])
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .input:
            let vc = FieldViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .theVoice:
            let vc = TheVoiceViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.hero.isEnabled = true
            vc.hero.modalAnimationType = .zoom
            self.present(vc, animated: true)
            break
            
        case .itemAction:
            let vc = SettingsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .itemNaming:
            let vc = ItemNamingViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .cellsRadioBtn:
            let vc = RadioBtnViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .days:
            let vc = DayBoxViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case .navBars:
            let vc = NavBarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .divider:
            let vc = DividerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        
        case .autocomplete:
            let vc = AutocompleteViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .calendar:
            let vc = CalendarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .time:
            let vc = TimePickerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break

        case .modal:
//            let popup = DSPopupDialogManager()
//            popup.displayDesignSystemPopup(controller: self, emoji: "😀", title: "This is a god damn very long title to show my support to this beautiful long title.", body: "This is a paragraph to explain what is happening and it's happening a lot of nothing here.", okLbl: "That's OK to me", cancelLbl: "I don't like the idea", okHandler: {}, cancelHandler: {})
            break
        }
    }
    
    fileprivate func presentWithNavigationController(viewController: UIViewController ) {
        let nvc = UINavigationController(rootViewController: viewController)
        nvc.isNavigationBarHidden = true
        //nvc.hero.isEnabled = false
        nvc.modalPresentationStyle = .overCurrentContext
        
        self.present(nvc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == viewModel.sections.count - 1 {
            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
            return Subtitle(text: "Created with 💜 by iOS Team\nRainbow v\(appVersion)")
        } else {
            return UIView(frame: .zero)
        }
    }
    
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animation.pause()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        animation.play()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            animation.play()
        }
    }
}
