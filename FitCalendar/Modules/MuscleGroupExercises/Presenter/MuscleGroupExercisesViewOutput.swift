//
//  MuscleGroupExercisesViewOutput.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 11.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

protocol MuscleGroupExercisesViewOutput {
    func viewIsReady()
    func didSelectRow(index: Int)
    func plusButtonIsClicked()
    func removeAction(index: Int)
}
