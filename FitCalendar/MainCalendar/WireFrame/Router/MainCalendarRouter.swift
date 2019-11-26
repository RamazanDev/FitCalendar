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
    
    private let view: UIViewController
    
    // MARK: - Init
    
    init(view: UIViewController) {
        self.view = view
    }
    
}

extension MainCalendarRouter: MainCalendarRouterInput {
    
}
