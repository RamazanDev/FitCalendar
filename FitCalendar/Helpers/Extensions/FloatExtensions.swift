//
//  FloatExtensions.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 07.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import Foundation

extension Float {
    func preparingForShowIntOrFloatDescription() -> String {
        return floor(self) == self ? Int(self).description : self.description
    }
}
