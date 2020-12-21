import UIKit

struct CategorySettings {
    let name: String
    let image: UIImage!
}

class CellViewController: UIViewController {

    // MARK: - Properties

    lazy private var headerView: UIView = {
        let view = UIView()
        return view
    }()

    private let headerTitleLbl = UILabel()
    
    lazy private var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(ItemAction.self, forCellReuseIdentifier: "IconNavCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layoutIfNeeded()
        tableView.tableFooterView = UIView()
        tableView.layoutMargins = .zero
        tableView.contentInset = .zero
        tableView.backgroundColor = .white
        tableView.tag = 1
        return tableView
    }()
    
    lazy private var radioTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(ItemChoice.self, forCellReuseIdentifier: "RadioButtonCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layoutIfNeeded()
        tableView.tableFooterView = UIView()
        tableView.layoutMargins = .zero
        tableView.contentInset = .zero
        tableView.backgroundColor = .white
        tableView.tag = 2
        return tableView
    }()
    
    fileprivate let settings: [CategorySettings] = [
        CategorySettings(name: "Edit your full name", image: R.image.fullNameIcon()),
        CategorySettings(name: "Edit your birthday", image: R.image.birthdayIcon()),
        CategorySettings(name: "Rate us", image: R.image.rateIcon()),
        CategorySettings(name: "Report a problem", image: R.image.reportIcon()),
        CategorySettings(name: "Delete your account", image: R.image.reportIcon())
    ]
    fileprivate let ages: [String] = ["over 16", "over 18", "Military veteran"]
    fileprivate var selectedAge: String?

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        let settingsTitle = Subtitle(text: "Nav Button")
        view.addSubview(settingsTitle)
        settingsTitle.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        view.addSubview(settingsTableView)
        settingsTableView.anchor(top: settingsTitle.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: UIScreen.main.bounds.height / 3))
        
        let radioTitle = Subtitle(text: "Radio Button")
        view.addSubview(radioTitle)
        radioTitle.anchor(top: settingsTableView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)

        view.addSubview(radioTableView)
        radioTableView.anchor(top: radioTitle.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)

        

    }
}

extension CellViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 1:
            return settings.count
        case 2:
            return ages.count
        default:
            return 0
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView.tag {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IconNavCell") as! ItemAction
            cell.setup(name: settings[indexPath.row].name, image: settings[indexPath.row].image)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RadioButtonCell") as! ItemChoice
            let cellAge = ages[indexPath.row]
            if let _ = selectedAge, selectedAge! == cellAge {
                cell.setup(label: cellAge, selected: true)
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            } else {
                cell.setup(label: cellAge, selected: false)
            }
            return cell
        default: break
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconNavCell") as! ItemAction
        cell.setup(name: settings[indexPath.row].name, image: settings[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 2 {
            selectedAge = ages[indexPath.row]
        }
        
        tableView.reloadData()
    }
    


    
    
}
