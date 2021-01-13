import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties
    
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

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(settingsTableView)
        settingsTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconNavCell") as! ItemAction
        
        switch indexPath.row {
        case 0 :
            cell.setup(name: "Edit your full name", image: R.image.fullNameIcon())
        case 1:
            cell.setupWithInfo(schedule: Date(), duration: 60)
        case 2:
            cell.setupAsDelete(text: "Delete This hiring event  🗑")
        default : break
        }
        
        return cell
    }

}
