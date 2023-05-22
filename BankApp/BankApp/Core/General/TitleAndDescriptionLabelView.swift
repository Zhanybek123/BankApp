//
//  TitleAndDescriptionLabelView.swift
//  BankApp
//
//  Created by zhanybek salgarin on 5/22/23.
//

import UIKit

class TitleAndDescriptionLabelView: UIView {
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "MyBank"
        label.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .largeTitle), size: 40)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Your premium banking service"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitleAndDescriptionLabelView {
    
    func layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [titleLabel, descriptionLabel].forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor)
        ])
    }
}
