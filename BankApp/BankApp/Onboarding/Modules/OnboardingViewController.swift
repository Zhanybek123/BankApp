//
//  FirstOnboardingViewController.swift
//  BankApp
//
//  Created by zhanybek salgarin on 5/30/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let onboardingImage: String
    let text: String
    
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
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .yellow
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    init(onboardingImage: String, with text: String) {
        self.onboardingImage = onboardingImage
        self.text = text
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1, green: 0.498, blue: 0.314, alpha: 1)
        configure()
    }
}

extension OnboardingViewController {
    
    func configure() {
        
        view.addSubview(cube)
        view.addSubview(stackView)
        
        imageView.image = UIImage(named: onboardingImage)
        label.text = text
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
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
