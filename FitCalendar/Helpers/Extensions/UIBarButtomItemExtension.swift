//
//  UIBarButtomItemExtension.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    func addTargetForAction(target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
    
}
