//
//  ButtonsView.swift
//  BankApp
//
//  Created by zhanybek salgarin on 5/31/23.
//

import UIKit

class ButtonsView: UIView {

    private(set) var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemPink, for: .highlighted)
        button.isHidden = true
        return button
    }()
    
    private(set) var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.systemPink, for: .highlighted)
        return button
    }()
    
    private(set) var doneButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.systemPink, for: .highlighted)
        button.isHidden = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        
        self.addSubview(backButton)
        self.addSubview(nextButton)
        self.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            nextButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nextButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            doneButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            doneButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
            ])
        
    }
}
