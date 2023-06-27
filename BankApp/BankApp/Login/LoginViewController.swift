//
//  ViewController.swift
//  BankApp
//
//  Created by zhanybek salgarin on 5/22/23.
//

import UIKit
protocol LogoutDelegate: AnyObject {
    func didLogout() 
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let titleAndDescriptionView = TitleAndDescriptionLabelView()
    let loginView = LoginView()
    
    weak var loginViewControllerDelegate: LoginViewControllerDelegate?
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle("Sign In", for: [])
        return button
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.text = "Error Failure"
        label.isHidden = true
        return label
    }()
    
    var username: String? {
        return loginView.userTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    //Animating constraints
    var leadingEdgeOnScreen = -16.0
    var leadingEdgeOffScreen = -1000.0
    var animationDuration = 1.0
    var titleLeadingAnchor: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addGradient()
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
        loginView.userTextField.text = ""
        loginView.passwordTextField.text = ""
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.clipsToBounds = true
        loginView.layer.cornerRadius = 8
        
        signInButton.addTarget(self, action: #selector(singInTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        view.addSubview(titleAndDescriptionView)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            titleAndDescriptionView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height/3.3),
            titleAndDescriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleAndDescriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleAndDescriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleAndDescriptionView.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: 40),
            
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            view.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: 8),
            
            signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 8),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            errorLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
        
        titleLeadingAnchor = titleAndDescriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:CGFloat(leadingEdgeOffScreen))
        titleLeadingAnchor?.isActive = true
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.orange.cgColor,
            UIColor.white.cgColor,
            UIColor.blue.cgColor
        ]
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
}

extension LoginViewController {
    
    @objc func singInTapped() {
        login()
    }
    
    func login() {
        guard let username = username, let password = password
        else {
            return assertionFailure("Username/Password must never be nil")
        }
        
        if username.isEmpty || password.isEmpty {
            configureErrorLabel(withMessage: "Username/Password must never be blank")
            return
        }
        
        if username == "Zhan" && password == "12345" {
            signInButton.configuration?.showsActivityIndicator = true
            loginViewControllerDelegate?.didLogin()
        } else {
            configureErrorLabel(withMessage: "Incorrect username/password")
        }
    }
    
    func configureErrorLabel(withMessage message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
        shakeButton()
    }
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        
        animation.isAdditive = true
        signInButton.layer.add(animation, forKey: "shake")
    }
}
    
extension LoginViewController {
    
    private func animate() {
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator.startAnimation()
    }
}
