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
        
        let summaryVC = UINavigationController(rootViewController: AccountSummaryViewController())
        let moneyVC = UINavigationController(rootViewController: VC2())
        let moreVC  = UINavigationController(rootViewController: Vc3())
        
        summaryVC.tabBarItem = UITabBarItem(title: "Summary",
                                            image: UIImage(systemName: "list.dash.header.rectangle")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), selectedImage: UIImage(systemName: "list.dash.header.rectangle")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.purple))
        
        moneyVC.tabBarItem = UITabBarItem(title: "Move Money",
                                          image: UIImage(systemName: "arrow.left.arrow.right")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), selectedImage: UIImage(systemName: "arrow.left.arrow.right")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.purple))
        
        moreVC.tabBarItem = UITabBarItem(title: "More",
                                         image: UIImage(systemName: "ellipsis.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), selectedImage: UIImage(systemName: "ellipsis.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.purple))
        
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]

        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = appColor
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        navigattionControllers = [summaryVC, moneyVC, moreVC]
        
        viewControllers = navigattionControllers
    }
    
}
//
//class VC1: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .blue
//    }
//}

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
