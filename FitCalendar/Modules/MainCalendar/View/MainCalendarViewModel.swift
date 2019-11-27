//
//  MainCalendarViewModel.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 27.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

struct MainCalendarViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case simpleDay(CellConfigurator)
        case addDay(CellConfigurator)
        
        var identifier: String {
            return type(of: configurator).reuseId
        }
        
        var configurator: CellConfigurator {
            
            switch self {
            case .simpleDay(let config):            return config
            case .addDay(let config):               return config
                
            }
            
        }
    }
    
}
