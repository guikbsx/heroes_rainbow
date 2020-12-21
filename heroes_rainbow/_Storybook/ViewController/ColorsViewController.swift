//
//  DSColorsViewController.swift
//  heroes
//
//  Created by Guillaume Bisiaux on 10/11/2020.
//  Copyright © 2020 wpeople. All rights reserved.
//

import UIKit

struct DesignSystemsColor {
    let name: String
    let backgroundColor: UIColor
    let textColor: UIColor
    let hex: String
}

class ColorsViewController: UIViewController {

    // MARK: - Properties

    lazy private var headerView: UIView = {
        let view = UIView()
        return view
    }()

    private let headerTitleLbl = UILabel()
    
    lazy private var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(ItemAction.self, forCellReuseIdentifier: "ItemNav")
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
    
    fileprivate let designSystemsColor: [DesignSystemsColor] = [
        DesignSystemsColor(name: "Turquoise",       backgroundColor: R.color.turquoise()!,      textColor: .white, hex: "81FFD7"),
        DesignSystemsColor(name: "Pink",            backgroundColor: R.color.pink()!,           textColor: .white, hex: "E46EF8"),
        DesignSystemsColor(name: "Purple",          backgroundColor: R.color.purple()!,         textColor: .white, hex: "5F6BEF"),
        DesignSystemsColor(name: "Blue Grey",       backgroundColor: R.color.blueGrey()!,       textColor: .white, hex: "5F6BEF"),
        DesignSystemsColor(name: "Light Blue Grey", backgroundColor: R.color.lightBlueGrey()!,  textColor: .white, hex: "99A3C1"),
        DesignSystemsColor(name: "Bold Grey",       backgroundColor: R.color.boldGrey()!,       textColor: .white, hex: "979797"),
        DesignSystemsColor(name: "Light Grey",      backgroundColor: R.color.lightGrey()!,      textColor: .black, hex: "F2F2F2"),
        DesignSystemsColor(name: "Light Red",       backgroundColor: R.color.lightRed()!,       textColor: .white, hex: "FF6C6C"),
        DesignSystemsColor(name: "White",           backgroundColor: .white,                    textColor: .black, hex: "FFFFFF"),
        DesignSystemsColor(name: "Black",           backgroundColor: .black,                    textColor: .white, hex: "000000"),
    ]

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(settingsTableView)
        settingsTableView.fillSuperviewSafeAreaLayoutGuide()
    }
}

extension ColorsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return designSystemsColor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemNav") as! ItemAction
        cell.setupAsColorCell(name: "\(designSystemsColor[indexPath.row].name) (#\(designSystemsColor[indexPath.row].hex))", backgroundColor: designSystemsColor[indexPath.row].backgroundColor, textColor: designSystemsColor[indexPath.row].textColor)
        return cell
    }

}
