//
//  AccountSummaryViewController.swift
//  BankApp
//
//  Created by zhanybek salgarin on 6/5/23.
//

import Foundation
import UIKit

class AccountSummaryViewController: UIViewController {
    
    let dummyData = [ "Something1", "Something2", "Something3" ]
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.register(AccountSummaryTableViewCell.self, forCellReuseIdentifier: AccountSummaryTableViewCell.cellID)
        return table
    }()
    
    var header: AccountSummaryHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        configureHeaderView()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//    }
    
    func configure() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureHeaderView() {
        header = AccountSummaryHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 150))
//        var size = header.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize)
//        size.width = UIScreen.main.bounds.width
//        header.frame.size = size
        
        tableView.tableHeaderView = header
        configureHeaderViewProperties()
    }
    
    func configureHeaderViewProperties() {
        header?.bankNameLabel.text = "FreedomBank"
        header?.greatingLabel.text = "Good day,"
        header?.userNameLabel.text = "Kelsey"
        header?.dateLabel.text = "June 6, 2023"
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryTableViewCell.cellID) else { return UITableViewCell() }
        return cell
    }
}
