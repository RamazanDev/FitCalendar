//
//  ResourcesFactory.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import FieryCrucible

final class ResourcesFactory: DependencyFactory {
    
    var muscleGroups: [MuscleGroupModel] {
        return unshared(factory: {
            return [MuscleGroupModel(image: #imageLiteral(resourceName: "calendarIcon"), name: "a")]
        })
    }
    
}
