//
//  MainCalendarRouter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 26.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MainCalendarRouter {
    
    // MARK: - Private properties
    
    private weak var transition: UIViewController?
    
    // MARK: - Init
    
    init(transition: UIViewController) {
        self.transition = transition
    }
    
}

// MARK: - MainCalendarRouterInput

extension MainCalendarRouter: MainCalendarRouterInput {
    func openNewDayModule() {
        let vc = NewDayAssembly.assembly()
        transition?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
