//
//  OnboardingContainer.swift
//  BankApp
//
//  Created by zhanybek salgarin on 5/28/23.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
 
    let pageVeiwController: UIPageViewController
    var pages: [UIViewController] = [VC1(), VC2(), VC3()]
    var currentVC: UIViewController {
        didSet {
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageVeiwController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        configure()
    }
    
    func configure() {
        addChild(pageVeiwController)
        view.addSubview(pageVeiwController.view)
        pageVeiwController.didMove(toParent: self)
        pageVeiwController.dataSource = self
        pageVeiwController.setViewControllers([pages.first!], direction: .forward, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        pageVeiwController.view.frame = view.bounds
    }
}

extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return currentVC
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return currentVC
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}


class VC1: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .red
    }
}

class VC2: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
    }
}

class VC3: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPink
    }
}


