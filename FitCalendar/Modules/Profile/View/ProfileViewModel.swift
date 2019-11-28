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
        
        var identifier: String {
            return type(of: configurator).reuseId
        }
        
        var configurator: CellConfigurator {
            
            switch self {
                
            }
            
        }
    }
    
}
