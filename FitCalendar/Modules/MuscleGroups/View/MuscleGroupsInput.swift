//
//  MuscleGroupsInput.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

protocol MuscleGroupsInput: class {
    func setup(groups: [MuscleGroupModel])
    func openExercisesModule(model: MuscleGroupModel)
}
