//
//  AccountSummaryViewController.swift
//  BankApp
//
//  Created by zhanybek salgarin on 6/5/23.
//

import Foundation
import UIKit

class AccountSummaryViewController: UIViewController {
    
    var accounts = [MainTableViewCellModel]()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.register(AccountSummaryTableViewCell.self, forCellReuseIdentifier: AccountSummaryTableViewCell.cellID)
        table.rowHeight = 117
        return table
    }()
    
    var header: AccountSummaryHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        configureHeaderView()
        fetchData()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//    }
    
    func configure() {
        view.addSubview(tableView)
        tableView.backgroundColor = appColor
        
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
        
        tableView.tableHeaderView = header
        configureHeaderViewProperties()
    }
    
    func configureHeaderViewProperties() {
        header?.bankNameLabel.text = "FreedomBank"
        header?.greatingLabel.text = "Good day,"
        header?.userNameLabel.text = "Kelsey"
        header?.dateLabel.text = "June 6, 2023"
        
        header?.bankNameLabel.font = .preferredFont(forTextStyle: .title1)
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryTableViewCell.cellID) as? AccountSummaryTableViewCell else { return UITableViewCell() }
        let account = accounts[indexPath.row]
        cell.configureCell(with: account)
        return cell
    }
}

extension AccountSummaryViewController {
    func fetchData() {
        let savings = MainTableViewCellModel(accoundType: .savings, accountName: "FreedomBank", accountSummary: 929466.23)
        let visa = MainTableViewCellModel(accoundType: .creditCard, accountName: "Visa Flight Card", accountSummary: 18344.44)
        let checking = MainTableViewCellModel(accoundType: .checking, accountName: "Visa Checking", accountSummary: 5234.54)
        let masterCard = MainTableViewCellModel(accoundType: .checking, accountName: "MasterCard credit", accountSummary: 6634.31)
        let masterCardTarger = MainTableViewCellModel(accoundType: .creditCard, accountName: "MasterCard Target member credit", accountSummary: 3233.44)
        
        accounts = [savings, visa, checking, masterCard, masterCardTarger]
    }
}
