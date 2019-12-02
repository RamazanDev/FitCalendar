//
//  NewDayRouter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class NewDayRouter {
    
    // MARK: - Private properties
    
    private weak var transition: UIViewController?
    
    // MARK: - Init
    
    init(transition: UIViewController) {
        self.transition = transition
    }
    
}

// MARK: - ProfileRouterInput

extension NewDayRouter: NewDayRouterInput {
    
    func exerciseInfoModule(items: [KeyValue], title: String) {
        let vc = KeyValueVC()
        vc.setup(items: items, title: title)
        transition?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openActiveExerciseModule(with primaryKey: String) {
        let vc = ActiveExerciseAssembly.assembly(exercisePrimaryKey: primaryKey)
        transition?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
