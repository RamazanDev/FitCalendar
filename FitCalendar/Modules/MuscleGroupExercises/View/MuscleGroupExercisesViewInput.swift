//
//  MuscleGroupExercisesViewInput.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 11.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

protocol MuscleGroupExercisesViewInput: class {
    func setTitle(_ title: String)
    func setup(exerciseTitles: [String])
    func showAlertForInputExreciseName()
}
