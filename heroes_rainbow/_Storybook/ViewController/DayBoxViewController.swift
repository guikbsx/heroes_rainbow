import UIKit

class DayBoxViewController: UIViewController {

    // MARK: - Properties

    lazy private var headerView: UIView = {
        let view = UIView()
        return view
    }()

    private let headerTitleLbl = UILabel()
    
    lazy private var daysTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(DayBox.self, forCellReuseIdentifier: "DayBoxCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layoutIfNeeded()
        tableView.tableFooterView = UIView()
        tableView.layoutMargins = .zero
        tableView.contentInset = .zero
        tableView.backgroundColor = .white
        tableView.tag = 1
        tableView.layoutIfNeeded()
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        return tableView
    }()
    
    fileprivate let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    fileprivate var selectedSchedules:[[Bool]] = [[true, false, true],[true, false, false],[false, false, false],[false, false, false],[false, false, false],[false, false, true],[false, false, false]]

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        daysTableView.layoutIfNeeded()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        let settingsTitle = Subtitle(text: "Day Box")
        view.addSubview(settingsTitle)
        settingsTitle.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        view.addSubview(daysTableView)
        daysTableView.anchor(top: settingsTitle.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

extension DayBoxViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayBoxCell") as! DayBox
        cell.setup(day: indexPath.row, label: days[indexPath.row], schedules: selectedSchedules[indexPath.row] )
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
}

extension DayBoxViewController: DayBoxDelegate {
    func availabilitySelected(day: Int, meridian: Int, value: Bool) {
        print("availabilitySelected : \(day) - \(meridian) - \(value)")
        selectedSchedules[day][meridian] = value
    }
}
