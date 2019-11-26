//
//  CoreFactory.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 26.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import RealmSwift
import FieryCrucible

final class CoreFactory: DependencyFactory {
    
    var realm: Realm {
        return unshared(factory: {
            return try! Realm()
        })
    }
    
}
