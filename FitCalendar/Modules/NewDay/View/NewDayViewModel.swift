//
//  NewDayViewModel.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

struct NewDayViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case exercise(CellConfigurator)
        case addExercise(CellConfigurator)
        
        var identifier: String {
            return type(of: configurator).reuseId
        }
        
        var configurator: CellConfigurator {
            
            switch self {
            case .exercise(let config):         return config
            case .addExercise(let config):      return config
            }
            
        }
    }
    
}
