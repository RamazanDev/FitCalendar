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
        let nav = UINavigationController()
        nav.viewControllers = [view]
        
        let router = MainCalendarRouter(transition: view)
        let coreFactory = CompositionFactory.shared.core
        let dataConverter = MainCalendarDataConverter()
        let presenter = MainCalendarPresenter(coreService: coreFactory,
                                              router: router,
                                              dataProvider: dataConverter)
        
        view.presenter = presenter
        presenter.view = view

        
        return nav
    }
}
