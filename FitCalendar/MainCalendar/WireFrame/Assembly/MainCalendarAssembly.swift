//
//  MainCalendarAssembly.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 25.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MainCalendarAssembly {
    static func assembly() -> UIViewController {
        let view = MainCalendarVC()
        let router = MainCalendarRouter(view: view)
        let coreFactory = CompositionFactory.shared.core
        let presenter = MainCalendarPresenter(coreService: coreFactory,
                                              router: router)
        
        view.presenter = presenter
        presenter.view = view
        
        let date = Date()
        view.title = date.stringValueFullWithTime()
        let nav = UINavigationController()
        let navBar = nav.navigationBar
        navBar.prefersLargeTitles = true
        nav.viewControllers = [view]
        
        return nav
    }
}
