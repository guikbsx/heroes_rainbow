import UIKit

class RadioBtnViewController: UIViewController {

    // MARK: - Properties
    
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
        return tableView
    }()
    
    fileprivate let ages: [String] = ["over 16", "over 18", "Military veteran"]
    fileprivate var selectedAge: String?

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        let radioTitle = Subtitle(text: "Radio Button")
        view.addSubview(radioTitle)
        radioTitle.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)

        view.addSubview(radioTableView)
        radioTableView.anchor(top: radioTitle.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

extension RadioBtnViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RadioButtonCell") as! ItemChoice
        let cellAge = ages[indexPath.row]
        if let _ = selectedAge, selectedAge! == cellAge {
            cell.setup(label: cellAge, selected: true)
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        } else {
            cell.setup(label: cellAge, selected: false)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAge = ages[indexPath.row]
        tableView.reloadData()
    }
}
