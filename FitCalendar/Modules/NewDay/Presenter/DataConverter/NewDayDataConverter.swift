//
//  NewDayDataConverter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class NewDayDataConverter: NewDayDataConverterInput {
    
    typealias exerciseCellConfig = TableCellConfigurator<TextWithArrowCell, TextWithArrowCell.Model>
    
    func createView(exercises: [ExerciseModel]) -> NewDayViewModel {
        var rows: [NewDayViewModel.Row] = []
        
        for exercise in exercises {
            rows.append(.exercise(exerciseCellConfig(item: exercise.name)))
        }
        
        return NewDayViewModel(rows: rows)
    }
}
