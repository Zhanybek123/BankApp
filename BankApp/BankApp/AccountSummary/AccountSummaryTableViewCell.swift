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
    
    let deviderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = appColor
        return view
    }()
    
    let accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "Account name"
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let balanceStackVeiw: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "Balance"
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let balanceAmountLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "$929,466,63"
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let chevronImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")?.withTintColor(appColor, renderingMode: .alwaysOriginal)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        contentView.addSubview(deviderView)
        contentView.addSubview(accountNameLabel)
        contentView.addSubview(balanceStackVeiw)
        contentView.addSubview(chevronImageView)
        
        balanceStackVeiw.addArrangedSubview(balanceLabel)
        balanceStackVeiw.addArrangedSubview(balanceAmountLabel)
        
        balanceStackVeiw.distribution = .fillEqually
        balanceStackVeiw.alignment = .trailing
        balanceStackVeiw.spacing = 4
        balanceStackVeiw.axis = .vertical
        
        NSLayoutConstraint.activate([
            accountTypeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            accountTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            deviderView.topAnchor.constraint(equalTo: accountTypeLabel.bottomAnchor, constant: 8),
            deviderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            deviderView.widthAnchor.constraint(equalToConstant: contentView.bounds.width / 4),
            deviderView.heightAnchor.constraint(equalToConstant: 4),
            
            accountNameLabel.topAnchor.constraint(equalTo: deviderView.bottomAnchor, constant: 16),
            accountNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            balanceStackVeiw.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            balanceStackVeiw.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -8),
            
            chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
    }
}
