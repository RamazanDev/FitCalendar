//
//  NewDayDataConverter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class NewDayDataConverter: NewDayDataConverterInput {
    func createView() -> NewDayViewModel {
        var rows: [NewDayViewModel.Row] = []
        
        return NewDayViewModel(rows: rows)
    }
}
