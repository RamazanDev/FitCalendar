//
//  ActiveExerciseAssembly.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ActiveExerciseAssembly {
    static func assembly(exercisePrimaryKey: String) -> UIViewController{
        let vc = ActiveExerciseVC()
        let dataSource = ActiveExerciseTableDataSource()
        let coreService = CompositionFactory.shared.core
        let presenter = ActiveExercisePresenter(coreService: coreService, dataSource: dataSource, primaryKey: exercisePrimaryKey)
        
        dataSource.delegate = presenter
        
        vc.dataSource = dataSource
        vc.presenter = presenter
        
        presenter.view = vc
        
        return vc
    }
}
