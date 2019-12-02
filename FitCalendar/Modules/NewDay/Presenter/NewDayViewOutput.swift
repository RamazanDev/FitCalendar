//
//  NewDayViewOutput.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

protocol NewDayViewOutput {
    func viewIsReady()
    func didSelectRow(type: NewDayViewModel.Row, index: Int)
    func addExercise(with name: String)
    func removeExercise(with id: Int)
}
