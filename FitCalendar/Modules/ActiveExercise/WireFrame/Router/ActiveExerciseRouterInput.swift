//
//  ActiveExerciseRouterInput.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 07.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

protocol ActiveExerciseRouterInput {
    func showPickerPopUp(delegate: PickerOutput, dataArray: [String], type: PickerContentType)
}
