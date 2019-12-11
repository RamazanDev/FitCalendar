//
//  ResourcesFactory.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import FieryCrucible

final class ResourcesFactory: DependencyFactory {
    
    private var arrayData = [   MuscleGroupModel(image: UIImage(named: "dumbbell")!, name: "Бицепс"),
                                MuscleGroupModel(image: UIImage(named: "dumbbell")!, name: "Трицепс"),
                                MuscleGroupModel(image: UIImage(named: "dumbbell")!, name: "Спина"),
                                MuscleGroupModel(image: UIImage(named: "dumbbell")!, name: "Ноги"),
                                MuscleGroupModel(image: UIImage(named: "dumbbell")!, name: "Грудь"),
                                MuscleGroupModel(image: UIImage(named: "dumbbell")!, name: "Пресс"),
                                MuscleGroupModel(image: UIImage(named: "dumbbell")!, name: "Шея"),
                                MuscleGroupModel(image: UIImage(named: "dumbbell")!, name: "Плечи")]
    
    var muscleGroups: [MuscleGroupModel] {
        return unshared(factory: {
            return arrayData
        })
    }
    
}
