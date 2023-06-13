//
//  HeaderView.swift
//  BankApp
//
//  Created by zhanybek salgarin on 6/6/23.
//

import UIKit

class AccountSummaryHeaderView: UIView {
    
    let customView: UIView = {
        let view = UIView()
        view.backgroundColor = appColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let moonImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "moon.circle.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemBackground
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let stackView: UIStackView = {
        let scroll = UIStackView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let bankNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let greatingLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    let userNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 140)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = appColor
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        customView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(customView)
        addSubview(stackView)
        addSubview(moonImageView)
        
        stackView.addArrangedSubview(bankNameLabel)
        stackView.addArrangedSubview(greatingLabel)
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(dateLabel)
        
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0
        
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: moonImageView.leadingAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            moonImageView.topAnchor.constraint(equalTo: topAnchor),
            moonImageView.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8),
            moonImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            moonImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            moonImageView.widthAnchor.constraint(equalToConstant: bounds.width / 3)
        ])
    }
    
}
