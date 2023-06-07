//
//  AccountSummaryTableViewCell.swift
//  BankApp
//
//  Created by zhanybek salgarin on 6/7/23.
//

import UIKit

class AccountSummaryTableViewCell: UITableViewCell {
    
    static let cellID = "AccountSummaryTableViewCell"
    
    let accountTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.text = "Account type"
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.addSubview(accountTypeLabel)
        
        NSLayoutConstraint.activate([
            accountTypeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            accountTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
    }
}
