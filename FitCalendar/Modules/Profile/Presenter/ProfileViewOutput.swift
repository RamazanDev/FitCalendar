//
//  ProfileViewOutput.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

protocol ProfileViewOutput {
    func viewIsReady()
    func didSelectRow(type: ProfileViewModel.Row)
}
