//
//  FirstOnboardingViewController.swift
//  BankApp
//
//  Created by zhanybek salgarin on 5/30/23.
//

import UIKit

class FirstOnboardingViewController: UIViewController {
    
    let cube = CubeView()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 0
        return stack
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Saly-2")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .yellow
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to your personal banking App. See your daily updates"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1, green: 0.498, blue: 0.314, alpha: 1)
        configure()
    }
}

extension FirstOnboardingViewController {
    
    func configure() {
        
        view.addSubview(cube)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        cube.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            cube.topAnchor.constraint(equalTo: view.centerYAnchor),
            cube.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cube.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cube.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
