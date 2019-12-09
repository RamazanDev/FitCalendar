//
//  ProfileViewModel.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

struct ProfileViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case allExercises(CellConfigurator)
        case records(CellConfigurator)
        case statisticsOfVisitings(CellConfigurator)
        case separator(CellConfigurator)
        case parametersOfBody(CellConfigurator)
        case settings(CellConfigurator)
        case userInfo(CellConfigurator)
        
        var identifier: String {
            return type(of: configurator).reuseId
        }
        
        var configurator: CellConfigurator {
            
            switch self {
            case .allExercises(let config):             return config
            case .records(let config):                  return config
            case .separator(let config):                return config
            case .statisticsOfVisitings(let config):    return config
            case .parametersOfBody(let config):         return config
            case .settings(let config):                 return config
            case .userInfo(let config):                 return config
                
            }
            
        }
    }
    
}
