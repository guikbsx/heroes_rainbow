//
//  DSAutocompleteViewController.swift
//  heroes
//
//  Created by Guillaume Bisiaux on 12/11/2020.
//  Copyright © 2020 wpeople. All rights reserved.
//

import UIKit

class AutocompleteViewController: UIViewController {

    // MARK: - Properties

    lazy private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(AutocompleteAddress.self, forCellReuseIdentifier: "AutocompleteAddress")
        tableView.register(AutocompleteGeoloc.self, forCellReuseIdentifier: "AutocompleteGeoloc")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layoutIfNeeded()
        tableView.tableFooterView = UIView()
        tableView.layoutMargins = .zero
        tableView.contentInset = .zero
        tableView.backgroundColor = .white
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        tableView.tableHeaderView = UIView(frame: frame)
        return tableView
    }()
    // MARK: - Init
    
    override func viewDidLoad() {
        configure()
    }
    
    // MARK: - Properties
    
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.fillSuperviewSafeAreaLayoutGuide()
    }
}

extension AutocompleteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AutocompleteGeoloc") as! AutocompleteGeoloc
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AutocompleteAddress") as! AutocompleteAddress
            cell.setup(address: NSAttributedString(string: "16 Rue Jean Jacques Rousseau"), city: NSAttributedString(string: "Cambrai, France"), separator: false)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AutocompleteAddress") as! AutocompleteAddress
            return cell
        }
    }
}
