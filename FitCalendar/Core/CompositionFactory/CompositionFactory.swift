//
//  CompositionFactory.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 26.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import FieryCrucible

final class CompositionFactory: DependencyFactory {
    
    static let shared = CompositionFactory()
    
    private override init() {
        super.init()
    }
    
    var core: CoreFactory {
        return weakShared(factory: {
            return CoreFactory()
        })
    }
}
