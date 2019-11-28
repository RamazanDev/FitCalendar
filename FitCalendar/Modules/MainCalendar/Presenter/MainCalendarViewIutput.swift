//
//  MainCalendarViewIutput.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 26.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

protocol MainCalendarViewOutput {
    func viewIsReady()
    func didSelectRow(rowType: MainCalendarViewModel.Row, index: Int)
}
