//
//  UIViewExtensions.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 07.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

extension UIView {
    
    func corner(angle: CGFloat) {
        self.layer.cornerRadius = angle
        self.clipsToBounds = true
    }
    
    func addShadow(radius: CGFloat = 5,
                   offset: CGSize = CGSize(width: 0, height: 8),
                   color: CGColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)) {
        layer.masksToBounds = false
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize(width: 0, height: 8)
        layer.shadowColor = color
        layer.shadowOpacity = 0.05
    }
    
}
