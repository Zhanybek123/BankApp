//
//  MainTabBarViewController.swift
//  BankApp
//
//  Created by zhanybek salgarin on 6/5/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    private var navigattionControllers: [UINavigationController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStatusBar()
        setupTabBar()
        
        let summaryVC = UINavigationController(rootViewController: VC1())
        let moneyVC = UINavigationController(rootViewController: VC2())
        let moreVC  = UINavigationController(rootViewController: Vc3())
        
        summaryVC.tabBarItem = UITabBarItem(title: "Summary", image: UIImage(systemName: "list.dash.header.rectangle"), tag: 0)
        moneyVC.tabBarItem = UITabBarItem(title: "Move Money", image: UIImage(systemName: "arrow.left.arrow.right"), tag: 0)
        moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis.circle"), tag: 0)
        
        navigattionControllers = [summaryVC, moneyVC, moreVC]
        
        viewControllers = navigattionControllers
    }
}

extension MainTabBarController  {
    
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = appColor
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    func setupTabBar() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
        UITabBar.appearance().backgroundColor = .systemPink
        tabBar.tintColor = appColor
    }
    
}

class VC1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

class VC2: UIViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

class Vc3: UIViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
