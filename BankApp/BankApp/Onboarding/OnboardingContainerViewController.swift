//
//  OnboardingContainer.swift
//  BankApp
//
//  Created by zhanybek salgarin on 5/28/23.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didPressDoneButton()
}

class OnboardingContainerViewController: UIViewController {
    
    weak var onboardingContainerDelegate: OnboardingContainerViewControllerDelegate?
    
    let buttonsView = ButtonsView()
    
    var pagesVC: [UIViewController] = [OnboardingViewController(onboardingImage: "Saly-2",
                                                                with: "Welcome to your personal banking App. See your daily updates"),
                                       OnboardingViewController(onboardingImage: "Saly-44",
                                                                with: "Move your money around the word quickly and securely"),
                                       OnboardingViewController(onboardingImage: "Saly-6",
                                                                with: "Learn more at www.bank.com")]
    
    let pageVeiwController: UIPageViewController
    
    var currentIndex: Int = 0
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageVeiwController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 248 / 255.0, green: 96 / 255.0, blue: 47 / 255.0, alpha: 1.0)
        configure()
    }
    
    func configure() {
        
        addChild(pageVeiwController)
        view.addSubview(pageVeiwController.view)
        view.addSubview(buttonsView)
        
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        pageVeiwController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttonsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            buttonsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            buttonsView.heightAnchor.constraint(equalToConstant: 100),
            
            pageVeiwController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageVeiwController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            pageVeiwController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            pageVeiwController.view.bottomAnchor.constraint(equalTo: buttonsView.topAnchor)
        ])
        
        pageVeiwController.didMove(toParent: self)
        pageVeiwController.dataSource = self
        pageVeiwController.delegate = self
        pageVeiwController.setViewControllers([pagesVC[currentIndex]], direction: .forward, animated: true)
        
        buttonsView.backButton.addTarget(self, action: #selector(backTapped), for: .primaryActionTriggered)
        buttonsView.nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
        buttonsView.doneButton.addTarget(self, action: #selector(doneTapped), for: .primaryActionTriggered)
    }
    
    override func viewDidLayoutSubviews() {
//        pageVeiwController.view.frame = view.bounds
    }
    
    private func navigatePreviousPage() {
        
        guard let firstVC = pageVeiwController.viewControllers?.first,
              let index = pagesVC.firstIndex(of: firstVC),
              index - 1 >= 0 else { return }
        currentIndex = index - 1
        pageVeiwController.setViewControllers([pagesVC[index - 1]], direction: .reverse, animated: true)
        updateButtons(with: index - 1)
    }
    
    private func navigateNextPage() {
        
        guard let firstVC = pageVeiwController.viewControllers?.last,
              let index = pagesVC.firstIndex(of: firstVC),
              index + 1 < pagesVC.count else { return }
        currentIndex = index + 1
        pageVeiwController.setViewControllers([pagesVC[index + 1]], direction: .forward, animated: true)
        updateButtons(with: index + 1)
    }
    
    private func updateButtons(with index: Int) {
        buttonsView.nextButton.isHidden = index == pagesVC.count - 1 ? true: false
        buttonsView.backButton.isHidden = index == 0 ? true : false
        buttonsView.doneButton.isHidden = index == pagesVC.count - 1 ? false : true
    }
}

extension OnboardingContainerViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pagesVC.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        return pagesVC[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pagesVC.firstIndex(of: viewController), index + 1 < pagesVC.count else { return nil }
        return pagesVC[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pagesVC.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let firstVC = pageVeiwController.viewControllers?.first,
              let index = pagesVC.firstIndex(of: firstVC) else { return }
        updateButtons(with: index)
    }
}

extension OnboardingContainerViewController {
    @objc func backTapped() {
        navigatePreviousPage()
    }
    
    @objc func nextTapped() {
        navigateNextPage()
    }
    
    @objc func doneTapped() {
        onboardingContainerDelegate?.didPressDoneButton()
        print("Did tap done button")
    }
}

