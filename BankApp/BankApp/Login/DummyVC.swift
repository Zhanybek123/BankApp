//
//  DummyVC.swift
//  BankApp
//
//  Created by zhanybek salgarin on 6/5/23.
//

import Foundation
import UIKit

class DummyVC: UIViewController {
    
    weak var logoutDelegate: LogoutDelegate?
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.tintColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Dummy View Controller"
        configure()
    }
    
    func configure() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        button.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
    }
    
    @objc func didTapLogout() {
        logoutDelegate?.didLogout()
    }
}
