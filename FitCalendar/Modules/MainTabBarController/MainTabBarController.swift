//
//  MainTabBarController.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 27.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupTabBar()
    }
    
    // MARK: - Setup tabBar funcs
    
    private func setupTabBar() {
        delegate = self
        tabBar.unselectedItemTintColor = .gray
        UITabBar.appearance().tintColor = .white
        tabBar.backgroundColor = .black
        
        var modules: [UIViewController] = []
        modules.append(createCalendarModule())
        modules.append(createProfileModule())
        viewControllers = modules
    }
    
    // MARK: - Create screens for tabBar
    
    private func createCalendarModule() -> UIViewController {
        let vc = MainCalendarAssembly.assembly()
        vc.tabBarItem.image = UIImage(named: "calendarIcon")
        vc.tabBarItem.title = "Календарь"
        
        return vc
    }
    
    private func createProfileModule() -> UIViewController {
        let vc  = ProfileAssembly.assembly()
        vc.tabBarItem.image = UIImage(named: "profileIcon")
        vc.tabBarItem.title = "Профиль"
        
        return vc
    }
    
}

// MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false
        }
        
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
        }
        return true
    }
}

