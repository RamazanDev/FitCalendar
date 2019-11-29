//
//  NewDayDataConverterInput.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

protocol NewDayDataConverterInput {
    func createView(exercises: [ExerciseModel]) -> NewDayViewModel
}
