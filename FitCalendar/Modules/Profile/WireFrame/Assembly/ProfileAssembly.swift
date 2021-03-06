//
//  ProfileAssembly.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ProfileAssembly {
    static func assembly() -> UIViewController {
        let view = ProfileVC()
        let router = ProfileRouter(transition: view)
        let dataConverter = ProfileDataConverter()
        let presenter = ProfilePresenter(dataProvider: dataConverter,
                                         router: router)
        
        view.presenter = presenter
        presenter.view = view
        
        let nav = UINavigationController()
        nav.viewControllers = [view]
        
        return nav
    }
}
