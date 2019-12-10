//
//  MuscleGroupsAssembly.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MuscleGroupsAssembly {
    static func assembly() -> UIViewController {
        let vc = MuscleGroupsVC()
        let resourcesFactory = CompositionFactory.shared.resources
        let presenter = MuscleGroupsPresenter(resourcesFactory: resourcesFactory)
        
        vc.presenter = presenter
        presenter.view = vc
        
        return vc
    }
}
