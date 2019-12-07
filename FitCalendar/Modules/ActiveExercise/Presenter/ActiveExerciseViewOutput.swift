//
//  ActiveExerciseViewOutput.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

protocol ActiveExerciseViewOutput {
    func viewIsReady()
    func addRepetition(weight: Float, count: Int)
    func weightIsClicked()
    func countIsClicked()
}
