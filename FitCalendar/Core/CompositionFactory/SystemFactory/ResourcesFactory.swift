//
//  ResourcesFactory.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import FieryCrucible

final class ResourcesFactory: DependencyFactory {
    
    private var arrayData = [MuscleGroupModel(id: "0", image: UIImage(named: "dumbbell")!, name: "Все упражнения"),
                             MuscleGroupModel(id: "1", image: UIImage(named: "dumbbell")!, name: "Бицепс"),
                             MuscleGroupModel(id: "2", image: UIImage(named: "dumbbell")!, name: "Трицепс"),
                             MuscleGroupModel(id: "3", image: UIImage(named: "dumbbell")!, name: "Спина"),
                             MuscleGroupModel(id: "4", image: UIImage(named: "dumbbell")!, name: "Ноги"),
                             MuscleGroupModel(id: "5", image: UIImage(named: "dumbbell")!, name: "Грудь"),
                             MuscleGroupModel(id: "6", image: UIImage(named: "dumbbell")!, name: "Пресс"),
                             MuscleGroupModel(id: "7", image: UIImage(named: "dumbbell")!, name: "Шея"),
                             MuscleGroupModel(id: "8", image: UIImage(named: "dumbbell")!, name: "Плечи")]
    
    var muscleGroups: [MuscleGroupModel] {
        return unshared(factory: {
            return arrayData
        })
    }
    
}
