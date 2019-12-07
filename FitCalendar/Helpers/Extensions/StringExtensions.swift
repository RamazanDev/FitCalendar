//
//  StringExtensions.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 26.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
}

extension RangeReplaceableCollection where Self: StringProtocol {
    var digits: Self {
        return filter({ $0.isNumber })
    }
    
    mutating func removeAllNonNumeric() {
        removeAll { !$0.isNumber }
    }
}
