//
//  NewDayDataConverter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class NewDayDataConverter: NewDayDataConverterInput {
    
    typealias exerciseCellConfig = TableCellConfigurator<TextWithArrowCell, TextWithArrowCell.Model>
    typealias addExerciseCellConfig = TableCellConfigurator<AddExerciseCell, AddExerciseCell.Model>
    
    func createView(exercises: [ExerciseModel]) -> NewDayViewModel {
        var rows: [NewDayViewModel.Row] = []
        
        for exercise in exercises {
            rows.append(.exercise(exerciseCellConfig(item: exercise.name)))
        }
        
        rows.append(.addExercise(addExerciseCellConfig(item: "Добавить упражнение")))
        
        return NewDayViewModel(rows: rows)
    }
}
