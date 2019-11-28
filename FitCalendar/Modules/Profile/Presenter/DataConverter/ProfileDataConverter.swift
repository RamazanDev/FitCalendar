//
//  ProfileDataConverter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class ProfileDataConverter: ProfileDataConverterInput {
    func createView() -> ProfileViewModel {
        var rows: [ProfileViewModel.Row] = []
        
        return ProfileViewModel(rows: rows)
    }
}
