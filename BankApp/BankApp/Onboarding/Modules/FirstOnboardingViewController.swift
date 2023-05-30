//
//  FirstOnboardingViewController.swift
//  BankApp
//
//  Created by zhanybek salgarin on 5/30/23.
//

import UIKit

class FirstOnboardingViewController: UIViewController {
    
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
        image.contentMode = .scaleAspectFill
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
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.systemPink, for: .highlighted)
        button.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        return button
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

extension FirstOnboardingViewController {
    
    func configure() {
        
        view.addSubview(cube)
        view.addSubview(stackView)
        view.addSubview(closeButton)
        
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
            cube.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
//            closeButton.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 8),
//            closeButton.heightAnchor.constraint(equalToConstant: 40),
//            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}


extension FirstOnboardingViewController {
    @objc private func closeTapped() {
        
    }
}
