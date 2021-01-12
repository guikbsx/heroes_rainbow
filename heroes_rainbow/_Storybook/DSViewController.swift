import Foundation
import UIKit

class DSViewController: UITableViewController {

    private let viewModel: DSViewModel!

    public init(viewModel: DSViewModel = DSViewModel()) {
        self.viewModel = viewModel
        super.init(style: .grouped)
        title = "Rainbow"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
//        UserManager.shared().getMe { user in
//            print("load user...")
//        }
        
        class SubtitleCell: UITableViewCell {
            override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
            }
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
        
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
        tableView.register(ItemAction.self, forCellReuseIdentifier: "IconNavCell")
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        self.navigationController?.navigationBar.isHidden = false
        
//        /*TEST*/
//        let vc = TimePickerViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//        /*TEST*/
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    override public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.section(at: section).name
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.section(at: section).designSystems.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let designSystem = viewModel.designSystem(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconNavCell") as! ItemAction
        cell.setup(name: designSystem.label, image: nil)
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
            let vc = ButtonViewController()
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
            let popup = DSPopupDialogManager()
            popup.displayDesignSystemPopup(controller: self, emoji: "😀", title: "This is a title", body: "This is a paragraph to explain what is happening", okLbl: "That's OK to me", cancelLbl: "I don't like the idea", okHandler: {}, cancelHandler: {})
            break
        }
    }
    
    fileprivate func presentWithNavigationController(viewController: UIViewController ) {
        let nvc = UINavigationController(rootViewController: viewController)
        nvc.isNavigationBarHidden = true
        //nvc.hero.isEnabled = false
        nvc.modalPresentationStyle = .overCurrentContext
        
        self.present(nvc, animated: false, completion: nil)
    }
    
    


}

