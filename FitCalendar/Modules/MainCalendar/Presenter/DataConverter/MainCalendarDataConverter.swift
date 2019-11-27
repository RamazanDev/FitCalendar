//
//  MainCalendarDataConverter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 27.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//
import Foundation

protocol MainCalendarDataConverterInput {
    func createView(currentDate: Date, days: [DayModel]) -> MainCalendarViewModel
}

final class MainCalendarDataConverter: MainCalendarDataConverterInput {
    
    typealias simpleCellConfig = CollectionCellConfigurator<MainCalendarCell, MainCalendarCell.Model>
    typealias addDayCellConfig = CollectionCellConfigurator<AddTraningDayCollectionCell, AddTraningDayCollectionCell.Model>
    
    func createView(currentDate: Date, days: [DayModel]) -> MainCalendarViewModel {
        var rows: [MainCalendarViewModel.Row] = []
        
        if currentDate != days.first?.date {
            rows.append(.addDay(addDayCellConfig(item: AddTraningDayCollectionCell.Model())))
        }
        
        for day in days {
            rows.append(.simpleDay(simpleCellConfig(item: day)))
        }
        
        
        return MainCalendarViewModel(rows: rows)
    }
    
}
