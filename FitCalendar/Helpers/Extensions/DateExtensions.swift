//
//  DateExtensions.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 25.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//
import Foundation

extension Date {
    
    func stringValueFullWithTime(format: String = "EEEE") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "RU")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self).capitalizingFirstLetter()
    }
}
